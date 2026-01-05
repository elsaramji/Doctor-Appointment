import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';

class ImageMessageWidget extends StatelessWidget {
  final String imageUrl;
  final bool isMe;

  const ImageMessageWidget({
    super.key,
    required this.imageUrl,
    required this.isMe,
  });

  void _showFullScreenImage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Center(
            child: InteractiveViewer(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, color: Colors.white);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullScreenImage(context),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 0.7.sw, maxHeight: 0.3.sh),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: isMe ? AppColors.primaryDefault : AppColors.neutral300,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomRight: isMe ? Radius.circular(10.r) : Radius.zero,
                bottomLeft: isMe ? Radius.zero : Radius.circular(10.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomRight: isMe ? Radius.circular(10.r) : Radius.zero,
                bottomLeft: isMe ? Radius.zero : Radius.circular(10.r),
              ),
              child: imageUrl.startsWith('http')
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 200.w,
                          height: 200.h,
                          color: AppColors.neutral300,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 200.w,
                          height: 200.h,
                          color: AppColors.neutral300,
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: AppColors.secondary200,
                            size: 50.sp,
                          ),
                        );
                      },
                    )
                  : Image.file(
                      File(imageUrl),
                      fit: BoxFit.cover,

                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 200.w,
                          height: 200.h,
                          color: AppColors.neutral300,
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: AppColors.secondary200,
                            size: 50.sp,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
