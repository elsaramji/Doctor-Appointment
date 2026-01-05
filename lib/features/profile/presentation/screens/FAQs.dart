import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/app_theme.dart';
import '../cubit/faq_cubit.dart';
import '../cubit/faq_state.dart';
import '../widgets/custom_appbar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int? expandedIndex;

  @override
  void initState() {
    super.initState();
    context.read<FaqCubit>().fetchFaqs();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme,
      child: Scaffold(
        appBar: CustomAppBar(title: "FAQs"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: BlocBuilder<FaqCubit, FaqState>(
            builder: (context, state) {
              if (state is FaqLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FaqError) {
                return Center(child: Text(state.message));
              } else if (state is FaqLoaded) {
                final faqs = state.faqs;
                return ListView.separated(
                  itemCount: faqs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final faq = faqs[index];
                    final isExpanded = expandedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: AppColors.neutral50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    faq.question,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondaryDefault,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded ? Icons.remove : Icons.add,
                                  color: AppColors.secondaryDefault,
                                ),
                              ],
                            ),
                            if (isExpanded) ...[
                              const SizedBox(height: 8),
                              Text(
                                faq.answer,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.neutral700,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
