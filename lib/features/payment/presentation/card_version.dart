import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/features/payment/presentation/empty_card.dart';

import '../../../core/themes/colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../profile/presentation/widgets/custom_appbar.dart';
import '../widgets/mobile_wallets.dart';
import 'cubit/payment_cubit.dart';
import 'cubit/payment_state.dart';

class CardVersionScreen extends StatefulWidget {
  const CardVersionScreen({super.key});

  @override
  State<CardVersionScreen> createState() => _CardVersionScreenState();
}

class _CardVersionScreenState extends State<CardVersionScreen> {
  String? selectedPayment;
  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit2>().fetchPayments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit2, PaymentState>(
      builder: (context, state) {
        if (state is PaymentLoading) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is PaymentError) {
          return Center(child: Text(state.message));
        } else if (state is PaymentLoaded) {
          final payments = state.payments;

          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomAppBar(
              title: payments.isEmpty ? "Payment Method" : "Card Version",
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: payments.isEmpty
                  ? const EmptyCardsScreen()
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: payments.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              final card = payments[index];
                              return MobileWallets(
                                icon: card.brand.toLowerCase().contains("visa")
                                    ? 'assets/svg/brandico_visa.svg'
                                    : 'assets/svg/logos_mastercard.svg',
                                title: "${card.methodName} ${card.last3}",
                                isSelected:
                                    selectedPayment ==
                                    '${card.methodName} ${card.last3}',
                                onTap: () {
                                  setState(() {
                                    selectedPayment =
                                        '${card.methodName} ${card.last3}';
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.add, size: 18.sp),
                            label: Text(
                              "Add Card",
                              style: MediumMontserrat.mediumMontserrat16
                                  .copyWith(
                                    color: AppColors.white,
                                    fontSize: 16.sp,
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryDefault,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                            onPressed: () {
                              context.push(AppRoutes.addNewCard);
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
