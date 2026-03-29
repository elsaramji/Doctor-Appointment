import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/core/shared_widget/BottomNavigationWidget.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/screens/allNearDoctorspage.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/screens/allSpecialties.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/screens/favoritePage.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/screens/homePage.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/screens/mapPage.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/screens/mapResults.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/screens/searchPage.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/screens/searchResultsPage.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/presentation/pages/add_review_page.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/pages/login_page.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/pages/otp_page.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/pages/register_page.dart';
import 'package:round_7_mobile_cure_team4/features/book_appointment/presentation/pages/book_appointment_page.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/pages/my_booking_page.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/pages/reschedule_page.dart';
import 'package:round_7_mobile_cure_team4/features/chat/data/models/chat_model.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/views/chats_list_overview.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/pages/doctor_details_page.dart';
import 'package:round_7_mobile_cure_team4/features/notifications/presentation/pages/notification_page.dart';
import 'package:round_7_mobile_cure_team4/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:round_7_mobile_cure_team4/features/pay/presentation/pages/pay_page.dart';
import 'package:round_7_mobile_cure_team4/features/payment/presentation/add_new_card.dart';
import 'package:round_7_mobile_cure_team4/features/payment/presentation/empty_card.dart';
import 'package:round_7_mobile_cure_team4/features/payment/presentation/payment_screen.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/faq_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/screens/FAQs.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/screens/edit_profile.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/screens/privacy_policy.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/screens/profile.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/screens/setting/password_management_screen.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/screens/setting/settings.dart';

import '../../features/call/presentation/views/video_call_view.dart';
import '../../features/call/presentation/views/voice_call_view.dart';
import '../../features/chat/presentation/views/chat_converstion.dart';
import '../../features/payment/presentation/card_version.dart';
import '../../features/payment/presentation/cubit/add_payment_cubit.dart';
import '../../features/payment/presentation/cubit/payment_cubit.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';

class AppRoutes {
  static const String home = '/';
  static const String chatOverView = '/chat_overview';
  static const String chatConversion = '/chat_conversion';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String otp = '/otp';
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String settings = '/profile/settings';
  static const String passwordManagement =
      '/profile/settings/password_management';
  static const String payment = '/profile/payment';
  static const String emptyCards = '/profile/payments/empty';
  static const String addNewCard = '/profile/payments/add';
  static const String cardVersion = '/profile/payments/card_version';
  static const String faqs = '/profile/faqs';
  static const String privacy = '/profile/privacy';
  static const String doctorDetails = '/doctorDetails';
  static const String bookAppointment = '/bookAppointment';
  static const String myBooking = '/myBooking';
  static const String reschedulePage = '/Reschedule';
  static const String pay = '/pay';
  static const String notifications = '/notifications';
  static const String addReview = '/AddReviewPage';
  static const String favorite = '/favorite';
  static const String search = '/search';
  static const String searchResults = '/results/:query';
  static const String specialties = '/specialties';
  static const String map = '/map';
  static const String chat = '/chat';
  static const String allNearDoctors = '/allNearDoctors';

  static const String mapResults = '/mapResults';

  static const String onboarding = '/onboarding';

