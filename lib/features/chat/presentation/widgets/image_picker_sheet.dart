import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class ImagePickerSheet extends StatelessWidget {
  final Function(XFile) onImageSelected;

  const ImagePickerSheet({super.key, required this.onImageSelected});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onImageSelected(image);
      context.pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Image',
            style: RegularMontserrat.regularMontserrat16.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDefault,
            ),
          ),
          SizedBox(height: 24.h),
          ListTile(
            leading: Icon(Icons.photo_library, color: AppColors.primaryDefault),
            title: Text(
              'Pick from Gallery',
              style: RegularMontserrat.regularMontserrat16,
            ),
            onTap: () => _pickImage(context),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
