import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsocks/domain/repository/admin_repository.dart';
import 'package:shopsocks/domain/repository/products_repository.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/order_model.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/cubit/orderCubit/order_cubit.dart';

part 'admin_cubit.freezed.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final ProductsRepository _productsRepository = ProductsRepository();
  final AdminRepository _adminRepository = AdminRepository();

  AdminCubit() : super(const Loading());

  Future<void> init() async {
    emit(const Intial());
  }

  Future<void> initState() async {
    Map result = await _adminRepository.getStats();
    emit(IntialStats(
        result['users'], result['orders'], result['basketProductStat']));
  }

  Future<void> addProduct(
      String article,
      String title,
      String price,
      String description,
      String size,
      String minamount,
      XFile? image,
      String? category) async {
    String base64Image = base64Encode(await image!.readAsBytes());
    String fileName = image.name;
    bool result = await _productsRepository.addProduct(article, title, price,
        description, size, minamount, base64Image, fileName, category ?? '');
    if (result) {
      emit(const Success());
    } else {
      emit(Error("Ошибка"));
    }
  }

  Future<void> addMassProduct(List products) async {
    int index = 0;
    List console = [];
    int addProduct = 0;
    int skipProduct = 0;
    int errorProduct = 0;
    for (int id = 0; id < products.length; id++) {
      final productCSV = products[id];
      String productCSVString =
          productCSV.toString().replaceAll('[', '').replaceAll(']', '');
      List<String> product = productCSVString.split(';');
      if (index > 0) {
        String article = product[0];
        String category = '';
        if (product[9].contains('Мужские') || product[10].contains('Мужские')) {
          category = 'muzhskie';
        } else if (product[9].contains('Женские') ||
            product[10].contains('Женские')) {
          category = 'ledi';
        } else if (product[9].contains('Детские') ||
            product[10].contains('Детские')) {
          category = 'kid';
        } else if (product[9].contains('Зимние') ||
            product[10].contains('Зимние')) {
          category = 'winter';
        }

        String title = product[1];

        double price =
            double.parse(product[2].replaceAll(',', '.').replaceAll(' ', ''));
        String size = product[3];
        List photo = product[4].split('.');
        String fileName = '${photo[0]}_middle.${photo[1]}';
        String urlPhoto =
            'https://optom-noski.com/pictures/product/middle/${photo[0]}_middle.${photo[1]}';
        int minamount = int.parse(product[7]);
        String description = product[5]
            .toString()
            .toString()
            .replaceAll('"', '')
            .replaceAll('<br />', '')
            .replaceAll('<br>', '')
            .replaceAll('<p/>', '')
            .replaceAll('&nbsp;', '')
            .replaceAll('<p>', '');

        Map result = await _productsRepository.addMassProduct(
            article,
            title,
            price.toString(),
            description,
            size,
            minamount.toString(),
            urlPhoto,
            fileName,
            category ?? '');

        if (result['result']) {
          if (result['log'] == 'addprod') {
            addProduct++;
            console.add({
              'type': 'add',
              'text': 'Товар добавлен в бд:',
              'article': "Артикул: $article"
            });
            Map resultTg = await _adminRepository.tgMessChanel(article, title,
                price, size, minamount.toString(), fileName, category ?? '');

            if (resultTg['result']) {
              console.add({
                'type': 'chanel',
                'text': 'Опубликован пост в тг:',
                'article': "Артикул: $article"
              });
            } else {
              console.add({
                'type': 'error',
                'text': 'Ошибка публикации поста',
                'article': "Артикул: $article"
              });
            }
            await Future.delayed(Duration(milliseconds: 700));
          } else if (result['log'] == 'skipprod') {
            skipProduct++;
            console.add({
              'type': 'skip',
              'text': 'Товар обнаружен в бд:',
              'article': "Артикул: $article"
            });
          }
        } else {
          errorProduct++;
          console.add({
            'type': 'error',
            'text': 'Ошибка добавления товара:',
            'article': "Артикул: $article"
          });
        }
        emit(initialMassAdd({
          'addProduct': addProduct,
          'skipProduct': skipProduct,
          'errorProduct': errorProduct,
          'console': console
        }));
      }
      await Future.delayed(Duration(milliseconds: 300));
      index++;
    }
    emit(Success());
  }

  Future<void> deleteProduct(String article) async {
    emit(Loading());
    bool result = await _adminRepository.deleteProduct(article);
    if (result) {
      emit(Success());
    } else {
      emit(Error('Товар не найден'));
    }
  }

  Future<void> getEditProduct(String article) async {
    emit(Loading());
    Map result = await _adminRepository.getEditProduct(article);
    if (result['result']) {
      emit(InitEditProduct(result['product']));
    } else {
      emit(Error('Товар не найден'));
    }
  }

  Future<void> editProduct(
      String article,
      String title,
      String price,
      String description,
      String size,
      String minamount,
      String? category) async {
    emit(Loading());
    bool result = await _adminRepository.editProduct(
        article, title, price, description, size, minamount, category ?? '');
    if (result) {
      emit(const Success());
    } else {
      emit(Error("Ошибка"));
    }
  }
}
