import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/presentation/pages/adminPanel/widgets/input.dart';
import 'package:shopsocks/presentation/cubit/adminCubit/admin_cubit.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;
  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenScreenState();
}

class _EditProductScreenScreenState extends State<EditProductScreen> {
  late AdminCubit cubit;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _minamountController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _articleController = TextEditingController();

  String? category;

  final _formKey = GlobalKey<FormState>();
  Color backgroundColor = Color(0xFFf5f5f5);
  Color borderColor = Color(0xFFf5f5f5);
  @override
  void initState() {
    super.initState();
    cubit = AdminCubit();
    _articleController.text = widget.product.article;
    _descController.text = widget.product.description;
    _priceController.text = widget.product.price.toString();
    _minamountController.text = widget.product.minamount.toString();
    _sizeController.text = widget.product.size;
    _titleController.text = widget.product.title;
    category = widget.product.category;
  }

  changeStyleFiled(status) {
    switch (status) {
      case 'ERROR':
        setState(() {
          backgroundColor = AppColors.redOpacity;
          borderColor = AppColors.red;
        });
        break;
      case 'SUCCESS':
        setState(() {
          backgroundColor = AppColors.greenOpacity;
          borderColor = AppColors.green;
        });
        break;

      default:
        setState(() {
          backgroundColor = AppColors.white;
          borderColor = AppColors.white;
        });
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
            body: LoaderOverlay(
                child: BlocListener<AdminCubit, AdminState>(
                    bloc: cubit,
                    listener: (context, state) {
                      if (state is Success) {
                        context.loaderOverlay.hide();
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Товар успешно отредактирован',
                            confirmBtnText: 'Ок',
                            confirmBtnColor: AppColors.greenTitle,
                            confirmBtnTextStyle: TextStyle(
                                fontSize: 12.sp, color: AppColors.white));
                      } else if (state is Error) {
                        context.loaderOverlay.hide();
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Произошла ошибка при редактировании товара',
                            confirmBtnText: 'Закрыть',
                            confirmBtnColor: AppColors.greenTitle,
                            confirmBtnTextStyle: TextStyle(
                                fontSize: 12.sp, color: AppColors.white));
                      } else if (state is Loading) {
                        context.loaderOverlay.show();
                      }
                    },
                    child: SafeArea(
                        child: SizedBox(
                            width: 100.w,
                            height: 100.h - kToolbarHeight,
                            child: ListView(children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 2.h),
                                child: Column(
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Form(
                                                key: _formKey,
                                                child: SizedBox(
                                                    width: 90.w,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Wrap(
                                                          spacing: 7,
                                                          runSpacing: 7,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    category =
                                                                        'muzhskie';
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          7),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .greenTitle,
                                                                          width:
                                                                              2),
                                                                      color: category ==
                                                                              'muzhskie'
                                                                          ? AppColors
                                                                              .greenTitle
                                                                          : AppColors
                                                                              .white),
                                                                  child: AppText(
                                                                      text:
                                                                          'Мужские',
                                                                      textStyle: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: category == 'muzhskie'
                                                                              ? AppColors.white
                                                                              : AppColors.greenTitle)),
                                                                )),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    category =
                                                                        'ledi';
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          7),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .greenTitle,
                                                                          width:
                                                                              2),
                                                                      color: category ==
                                                                              'ledi'
                                                                          ? AppColors
                                                                              .greenTitle
                                                                          : AppColors
                                                                              .white),
                                                                  child: AppText(
                                                                      text:
                                                                          'Женские',
                                                                      textStyle: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: category == 'ledi'
                                                                              ? AppColors.white
                                                                              : AppColors.greenTitle)),
                                                                )),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    category =
                                                                        'kid';
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          7),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .greenTitle,
                                                                          width:
                                                                              2),
                                                                      color: category ==
                                                                              'kid'
                                                                          ? AppColors
                                                                              .greenTitle
                                                                          : AppColors
                                                                              .white),
                                                                  child: AppText(
                                                                      text:
                                                                          'Детские',
                                                                      textStyle: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: category == 'kid'
                                                                              ? AppColors.white
                                                                              : AppColors.greenTitle)),
                                                                )),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    category =
                                                                        'winter';
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          7),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .greenTitle,
                                                                          width:
                                                                              2),
                                                                      color: category ==
                                                                              'winter'
                                                                          ? AppColors
                                                                              .greenTitle
                                                                          : AppColors
                                                                              .white),
                                                                  child: AppText(
                                                                      text:
                                                                          'Зимние',
                                                                      textStyle: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: category == 'winter'
                                                                              ? AppColors.white
                                                                              : AppColors.greenTitle)),
                                                                ))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        Input(
                                                          readOnly: true,
                                                          title: "Артикул",
                                                          backgroundInput:
                                                              backgroundColor,
                                                          borderInput:
                                                              borderColor,
                                                          controller:
                                                              _articleController,
                                                          maxLength: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                        ),
                                                        Input(
                                                          title: "Название",
                                                          backgroundInput:
                                                              backgroundColor,
                                                          borderInput:
                                                              borderColor,
                                                          controller:
                                                              _titleController,
                                                          maxLength: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                        ),
                                                        Input(
                                                          title: "Цена",
                                                          backgroundInput:
                                                              backgroundColor,
                                                          borderInput:
                                                              borderColor,
                                                          controller:
                                                              _priceController,
                                                          maxLength: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                        Input(
                                                          title: "Описание",
                                                          backgroundInput:
                                                              backgroundColor,
                                                          borderInput:
                                                              borderColor,
                                                          controller:
                                                              _descController,
                                                          maxLength: 4,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                        ),
                                                        Input(
                                                          title:
                                                              "Минимальное колличество пар",
                                                          backgroundInput:
                                                              backgroundColor,
                                                          borderInput:
                                                              borderColor,
                                                          controller:
                                                              _minamountController,
                                                          maxLength: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                        Input(
                                                          title: "Размер",
                                                          backgroundInput:
                                                              backgroundColor,
                                                          borderInput:
                                                              borderColor,
                                                          controller:
                                                              _sizeController,
                                                          maxLength: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                        ),
                                                      ],
                                                    ))),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                if (_articleController
                                                        .text.isEmpty ||
                                                    _titleController
                                                        .text.isEmpty ||
                                                    _priceController
                                                        .text.isEmpty ||
                                                    _descController
                                                        .text.isEmpty ||
                                                    _sizeController
                                                        .text.isEmpty ||
                                                    _minamountController
                                                        .text.isEmpty ||
                                                    category == null) {
                                                } else if (_formKey
                                                    .currentState!
                                                    .validate()) {
                                                  cubit.editProduct(
                                                      _articleController.text,
                                                      _titleController.text,
                                                      _priceController.text,
                                                      _descController.text,
                                                      _sizeController.text,
                                                      _minamountController.text,
                                                      category);
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 7,
                                                        horizontal: 10),
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        AppColors.greenTitle),
                                                child: AppText(
                                                    text: 'Редактировать товар',
                                                    textStyle: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.white)),
                                              ))
                                        ])
                                  ],
                                ),
                              )
                            ])))))));
  }
}
