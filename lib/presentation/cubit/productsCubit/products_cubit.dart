import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/products_repository.dart';
import 'package:shopsocks/domain/models/product_model.dart';
part 'products_cubit.freezed.dart';

part 'products_state.dart';

class Userr {
  String name;
  int age;

  Userr(this.name, this.age);

  @override
  toString() {
    return ('$name - $age years old \n');
  }
}

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository = ProductsRepository();

  ProductsCubit() : super(const Loading());

  Future<void> initialProducts(String category) async {
    Map result = await _productsRepository.getProducts(category);
    if (result['result']) {
      List<Product> products = result['products'];
      List<Product> prodPage = products.take((30)).toList();
      emit(Intial(prodPage, (products.length / 30).round(), 'initPage'));
    } else {
      emit(const Error());
    }
  }

  Future<bool> initCatalog(int minPrice, int maxPrice, String category,
      String sortCatalog, int page, String typePage, String searchReq) async {
    Map result = await _productsRepository.getProducts(category);
    if (result['result']) {
      List<Product> products = result['products'];
      List<Product> newList = [];
      List<Product> endList = [];
      List<String> searchReqList = searchReq.split(' ');
      if (searchReq != 'NO') {
        newList.addAll(products.where((product) =>
            product.article == searchReq ||
            searchReqList.every((searchWord) => product.title
                .toLowerCase()
                .contains(searchWord.toLowerCase()))));
      } else {
        newList.addAll(products);
      }

      switch (sortCatalog) {
        case 'Новинки':
          newList.sort((a, b) => b.id.compareTo(a.id));
          break;
        case 'Сначала дешевле':
          newList.sort((min, max) => min.price.compareTo(max.price));
          break;
        case 'Сначала дороже':
          newList.sort((min, max) => max.price.compareTo(min.price));
          break;
      }
      endList = newList
          .where((product) =>
              product.price >= minPrice && product.price < maxPrice)
          .toList();
      if (page == 1) {
        List<Product> pageList = endList.take(page * 30).toList();
        emit(Intial(pageList, (endList.length / 30).round(), typePage));
      } else {
        List<Product> pageList =
            endList.skip((page - 1) * 30).take(30).toList();
        emit(Intial(pageList, (endList.length / 30).round(), typePage));
      }

      return true;
    } else {
      emit(const Error());
      return false;
    }
  }
}
