import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/themes/colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../profile/presentation/widgets/custom_appbar.dart';
import '../../profile/presentation/widgets/custom_text_filed.dart';
import 'cubit/add_payment_cubit.dart';
import 'cubit/add_payment_state.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({super.key, required this.userToken});

  final String userToken;

  final TextEditingController methodNameController = TextEditingController();
  final TextEditingController providerTokenController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPaymentCubit, AddPaymentState>(
      listener: (context, state) {
        if (state is AddPaymentLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          });
        } else {
          // Close any open dialogs safely
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          });
        }

        if (state is AddPaymentSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Card added successfully')),
            );

            await Future.delayed(const Duration(milliseconds: 300));
            context.push(AppRoutes.cardVersion);
          });
        } else if (state is AddPaymentError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(title: "Add New Card"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardPreview(),
              SizedBox(height: 20.h),

              // Method Name
              CustomTextField(
                keyboardType: TextInputType.text,
                label: 'Method Name',
                controller: methodNameController,
                hint: "Enter method name",
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
              ),
              SizedBox(height: 12.h),

              // Provider Token
              CustomTextField(
                keyboardType: TextInputType.text,
                label: 'Provider Token',
                controller: providerTokenController,
                hint: "e.g. pk_test_51M0xyzABC1234567890abcdef",
              ),
              SizedBox(height: 12.h),

              // Brand
              CustomTextField(
                keyboardType: TextInputType.text,
                label: 'Brand',
                controller: brandController,
                hint: "Enter card brand (e.g. Visa)",
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
              ),
              SizedBox(height: 12.h),

              // Expiry and Card Number
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      keyboardType: TextInputType.datetime,
                      label: 'Expiry Date',
                      controller: expiryController,
                      hint: "MM/YY",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                      ],
                    ),

                  ),

                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                       keyboardType: TextInputType.number,
                      label: 'Card Number',
                      controller: cardNumberController,
                      hint: "Enter card number",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                        // DD/MM/YYYY
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(methodNameController.text.isEmpty ||
                        providerTokenController.text.isEmpty ||
                        brandController.text.isEmpty ||
                        expiryController.text.isEmpty ||
                        cardNumberController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                            'Please fill in all fields')
                        ),
                      );
                    }
                    final expiry = expiryController.text.split('/');
                    if (expiry.length != 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid expiry date format (MM/YY)')),
                      );
                      return;
                    }

                    final data = {
                      "methodName": methodNameController.text.trim(),
                      "providerToken": providerTokenController.text.trim(),
                      "last3": cardNumberController.text.length >= 3
                          ? cardNumberController.text.substring(cardNumberController.text.length - 3)
                          : cardNumberController.text,
                      "brand": brandController.text.trim(),
                      "expMonth": int.tryParse(expiry[0]) ?? 0,
                      "expYear": int.tryParse(expiry[1]) ?? 0,
                    };

                    if (!validateCardData(data, context)) return;

                    context.read<AddPaymentCubit>().addPayment(data, userToken);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDefault,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  child: Text(
                    "Save",
                    style: MediumMontserrat.mediumMontserrat16.copyWith(
                      color: AppColors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00C6FB), Color(0xFF005BEA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Spenny",
            style: MediumMontserrat.mediumMontserrat16.copyWith(
              color: AppColors.white,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "6789 4567 5432 8903",
            style: RegularGeorgia.regularGeorgia20.copyWith(
              color: AppColors.white,
              letterSpacing: 2,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Seif Mohamed",
                style: RegularGeorgia.regularGeorgia14.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                "12/22",
                style: RegularGeorgia.regularGeorgia14.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

bool validateCardData(Map<String, dynamic> data, BuildContext context) {
  final methodName = (data['methodName'] ?? '').trim();
  final providerToken = (data['providerToken'] ?? '').trim();
  final brand = (data['brand'] ?? '').trim();
  final last3 = (data['last3'] ?? '').trim();
  final expMonth = data['expMonth'] ?? 0;
  final expYear = data['expYear'] ?? 0;

  if (methodName.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Method Name is required')),
    );
    return false;
  }
  if (providerToken.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Provider Token is required')),
    );
    return false;
  }
  if (brand.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Brand is required')),
    );
    return false;
  }
  if (last3.length < 3 || last3.length > 3) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Card number must 3 digits')),
    );
    return false;
  }
  if (expMonth < 1 || expMonth > 12) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Expiry month must be 1-12')),
    );
    return false;
  }
  if (expYear < 2025) { // or current year
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Expiry year is invalid, must be 2025 or later')),
    );
    return false;
  }


  return true; // all good
}
