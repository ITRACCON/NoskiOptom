import 'dart:convert';
import 'dart:html';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/domain/models/order_model.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/cubit/adminCubit/admin_cubit.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AddMassproductsScreen extends StatefulWidget {
  const AddMassproductsScreen({super.key});

  @override
  State<AddMassproductsScreen> createState() => _AddMassproductsScreenState();
}

class _AddMassproductsScreenState extends State<AddMassproductsScreen> {
  late AdminCubit cubit;
  late List employeeData;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    cubit = AdminCubit();
    scrollController = ScrollController();
  }

  String type = 'UPLOAD_FILE';
  String nameFile = '';

  Future _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv']);
    if (result != null) {
      final bytes = utf8.decode((result.files.first.bytes)!.toList());
      setState(() {
        employeeData = CsvToListConverter().convert(bytes);
        type = 'WAIT_START';
        nameFile = result.files.first.name;
      });
    }
  }

  changeContent() {
    switch (type) {
      case 'UPLOAD_FILE':
        return InkWell(
            onTap: () async {
              _openFileExplorer();
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greenTitle),
                child: AppText(
                    text: "Выбрать файл",
                    textStyle:
                        TextStyle(fontSize: 14.sp, color: AppColors.white))));

        break;
      case 'WAIT_START':
        return Column(children: [
          Container(
            margin: EdgeInsets.only(top: 3.h),
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: "Название файла: ",
                            textStyle: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: nameFile,
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.greenTitle)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: "Товаров в таблице: ",
                            textStyle: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: employeeData.length.toString(),
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.greenTitle)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: "Добавленно: ",
                            textStyle: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: '0',
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.greenTitle)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: "Пропущено: ",
                            textStyle: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: '0',
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.greenTitle)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: "Ошибок: ",
                            textStyle: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: AppText(
                            textAlign: TextAlign.left,
                            text: '0',
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.greenTitle)))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          InkWell(
              onTap: () {
                cubit.addMassProduct(employeeData);
                setState(() {
                  type = 'MASS_ADD_PRODUCT';
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenTitle),
                  child: AppText(
                      text: "Начать загрузку",
                      textStyle:
                          TextStyle(fontSize: 14.sp, color: AppColors.white))))
        ]);
        break;
      case 'MASS_ADD_PRODUCT':
        return BlocBuilder<AdminCubit, AdminState>(
            bloc: cubit,
            builder: (context, state) {
              return state.when(
                  initialStats: (List<User> users, List<OrderUser> orders,
                          List<BasketProductStats> basketProductStat) =>
                      Container(),
                  initial: () => Container(),
                  success: () => Container(
                        height: 90.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                size: 36.sp,
                                color: AppColors.greenTitle,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppText(
                                  text: 'Товары успешно добавлены',
                                  textStyle: TextStyle(fontSize: 16.sp))
                            ],
                          ),
                        ),
                      ),
                  loading: () => Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 3.h),
                          width: 90.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: "Название файла: ",
                                          textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: nameFile,
                                          textStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.greenTitle)))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: "Товаров в таблице: ",
                                          textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: employeeData.length.toString(),
                                          textStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.greenTitle)))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: "Добавленно: ",
                                          textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: '0',
                                          textStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.greenTitle)))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: "Пропущено: ",
                                          textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text: '0',
                                          textStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.greenTitle)))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                            width: 90.w,
                            height: 30.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: 90.w,
                              height: 30.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(10)),
                            ))
                      ]),
                  error: (String error) => Container(),
                  initialMassAdd: (Map<dynamic, dynamic> init) {
                    SchedulerBinding.instance?.addPostFrameCallback((_) {
                      scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 50),
                          curve: Curves.fastOutSlowIn);
                    });
                    return Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 3.h),
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: "Название файла: ",
                                        textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: nameFile,
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.greenTitle)))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: "Товаров в таблице: ",
                                        textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: employeeData.length.toString(),
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.greenTitle)))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: "Добавленно: ",
                                        textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: init['addProduct'].toString(),
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.greenTitle)))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: "Пропущено: ",
                                        textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: init['skipProduct'].toString(),
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.greenTitle)))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: "Ошибок: ",
                                        textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                    child: AppText(
                                        textAlign: TextAlign.left,
                                        text: init['errorProduct'].toString(),
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.greenTitle)))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          width: 90.w,
                          height: 50.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: 90.w,
                            height: 50.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView.builder(
                                controller: scrollController,
                                itemCount: init['console'].length,
                                itemBuilder: (context, index) => Row(
                                      children: [
                                        AppText(
                                            text: init['console'][index]
                                                ['text'],
                                            textStyle: TextStyle(
                                                color: init['console'][index]
                                                            ['type'] ==
                                                        'add'
                                                    ? AppColors.greenTitle
                                                    : init['console'][index]
                                                                ['type'] ==
                                                            'chanel'
                                                        ? Colors.blue
                                                        : init['console'][index]
                                                                    ['type'] ==
                                                                'skip'
                                                            ? Colors.orange
                                                            : Colors.red,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        AppText(
                                            text: init['console'][index]
                                                ['article'],
                                            textStyle: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: 12))
                                      ],
                                    )),
                          ))
                    ]);
                  },
                  initEditProduct: (Product product) => Container());
            });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: AppColors.bgAppContent,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18.sp,
                ),
              );
            }),
            title: SizedBox(
                width: 50.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                        text: 'Оптом',
                        textStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.greenTitle,
                            fontWeight: FontWeight.bold)),
                    Image.asset(
                      AppImages.logo,
                      width: 10.w,
                    ),
                    AppText(
                        text: 'Носки',
                        textStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.greenTitle,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          ),
          body: Center(child: changeContent()),
        ));
  }
}
