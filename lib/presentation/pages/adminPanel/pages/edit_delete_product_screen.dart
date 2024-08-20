import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/presentation/pages/adminPanel/pages/edit_product_screen.dart';
import 'package:shopsocks/presentation/pages/adminPanel/widgets/input.dart';
import 'package:shopsocks/presentation/cubit/adminCubit/admin_cubit.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class EditDeleteProductScreen extends StatefulWidget {
  const EditDeleteProductScreen({super.key});

  @override
  State<EditDeleteProductScreen> createState() =>
      _EditDeleteProductScreenState();
}

class _EditDeleteProductScreenState extends State<EditDeleteProductScreen> {
  late AdminCubit cubit;

  final TextEditingController _articleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color backgroundColor = Color(0xFFf5f5f5);
  Color borderColor = Color(0xFFf5f5f5);
  @override
  void initState() {
    super.initState();
    cubit = AdminCubit()..init();
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
                      if (state is InitEditProduct) {
                        context.loaderOverlay.hide();
                        _articleController.clear();
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProductScreen(
                                    product: state.product,
                                  )),
                        );
                      }
                      if (state is Success) {
                        context.loaderOverlay.hide();
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Товар успешно удален',
                            confirmBtnText: 'Ок',
                            confirmBtnColor: AppColors.greenTitle,
                            confirmBtnTextStyle: TextStyle(
                                fontSize: 12.sp, color: AppColors.white));
                        _articleController.clear();
                        setState(() {});
                      } else if (state is Error) {
                        context.loaderOverlay.hide();
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Товар не найден',
                            confirmBtnText: 'Закрыть',
                            confirmBtnColor: AppColors.greenTitle,
                            confirmBtnTextStyle: TextStyle(
                                fontSize: 12.sp, color: AppColors.white));
                      } else if (state is Loading) {
                        context.loaderOverlay.show();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                          width: 90.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Input(
                                                title: "Артикул",
                                                backgroundInput:
                                                    backgroundColor,
                                                borderInput: borderColor,
                                                controller: _articleController,
                                                maxLength: 1,
                                                keyboardType:
                                                    TextInputType.text,
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
                                      if (_articleController.text.isEmpty) {
                                      } else if (_formKey.currentState!
                                          .validate()) {
                                        cubit.getEditProduct(
                                            _articleController.text);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.greenTitle),
                                      child: AppText(
                                          text: 'Редактировать товар',
                                          textStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white)),
                                    )),
                                SizedBox(
                                  height: 1.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      if (_articleController.text.isEmpty) {
                                      } else if (_formKey.currentState!
                                          .validate()) {
                                        cubit.deleteProduct(
                                            _articleController.text);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.red),
                                      child: AppText(
                                          text: 'Удалить товар',
                                          textStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white)),
                                    ))
                              ])
                        ],
                      ),
                    )))));
  }
}
