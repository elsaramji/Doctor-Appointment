import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/themes/colors.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/phone_input.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  final ValueNotifier<File?> _imageFile = ValueNotifier<File?>(null);
  String? _imageUrl;
  final ImagePicker _picker = ImagePicker();

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();

    selectedDay ??= '1';
    selectedMonth ??= 'January';
    selectedYear ??= '1991';
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    _imageFile.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 800,
    );
    if (picked != null) {
      _imageFile.value = File(picked.path);
      _imageUrl = null;
    }
  }

  void _initializeForm(ProfileLoaded state) {
    if (!_isInitialized) {
      final profile = state.profile;

      nameController.text = profile.fullName;
      emailController.text = profile.email;
      phoneController.text = profile.phoneNumber.replaceAll('+20', '0');
      addressController.text = profile.address;

      if (profile.birthDate != null && profile.birthDate!.isNotEmpty) {
        try {
          final dateParts = profile.birthDate!.split('T')[0].split('-');
          if (dateParts.length == 3) {
            selectedYear = dateParts[0];
            selectedMonth = _numberToMonth(dateParts[1]);

            String day = dateParts[2];
            if (day.startsWith('0') && day.length > 1) {
              day = day.substring(1);
            }
            selectedDay = day;
          }
        } catch (e) {
          print('Error parsing birth date: $e');
          selectedDay = '1';
          selectedMonth = 'January';
          selectedYear = '1991';
        }
      } else {
        selectedDay = '1';
        selectedMonth = 'January';
        selectedYear = '1991';
      }

      if (_imageFile.value == null && profile.imgUrl.isNotEmpty) {
        _imageUrl = profile.imgUrl;
      }

      _isInitialized = true;
    }
  }

  String _numberToMonth(String monthNumber) {
    const months = {
      '01': 'January',
      '02': 'February',
      '03': 'March',
      '04': 'April',
      '05': 'May',
      '06': 'June',
      '07': 'July',
      '08': 'August',
      '09': 'September',
      '10': 'October',
      '11': 'November',
      '12': 'December',
    };
    return months[monthNumber] ?? 'January';
  }

  String _monthToNumber(String month) {
    const months = {
      'January': '01',
      'February': '02',
      'March': '03',
      'April': '04',
      'May': '05',
      'June': '06',
      'July': '07',
      'August': '08',
      'September': '09',
      'October': '10',
      'November': '11',
      'December': '12',
    };
    return months[month] ?? '01';
  }

  String _formatPhoneNumber(String phone) {
    // Remove any non-digit characters
    String digits = phone.replaceAll(RegExp(r'[^\d]'), '');

    // If it starts with 0, replace with +20
    if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }

    return '+20$digits';
  }

  bool _isValidEgyptPhone(String phone) {
    final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    return regex.hasMatch(phone.replaceAll(RegExp(r'[^\d]'), ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          // context.read<ProfileCubit>().fetchProfile();

          context.pop(true);
        } else if (state is ProfileUpdateFailure || state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state is ProfileUpdateFailure
                    ? state.message
                    : (state as ProfileError).message,
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomAppBar(title: 'Edit Profile'),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProfileLoaded) {
          _initializeForm(state);
        }

        return _buildProfileForm(context);
      },
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Photo
              Stack(
                alignment: Alignment.center,
                children: [
                  ValueListenableBuilder<File?>(
                    valueListenable: _imageFile,
                    builder: (context, imageFile, _) {
                      ImageProvider avatarImage;

                      if (imageFile != null) {
                        avatarImage = FileImage(imageFile);
                      } else if (_imageUrl != null && _imageUrl!.isNotEmpty) {
                        if (_imageUrl!.contains("default.png")) {
                          avatarImage = const AssetImage(
                            'assets/images/homePageImages/307ce493-b254-4b2d-8ba4-d12c080d6651.jpg',
                          );
                        } else {
                          avatarImage = NetworkImage(
                            _imageUrl!.startsWith('http')
                                ? _imageUrl!
                                : 'https://cure-doctor-booking.runasp.net$_imageUrl',
                          );
                        }
                      } else {
                        avatarImage = const AssetImage(
                          'assets/images/homePageImages/307ce493-b254-4b2d-8ba4-d12c080d6651.jpg',
                        );
                      }

                      return CircleAvatar(
                        radius: 50.r,
                        backgroundImage: avatarImage,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 2.h,
                    right: 2.w,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary500,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.white,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Full Name
              CustomTextField(
                keyboardType: TextInputType.name,
                label: 'Full Name',
                hint: 'Ahmed Mohamed',
                icon: 'assets/svg/user_rounded.svg',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full name is required';
                  }
                  if (value.trim().length < 2) {
                    return 'Full name must be at least 2 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Email
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                hint: 'ahmed@gmail.com',
                icon: 'assets/svg/mdi_email.svg',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Phone
              PhoneNumberField(controller: phoneController),
              SizedBox(height: 16.h),

              // Address
              CustomTextField(
                keyboardType: TextInputType.streetAddress,
                label: 'Address',
                hint: '129, El-Nasr Street, Cairo',
                icon: 'assets/svg/Location.svg',
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Birthday Picker
              _buildBirthdayPicker(),
              SizedBox(height: 40.h),

              CustomButton(
                text: 'Update Profile',
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  // Validate phone number
                  final rawPhone = phoneController.text.trim();
                  if (!_isValidEgyptPhone(rawPhone)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter a valid Egyptian phone number (01XXXXXXXXX)',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Validate birthday selection
                  if (selectedDay == null ||
                      selectedMonth == null ||
                      selectedYear == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Birth date is required'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final selectedDate = DateTime(
                    int.parse(selectedYear!),
                    int.parse(_monthToNumber(selectedMonth!)),
                    int.parse(selectedDay!),
                  );

                  if (selectedDate.isAfter(DateTime.now())) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Birthday must be in the past'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final birthDate =
                      '$selectedYear-${_monthToNumber(selectedMonth!)}-${selectedDay!.padLeft(2, '0')}';

                  final formattedPhone = _formatPhoneNumber(rawPhone);

                  cubit.updateProfile(
                    fullName: nameController.text.trim(),
                    email: emailController.text.trim(),
                    phoneNumber: formattedPhone,
                    address: addressController.text.trim(),
                    birthDate: birthDate,
                    imgFile: _imageFile.value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBirthdayPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birthday *',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.neutral800,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildDropdown(
                hint: 'Day',
                items: List.generate(
                  31,
                  (i) => (i + 1).toString().padLeft(2, '0'),
                ),
                value: selectedDay,
                onChanged: (value) => setState(() => selectedDay = value),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildDropdown(
                hint: 'Month',
                items: [
                  'January',
                  'February',
                  'March',
                  'April',
                  'May',
                  'June',
                  'July',
                  'August',
                  'September',
                  'October',
                  'November',
                  'December',
                ],
                value: selectedMonth,
                onChanged: (value) => setState(() => selectedMonth = value),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildDropdown(
                hint: 'Year',
                items: List.generate(
                  100,
                  (i) => (DateTime.now().year - i).toString(),
                ),
                value: selectedYear,
                onChanged: (value) => setState(() => selectedYear = value),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          '* Required field',
          style: TextStyle(fontSize: 12.sp, color: AppColors.neutral500),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    final validValue = items.contains(value) ? value : null;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: DropdownButtonFormField<String>(
        initialValue: validValue,
        hint: Center(
          child: Text(
            hint,
            style: TextStyle(fontSize: 14.sp, color: AppColors.neutral500),
          ),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Center(
                  child: Text(e, style: TextStyle(fontSize: 14.sp)),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        icon: Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp),
        isExpanded: true,
      ),
    );
  }
}
