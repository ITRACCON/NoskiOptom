import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopsocks/utils/constants/colors.dart';
import 'package:shopsocks/utils/constants/images.dart';
import 'package:sizer/sizer.dart';

class ImageModal extends StatelessWidget {
  final String photo;

  const ImageModal({super.key, required this.photo});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          errorWidget: (context, a, b) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.noPhoto,
                height: 25.h,
                width: 38.w,
                fit: BoxFit.cover,
              )),
          placeholder: (context, url) => Container(
            height: 25.h,
            width: 38.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black.withOpacity(0.2)),
            child:
                SizedBox(width: 5.w, child: const CircularProgressIndicator()),
          ),
          imageUrl: photo,
        ),
      ),
    );
  }
}
