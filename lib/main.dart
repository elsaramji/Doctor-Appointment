import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/location/user_location.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/cubit/history_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'core/routes/app_router.dart';
import 'core/themes/app_theme.dart';
import 'features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart';
import 'features/HomePage/Presentation/cubit/specialties/specialties_cubit.dart';
import 'features/HomePage/domain/useCases/get_all_specialties_usecase.dart';
import 'features/HomePage/domain/useCases/make_doctor_fav_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  final tokenStorage = getIt<TokenStorage>();

  final accessToken = await tokenStorage.getAccessToken();
  final refreshToken = await tokenStorage.getRefreshToken();

  print('🎯 Access Token: $accessToken');
  print('🎯 Refresh Token: $refreshToken');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
      child: const LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpecialtiesCubit>(
          create: (context) => SpecialtiesCubit(
            allSpecialtiesUseCase: getIt<GetAllSpecialtiesUseCase>(),
          )..loadAllSpecialties(),
        ),

        BlocProvider<FavoriteCubit>(
          create: (context) =>
              FavoriteCubit(makeFavUseCase: getIt<MakeDoctorFavUseCase>()),
        ),

        BlocProvider<DoctorsCubit>(create: (context) => getIt<DoctorsCubit>()),
        BlocProvider<HistoryCubit>(create: (context) => getIt<HistoryCubit>()),
        BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
        BlocProvider<UserLocation>(create: (_) => UserLocation()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Cure Team 4',
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