  // call
  static const String voiceCall = '/voiceCall';
  static const String videoCall = '/videoCall';
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.home,
    redirect: (context, state) async {
      final tokenStorage = getIt<TokenStorage>();
      final token = await tokenStorage.getAccessToken();
      final isAuthenticated = token != null && token.isNotEmpty;

      final isOnboardingPage = state.matchedLocation == AppRoutes.onboarding;
      final isAuthPage =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.signup ||
          state.matchedLocation == AppRoutes.otp;

      if (isOnboardingPage) {
        if (isAuthenticated) {
          return AppRoutes.home;
        }
        return null;
      }

      if (isAuthPage) {
        if (isAuthenticated) {
          return AppRoutes.home;
        }
        return null;
      }

      if (!isAuthenticated) {
        final hasSeenOnboarding = await tokenStorage.hasSeenOnboarding();
        if (!hasSeenOnboarding) {
          return AppRoutes.onboarding;
        }
        return AppRoutes.login;
      }

      return null;
    },
    routes: [
      // Shell route for bottom navigation pages
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavigationWidget(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const Homepage(),
          ),
          GoRoute(
            path: AppRoutes.myBooking,
            name: 'myBooking',
            builder: (context, state) {
              return BlocProvider(
                create: (_) => getIt<BookingCubit>(),
                child: const MyBookingPage(),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.chat,
            builder: (context, state) => const ChatsListOverview(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => BlocProvider.value(
              value: getIt<ProfileCubit>()..fetchProfile(),
              child: ProfileScreen(),
            ),
          ),
        ],
      ),

      // Onboarding route
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),

      // Auth routes
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: 'signup',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        name: 'otp',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;

          if (extra == null ||
              !extra.containsKey('phone') ||
              !extra.containsKey('isLogin')) {
            return const Scaffold(
              body: Center(child: Text('Missing required data')),
            );
          }

          final String phoneNumber = extra['phone'];
          final bool isLogin = extra['isLogin'];
          final String email = extra['email'];

          return OtpPage(
            phoneNumber: phoneNumber,
            isLogin: isLogin,
            email: email,
          );
        },
      ),

      // Profile & settings routes
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<ProfileCubit>()..fetchProfile(),
          child: const EditProfileScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.faqs,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<FaqCubit>(),
          child: const FaqScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordManagement,
        builder: (context, state) => const PasswordManagementScreen(),
      ),
      GoRoute(
        path: AppRoutes.privacy,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),

      // Doctor & booking routes
      GoRoute(
        path: AppRoutes.doctorDetails,
        builder: (context, state) {
          final docID =
              int.tryParse(state.uri.queryParameters['docID'] ?? '1') ?? 1;
          return DoctorDetailsPage(id: docID);
        },
      ),
      GoRoute(
        path: AppRoutes.bookAppointment,
        name: AppRoutes.bookAppointment,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          if (extra == null) {
            return const Scaffold(
              body: Center(child: Text('Missing required data')),
            );
          }
          final DoctorDetailsEntity doctor =
              extra['doctor'] as DoctorDetailsEntity;
          final availableDates =
              (extra['availableDates'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [];
          final Map<String, List<Map<String, dynamic>>> availableTimesByDate =
              (extra['availableTimesByDate'] as Map<String, dynamic>?)?.map(
                (key, value) => MapEntry(
                  key,
                  (value as List<dynamic>?)
                          ?.map((e) => Map<String, dynamic>.from(e as Map))
                          .toList() ??
                      [],
                ),
              ) ??
              {};
          return BookAppointmentPage(
            doctor: doctor,
            availableDates: availableDates,
            availableTimesByDate: availableTimesByDate,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.reschedulePage,
        name: AppRoutes.reschedulePage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          if (extra == null || !extra.containsKey('booking')) {
            return Scaffold(body: Center(child: Text('Missing booking data')));
          }
          final booking = extra['booking'] as BookingEntity;
          return ReschedulePage(doctor: booking);
        },
      ),

      // Payment routes
      GoRoute(
        path: AppRoutes.pay,
        name: "/pay",
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          if (extra == null) {
            return const Scaffold(
              body: Center(child: Text('Missing required data')),
            );
          }
          final DoctorDetailsEntity doctor =
              extra['doctor'] as DoctorDetailsEntity;
          final String date = extra['date'] as String? ?? '';
          final String displayDate = extra['displayDate'] as String? ?? '';
          final String time = extra['time'] as String? ?? '';
          final int slotId = extra['slotId'] as int? ?? 0;
          return PayPage(
            date: date,
            displayDate: displayDate,
            time: time,
            doctor: doctor,
            slotId: slotId,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.emptyCards,
        builder: (context, state) => const EmptyCardsScreen(),
      ),

      GoRoute(
        path: AppRoutes.cardVersion,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<PaymentCubit2>()..fetchPayments(),
          child: CardVersionScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.addNewCard,
        builder: (context, state) {
          final userToken = state.extra?.toString() ?? '';
          return BlocProvider(
            create: (_) => getIt<AddPaymentCubit>(),
            child: AddNewCardScreen(userToken: userToken),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.payment,
        builder: (context, state) => PaymentMethodScreen(),
      ),

      // Notifications & reviews
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => NotificationPage(),
      ),
      GoRoute(
        path: AppRoutes.addReview,
        builder: (context, state) => const AddReviewPage(),
      ),

      // Search & favorites
      GoRoute(
        path: AppRoutes.favorite,
        builder: (context, state) => FavoritePage(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.allNearDoctors,
        builder: (context, state) => AllNearDoctorsPage(),
      ),
      GoRoute(
        path: '/results/:query',
        name: 'result',
        builder: (context, state) {
          final query = state.pathParameters['query'] ?? '';
          return SearchResultsPage(strID: query);
        },
      ),

      GoRoute(
        path: AppRoutes.mapResults,
        name: 'mapResults',
        builder: (context, state) {
          final lon =
              double.tryParse(state.uri.queryParameters['longitude'] ?? '0') ??
              0;
          final lat =
              double.tryParse(state.uri.queryParameters['latitude'] ?? '0') ??
              0;

          return MapResultsPage(longitude: lon, latitude: lat);
        },
      ),

      GoRoute(
        path: AppRoutes.specialties,
        builder: (context, state) => const AllSpecialties(),
      ),

      GoRoute(
        path: AppRoutes.map,
        name: 'map',
        builder: (context, state) {
          final myBool = state.extra is bool ? state.extra as bool : false;
          return MapPage(myBool: myBool);
        },
      ),

      GoRoute(
        path: AppRoutes.chatConversion,
        builder: (context, state) {
          final chat = state.extra as ChatModel;
          return ChatConversion(chat: chat);
        },
      ),

      // voice & video call
      GoRoute(
        path: AppRoutes.voiceCall,
        builder: (context, state) {
          final chat = state.extra as ChatModel;
          return VoiceCallView(conversation: chat);
        },
      ),
      GoRoute(
        path: AppRoutes.videoCall,
        builder: (context, state) {
          final chat = state.extra as ChatModel;
          return VideoCallView(conversation: chat);
        },
      ),
    ],
  );
}
