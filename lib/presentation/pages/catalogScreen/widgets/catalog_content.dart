import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:shopsocks/domain/models/product_model.dart';
import 'package:shopsocks/domain/models/user_model.dart';
import 'package:shopsocks/presentation/pages/catalogScreen/widgets/product_card.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class CatalogContent extends StatefulWidget {
  final List<Product> products;
  final String category;
  final User user;
  final int pages;
  final void Function(int minPrice, int maxPrice, String valueSort, int page,
      String typePage, String searchReq) initCatalog;
  final void Function(Product product) onTap;
  final String typePage;
  const CatalogContent(
      {super.key,
      required this.products,
      required this.category,
      required this.user,
      required this.onTap,
      required this.initCatalog,
      required this.pages,
      required this.typePage});

  @override
  State<CatalogContent> createState() => _CatalogContentState();
}

class _CatalogContentState extends State<CatalogContent> {
  List<String> items = ['Новинки', 'Сначала дешевле', 'Сначала дороже'];
  String? selectedValue;
  late ScrollController scrollController;
  RangeValues _currentRangeValues = const RangeValues(0, 200);
  int page = 1;

  bool blocSearch = false;
  final TextEditingController _searchController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String searchReq = 'NO';
  String typePage = 'initPage';
  @override
  void initState() {
    super.initState();
    selectedValue = 'Новинки';
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  searchProduct(value) {
    if (value.length > 4) {
      widget.initCatalog(
          _currentRangeValues.start.toInt(),
          _currentRangeValues.end.toInt(),
          selectedValue!,
          1,
          'initPage',
          value);
      setState(() {
        page = 1;
        searchReq = value;
      });
    } else if (value.length == 0) {
      widget.initCatalog(_currentRangeValues.start.toInt(),
          _currentRangeValues.end.toInt(), selectedValue!, 1, 'initPage', 'NO');
      setState(() {
        searchReq = 'NO';
        page = 1;
      });
    }
  }

  sortCatalog(value) {
    if (value == 'Новинки') {
      widget.initCatalog(_currentRangeValues.start.toInt(),
          _currentRangeValues.end.toInt(), value, page, 'initPage', searchReq);
      setState(() {
        selectedValue = value;
        page = 1;
      });
    } else if (value == 'Сначала дешевле') {
      widget.initCatalog(_currentRangeValues.start.toInt(),
          _currentRangeValues.end.toInt(), value, page, 'initPage', searchReq);
      setState(() {
        selectedValue = value;
        page = 1;
      });
    } else if (value == 'Сначала дороже') {
      widget.initCatalog(_currentRangeValues.start.toInt(),
          _currentRangeValues.end.toInt(), value, page, 'initPage', searchReq);
      setState(() {
        selectedValue = value;
        page = 1;
      });
    }
  }

  _scrollListener() {
    ScrollPosition position = scrollController.position;

    if (scrollController.offset >= position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (page < widget.pages) {
        setState(() {
          page += 1;
          typePage = 'nextPage';
        });
        widget.initCatalog(
            _currentRangeValues.start.toInt(),
            _currentRangeValues.end.toInt(),
            selectedValue!,
            page,
            'nextPage',
            searchReq);
      }
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      if (page > 1) {
        setState(() {
          page -= 1;
          typePage = 'backPage';
        });
        widget.initCatalog(
            _currentRangeValues.start.toInt(),
            _currentRangeValues.end.toInt(),
            selectedValue!,
            page,
            'backPage',
            searchReq);
      }
    }
  }

  checkTypePage() {
    if (widget.typePage == 'nextPage' || widget.typePage == 'initPage') {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
            scrollController.position.minScrollExtent + 10,
            duration: const Duration(milliseconds: 1),
            curve: Curves.fastOutSlowIn);
      });
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
            scrollController.position.maxScrollExtent - 10,
            duration: const Duration(milliseconds: 1),
            curve: Curves.fastOutSlowIn);
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    widget.products.clear();
    _searchController.dispose();
    super.dispose();
  }

  showModalBottom() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, state) {
          return Container(
            height: 27.h,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    AppText(
                        text: 'Фильтры',
                        textStyle: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(
                      height: 2,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 1.h),
                        width: 90.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                                text:
                                    "Цена: ${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}",
                                textStyle: TextStyle(fontSize: 14.sp)),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                    text: '1',
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                                AppText(
                                    text: '200',
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            SliderTheme(
                                data: SliderThemeData(
                                    // here
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                    trackHeight: 1.5.h),
                                child: RangeSlider(
                                  activeColor: AppColors.greenTitle,
                                  inactiveColor: AppColors.greyText,
                                  values: _currentRangeValues,
                                  max: 100,
                                  divisions: 100,
                                  labels: RangeLabels(
                                    _currentRangeValues.start
                                        .round()
                                        .toString(),
                                    _currentRangeValues.end.round().toString(),
                                  ),
                                  onChanged: (RangeValues values) {
                                    state(() {
                                      _currentRangeValues = values;
                                    });
                                  },
                                ))
                          ],
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                        onTap: () {
                          widget.initCatalog(
                              _currentRangeValues.start.toInt(),
                              _currentRangeValues.end.toInt(),
                              selectedValue!,
                              1,
                              'initPage',
                              searchReq);
                          state(() {
                            page = 1;
                          });

                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.greenTitle),
                          child: AppText(
                              text: 'Применить',
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white)),
                        )),
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    checkTypePage();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        children: [
          AppText(
              text: widget.category,
              textStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 85.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blocSearch
                      ? SizedBox(
                          width: 63.w,
                          child: Form(
                              key: _formKey,
                              child: TextFormField(
                                style: TextStyle(fontSize: 12.sp),
                                maxLength: 100,
                                decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  fillColor: Colors.white,
                                  hintText:
                                      'Пример: короткие, черные, высокие и тд...',
                                  counterText: '',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(0xff999999),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                                controller: _searchController,
                                onChanged: (value) => searchProduct(value),
                              )))
                      : Container(
                          width: 49.w,
                          alignment: Alignment.centerLeft,
                          child: DropdownFlutter(
                            closedHeaderPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            listItemPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            itemsListPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            expandedHeaderPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: CustomDropdownDecoration(
                                closedBorderRadius: BorderRadius.circular(5)),
                            items: items,
                            initialItem: items.first,
                            onChanged: (value) {
                              sortCatalog(value);
                            },
                          )),
                  Row(children: [
                    blocSearch
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                page = 1;
                                blocSearch = false;
                                _searchController.clear();
                                searchReq = 'NO';
                                widget.initCatalog(
                                    _currentRangeValues.start.toInt(),
                                    _currentRangeValues.end.toInt(),
                                    selectedValue!,
                                    1,
                                    'initPage',
                                    'NO');
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.white),
                                child: Icon(
                                  Icons.close,
                                  size: 23.sp,
                                  color: AppColors.black,
                                  weight: 5,
                                )))
                        : InkWell(
                            onTap: () {
                              setState(() {
                                blocSearch = true;
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.white),
                                child: Icon(
                                  Icons.search,
                                  size: 23.sp,
                                  color: AppColors.black,
                                  weight: 5,
                                ))),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          showModalBottom();
                        },
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 3, color: AppColors.greenTitle)),
                            child: Icon(
                              Icons.tune,
                              size: 18.sp,
                              color: AppColors.greenTitle,
                              weight: 5,
                            )))
                  ])
                ]),
          ),
          SizedBox(
            height: 2.h,
          ),
          widget.products.isEmpty
              ? Column(
                  children: [
                    Image.asset(
                      AppImages.clearCatalog,
                      width: 50.w,
                    ),
                    SizedBox(height: 2.h),
                    AppText(
                        text: "Пустые полки",
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2.h),
                    AppText(
                        text:
                            "К сожалению в данной категории товаров пока нет.",
                        textStyle: TextStyle(fontSize: 12.sp)),
                  ],
                )
              : Expanded(
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 81.w,
                      child: ListView(
                        shrinkWrap: true,
                        controller: scrollController,
                        children: [
                          Wrap(
                            spacing: 2,
                            runSpacing: 2,
                            children: widget.products
                                .map((product) => ProductCard(
                                    searchText: searchReq,
                                    onTap: (Product product) =>
                                        widget.onTap(product),
                                    product: product,
                                    userId: widget.user.idTg,
                                    key: ValueKey(product.article)))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: widget.pages,
                            itemBuilder: (context, index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      widget.initCatalog(
                                          _currentRangeValues.start.toInt(),
                                          _currentRangeValues.end.toInt(),
                                          selectedValue!,
                                          index + 1,
                                          'initPage',
                                          searchReq);
                                      setState(() {
                                        page = index + 1;
                                      });
                                    },
                                    child: AppText(
                                      text: (index + 1).toString(),
                                      textStyle: TextStyle(
                                          fontSize:
                                              page == index + 1 ? 16.sp : 12.sp,
                                          color: page == index + 1
                                              ? AppColors.greenTitle
                                              : AppColors.black
                                                  .withOpacity(0.2),
                                          fontWeight: page == index + 1
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ),
                                  ),
                                )))
                  ],
                ))
        ],
      ),
    );
  }
}

class CatalogEmptyContent extends StatelessWidget {
  final String category;
  const CatalogEmptyContent({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        height: 85.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
                text: category,
                textStyle:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 2.h,
            ),
            Column(
              children: [
                Image.asset(
                  AppImages.clearCatalog,
                  width: 50.w,
                ),
                SizedBox(height: 2.h),
                AppText(
                    text: "Пустые полки",
                    textStyle: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                AppText(
                    text: "К сожалению в данной категории товаров пока нет.",
                    textStyle: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
