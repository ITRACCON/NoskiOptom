import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/basket_model.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class OrderContent extends StatefulWidget {
  final List<BasketProduct> basketProducts;
  final int userId;
  final void Function(String phone, String? deliverly, String? pay)
      placingOrder;
  const OrderContent(
      {super.key,
      required this.basketProducts,
      required this.userId,
      required this.placingOrder});

  @override
  State<OrderContent> createState() => _OrderContentState();
}

class _OrderContentState extends State<OrderContent> {
  getParSocks() {
    int parSocks = 0;
    widget.basketProducts.forEach((product) => parSocks += product.amount);
    return parSocks;
  }

  getSumaOrder() {
    double sumaOrder = 0;
    widget.basketProducts.forEach(
        (product) => sumaOrder += product.amount * product.product!.price);
    return sumaOrder;
  }

  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String patternPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  Color backgroundColor = Color(0xFFf5f5f5);
  Color borderColor = Color(0xFFf5f5f5);
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

  validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      setState(() {
        changeStyleFiled('ERROR');
      });
    } else if (!regExp.hasMatch(value)) {
      changeStyleFiled('ERROR');
    } else {
      changeStyleFiled('SUCCESS');
    }
  }

  List devList = ["Самовывоз со склада в Москве.", "Транспортная компания"];
  List payList = [
    "Оплата на карту банка:  Сбербанк, Тинькофф, ВТБ, СБП",
    "Оплата наличными при получении на складе (Москва)",
    "Банковский перевод на рассчетный счет"
  ];
  String? deliverly;

  String? pay;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        alignment: Alignment.center,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                  color: AppColors.greenText.withOpacity(0.5),
                  border: Border.all(color: AppColors.greenTitle, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: 'Информация о заказе',
                      textStyle: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                          text: 'Товаров',
                          textStyle: TextStyle(fontSize: 11.sp)),
                      AppText(
                          text: '${widget.basketProducts.length}',
                          textStyle: TextStyle(fontSize: 11.sp)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                          text: 'Пар носков',
                          textStyle: TextStyle(fontSize: 11.sp)),
                      AppText(
                          text: '${getParSocks()}',
                          textStyle: TextStyle(fontSize: 11.sp)),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 2,
                        color: AppColors.greenTitle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              text: 'Стоимость заказа',
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          AppText(
                              text: '${getSumaOrder().round()}',
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                      key: _formKey,
                      child: SizedBox(
                          width: 80.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  textAlign: TextAlign.left,
                                  text: "Номер телефона",
                                  textStyle: TextStyle(fontSize: 13.sp)),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: borderColor, width: 2)),
                                child: TextFormField(
                                  maxLength: 11,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: '79357814747',
                                    counterText: '',
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color(0xff999999),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp),
                                  ),
                                  controller: _phoneController,
                                  onEditingComplete: () {
                                    validateMobile(_phoneController.text);
                                  },
                                  onFieldSubmitted: (value) =>
                                      validateMobile(value),
                                  onChanged: (value) => validateMobile(value),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppText(
                                  textAlign: TextAlign.left,
                                  text: "Способ доставки",
                                  textStyle: TextStyle(fontSize: 13.sp)),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              RadioListTile<String>(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.4.h),
                                activeColor: AppColors.greenTitle,
                                title: Row(children: [
                                  Image.asset(
                                    AppImages.samovyvoz,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                        AppText(
                                            textAlign: TextAlign.left,
                                            text:
                                                "Самовывоз со склада в Москве.",
                                            textStyle: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold)),
                                        AppText(
                                            textAlign: TextAlign.left,
                                            text: "Бесплатно",
                                            textStyle:
                                                TextStyle(fontSize: 8.sp)),
                                        AppText(
                                            textAlign: TextAlign.left,
                                            text:
                                                "Угрешская 2с1 (приезжать после подтверждения и обсуждения заказа менеджером)",
                                            textStyle:
                                                TextStyle(fontSize: 8.sp))
                                      ]))
                                ]),
                                groupValue: deliverly,
                                value: devList[0],
                                onChanged: (String? value) {
                                  setState(() {
                                    deliverly = value;
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.4.h),
                                activeColor: AppColors.greenTitle,
                                title: Row(children: [
                                  Image.asset(
                                    AppImages.dostavkatr,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                        AppText(
                                            textAlign: TextAlign.left,
                                            text: "Транспортная компания",
                                            textStyle: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold)),
                                        AppText(
                                            textAlign: TextAlign.left,
                                            text: "Бесплатно",
                                            textStyle:
                                                TextStyle(fontSize: 8.sp)),
                                        AppText(
                                            textAlign: TextAlign.left,
                                            text:
                                                "До транспортной компании доставка бесплатная",
                                            textStyle:
                                                TextStyle(fontSize: 8.sp))
                                      ]))
                                ]),
                                groupValue: deliverly,
                                value: devList[1],
                                onChanged: (String? value) {
                                  setState(() {
                                    deliverly = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppText(
                                  textAlign: TextAlign.left,
                                  text: "Способ оплаты",
                                  textStyle: TextStyle(fontSize: 13.sp)),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              RadioListTile<String>(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.4.h),
                                activeColor: AppColors.greenTitle,
                                title: Row(children: [
                                  Image.asset(
                                    AppImages.sberLogo,
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text:
                                              "Оплата на карту банка:  Сбербанк, Тинькофф, ВТБ, СБП",
                                          textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold)))
                                ]),
                                groupValue: pay,
                                value: payList[0],
                                onChanged: (String? value) {
                                  setState(() {
                                    pay = value;
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.4.h),
                                activeColor: AppColors.greenTitle,
                                title: Row(children: [
                                  Image.asset(
                                    AppImages.cash,
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text:
                                              "Оплата наличными при получении на складе (Москва)",
                                          textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold)))
                                ]),
                                groupValue: pay,
                                value: payList[1],
                                onChanged: (String? value) {
                                  setState(() {
                                    pay = value;
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.4.h),
                                activeColor: AppColors.greenTitle,
                                title: Row(children: [
                                  Image.asset(
                                    AppImages.bank,
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                      child: AppText(
                                          textAlign: TextAlign.left,
                                          text:
                                              "Банковский перевод на рассчетный счет",
                                          textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold)))
                                ]),
                                groupValue: pay,
                                value: payList[2],
                                onChanged: (String? value) {
                                  setState(() {
                                    pay = value;
                                  });
                                },
                              )
                            ],
                          ))),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_phoneController.text.isEmpty) {
                        changeStyleFiled('ERROR');
                      } else if (_formKey.currentState!.validate() &&
                          deliverly != null &&
                          pay != null) {
                        widget.placingOrder(
                            _phoneController.text, deliverly, pay);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      width: 90.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greenTitle),
                      child: AppText(
                          text: 'Оформить заказ',
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white)),
                    ))
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
