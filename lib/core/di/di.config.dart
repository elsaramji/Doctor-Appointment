// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/add_review/data/api_call/add_review_api_call.dart'
    as _i936;
import '../../features/add_review/data/datasources/add_review_remote_datasource.dart'
    as _i107;
import '../../features/add_review/data/datasources/add_review_remote_datasource_impl.dart'
    as _i789;
import '../../features/add_review/data/repositories/add_review_repo_impl.dart'
    as _i896;
import '../../features/add_review/domain/repositories/add_review_repo.dart'
    as _i561;
import '../../features/add_review/domain/usecases/add_review_usecase.dart'
    as _i779;
import '../../features/add_review/presentation/cubit/add_review_cubit.dart'
    as _i706;
import '../../features/auth/data/api_call/auth_api_call.dart' as _i986;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/datasources/auth_remote_datasource_impl.dart'
    as _i1071;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i503;
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i153;
import '../../features/auth/presentation/cubit/register_cubit/register_cubit.dart'
    as _i1006;
import '../../features/auth/presentation/cubit/verify_cubit/verify_cubit.dart'
    as _i911;
import '../../features/booking/data/api_call/booking_search_api_call.dart'
    as _i247;
import '../../features/booking/data/datasources/booking_search_remote_datasource.dart'
    as _i212;
import '../../features/booking/data/datasources/booking_search_remote_datasource_impl.dart'
    as _i879;
import '../../features/booking/data/repositories/booking_repo_impl.dart'
    as _i329;
import '../../features/booking/domain/repositories/booking_repo.dart' as _i110;
import '../../features/booking/domain/usecases/booking_search_usecase.dart'
    as _i724;
import '../../features/booking/domain/usecases/cancel_usecase.dart' as _i585;
import '../../features/booking/domain/usecases/reschedule_usecase.dart' as _i15;
import '../../features/booking/presentation/cubit/booking_cubit/booking_cubit.dart'
    as _i56;
import '../../features/booking/presentation/cubit/cancel_cubit/cancel_cubit.dart'
    as _i156;
import '../../features/booking/presentation/cubit/reschedule_cubit/reschedule_cubit.dart'
    as _i102;
import '../../features/call/presentation/cubit/call_cubit.dart' as _i581;
import '../../features/call/services/webrtc_service.dart' as _i151;
import '../../features/chat/data/models/chat_model.dart' as _i868;
import '../../features/chat/data/models/message_model.dart' as _i271;
import '../../features/chat/data/repos/chats_repo_impl.dart' as _i447;
import '../../features/chat/data/repos/massage_repo_impl.dart' as _i699;
import '../../features/chat/domain/entities/chat_entity.dart' as _i1065;
import '../../features/chat/domain/entities/massage_entity.dart' as _i854;
import '../../features/chat/domain/repos/chats_repo.dart' as _i867;
import '../../features/chat/domain/repos/massage_repo.dart' as _i447;
import '../../features/chat/domain/usecases/create_chat_use_case.dart' as _i142;
import '../../features/chat/presentation/cubits/chats_cubit_cubit.dart'
    as _i644;
import '../../features/chat/presentation/cubits/massages_cubit.dart' as _i396;
import '../../features/doctor_details/data/api_call/doctor_details_api_call.dart'
    as _i456;
import '../../features/doctor_details/data/datasources/doctor_details_remote_datasource.dart'
    as _i158;
import '../../features/doctor_details/data/datasources/doctor_details_remote_datasource_impl.dart'
    as _i133;
import '../../features/doctor_details/data/repositories/doctor_details_repo_impl.dart'
    as _i160;
import '../../features/doctor_details/domain/repositories/doctor_details_repo.dart'
    as _i46;
import '../../features/doctor_details/domain/usecases/doctor_details_usecase.dart'
    as _i364;
import '../../features/doctor_details/domain/usecases/get_available_slots_by_date_usecase.dart'
    as _i486;
import '../../features/doctor_details/presentation/cubit/doctor_details_cubit.dart'
    as _i560;
import '../../features/HomePage/data/api_call/doctors_api_call.dart' as _i482;
import '../../features/HomePage/data/data%20sources/all_doctors_remote_source.dart'
    as _i482;
import '../../features/HomePage/data/data%20sources/all_specialties_remote_source.dart'
    as _i365;
import '../../features/HomePage/data/data%20sources/post_fav_docs_remote_source.dart'
    as _i831;
import '../../features/HomePage/data/repos/all_doctors_repo_impl.dart' as _i541;
import '../../features/HomePage/data/repos/all_specialties_repo_impl.dart'
    as _i894;
import '../../features/HomePage/data/repos/doctor-fav_repo_impl.dart' as _i196;
import '../../features/HomePage/domain/repo/all_doctors_repo.dart' as _i669;
import '../../features/HomePage/domain/repo/all_specialties_repo.dart' as _i551;
import '../../features/HomePage/domain/repo/doctor__fav_repo.dart' as _i50;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_all_doctors_usecase.dart'
    as _i947;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_all_speciality_doctor_usecase.dart'
    as _i705;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_doctors_by_location_usecase.dart'
    as _i332;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_doctors_near_you_usecase.dart'
    as _i416;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_fav_doctors_usecase.dart'
    as _i735;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_searched_doctors_usecase.dart'
    as _i187;
import '../../features/HomePage/domain/useCases/Doctors%20Usecases/get_top_rated_doctors.dart'
    as _i220;
import '../../features/HomePage/domain/useCases/get_all_specialties_usecase.dart'
    as _i845;
import '../../features/HomePage/domain/useCases/make_doctor_fav_usecase.dart'
    as _i1061;
import '../../features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart'
    as _i151;
import '../../features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart'
    as _i193;
import '../../features/HomePage/Presentation/cubit/specialties/specialties_cubit.dart'
    as _i711;
import '../../features/pay/data/api_call/payment_api_call.dart' as _i411;
import '../../features/pay/data/datasources/payment_remote_datasource.dart'
    as _i736;
import '../../features/pay/data/datasources/payment_remote_datasource_impl.dart'
    as _i0;
import '../../features/pay/data/repositories/payment_repo_impl.dart' as _i939;
import '../../features/pay/domain/repositories/payment_repo.dart' as _i145;
import '../../features/pay/domain/usecases/payment_usecase.dart' as _i261;
import '../../features/pay/presentation/cubit/pay_cubit.dart' as _i372;
import '../../features/payment/data/datasources/payment_remote_datasource.dart'
    as _i247;
import '../../features/payment/data/repositories/payment_repository_impl.dart'
    as _i265;
import '../../features/payment/domain/repositories/payment_repository.dart'
    as _i639;
import '../../features/payment/domain/usecases/add_payment_usecase.dart'
    as _i79;
import '../../features/payment/domain/usecases/get_payment_methos_usecase.dart'
    as _i496;
import '../../features/payment/presentation/cubit/add_payment_cubit.dart'
    as _i278;
import '../../features/payment/presentation/cubit/payment_cubit.dart' as _i513;
import '../../features/profile/data/datasources/faq_remote_datasource.dart'
    as _i994;
import '../../features/profile/data/datasources/profile_remote_datasource.dart'
    as _i327;
import '../../features/profile/data/repositories/faq_repository_impl.dart'
    as _i791;
import '../../features/profile/data/repositories/profile_repo_impl.dart'
    as _i988;
import '../../features/profile/domain/repositories/faq_repository.dart'
    as _i552;
import '../../features/profile/domain/repositories/profile_repo.dart' as _i790;
import '../../features/profile/domain/usecases/get_faq_usecase.dart' as _i710;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i996;
import '../../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i478;
import '../../features/profile/presentation/cubit/faq_cubit.dart' as _i195;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import '../../features/Search/data/data%20sources/history_api_call.dart'
    as _i841;
import '../../features/Search/data/repos/history_repo_imp.dart' as _i292;
import '../../features/Search/domain/repos/history_repo.dart' as _i133;
import '../../features/Search/domain/usecases/history_usecase.dart' as _i729;
import '../../features/Search/presentation/cubit/history_cubit.dart' as _i498;
import '../helper/dio_helper.dart' as _i408;
import '../helper/token_storage.dart' as _i234;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i486.GetAvailableSlotsByDateUseCase>(
      () => _i486.GetAvailableSlotsByDateUseCase(),
    );
    gh.singleton<_i408.DioHelper>(() => _i408.DioHelper());
    gh.lazySingleton<_i234.TokenStorage>(() => _i234.TokenStorage());
    gh.singleton<_i447.MassageRepo>(
      () => _i699.MassageRepoImpl(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i327.ProfileRemoteDataSource>(
      () => _i327.ProfileRemoteDataSource(gh<_i408.DioHelper>()),
    );
    gh.factory<_i396.MassagesCubit>(
      () => _i396.MassagesCubit(gh<_i447.MassageRepo>()),
    );
    gh.lazySingleton<_i482.DoctorsRemoteSource>(
      () => _i482.DoctorsRemoteSourceImp(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i841.HistoryApiCall>(
      () => _i841.HistoryApiCallImp(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i994.FaqRemoteDataSource>(
      () => _i994.FaqRemoteDataSourceImpl(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i482.DoctorsApi>(
      () => _i482.DoctorsApi(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i936.AddReviewApiCall>(
      () => _i936.AddReviewApiCall(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i986.AuthApiCall>(
      () => _i986.AuthApiCall(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i247.PaymentRemoteDataSource>(
      () => _i247.PaymentRemoteDataSource(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i365.AllSpecialtiesRemoteSource>(
      () => _i365.AllSpecialtiesRemoteSourceImp(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i831.PostFavDocsRemoteSource>(
      () => _i831.PostFavDocsRemoteSourceImp(gh<_i408.DioHelper>()),
    );
    gh.factory<_i1065.ChatEntity>(
      () => _i868.ChatModel(
        id: gh<int>(),
        doctorId: gh<String>(),
        doctorName: gh<String>(),
        patientId: gh<String>(),
        isFavouriteDoctor: gh<bool>(),
        patientName: gh<String>(),
        createdAt: gh<String>(),
        unReadMessages: gh<int>(),
        lastReadAt: gh<DateTime>(),
        lastMessageContent: gh<String>(),
        isLastMessageSentByPatient: gh<bool>(),
        img: gh<String>(),
      ),
    );
    gh.lazySingleton<_i669.DoctorsRepository>(
      () => _i541.DoctorsRepoImp(remoteSource: gh<_i482.DoctorsRemoteSource>()),
    );
    gh.factory<_i854.ConversationEntity>(
      () => _i271.ConversationModel(
        id: gh<int>(),
        image: gh<String>(),
        name: gh<String>(),
        senderId: gh<String>(),
        receiverId: gh<String>(),
        messageListDTO: gh<List<_i854.MessageEntity>>(),
      ),
    );
    gh.lazySingleton<_i552.FaqRepository>(
      () => _i791.FaqRepositoryImpl(gh<_i994.FaqRemoteDataSource>()),
    );
    gh.lazySingleton<_i50.MakeDoctorFavRepo>(
      () => _i196.MakeDoctorFavRepoImp(
        remoteSource: gh<_i831.PostFavDocsRemoteSource>(),
      ),
    );
    gh.factory<_i1061.MakeDoctorFavUseCase>(
      () => _i1061.MakeDoctorFavUseCase(gh<_i50.MakeDoctorFavRepo>()),
    );
    gh.lazySingleton<_i133.HistoryRepo>(
      () => _i292.HistoryRepoImp(historyApiCall: gh<_i841.HistoryApiCall>()),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i1071.AuthRemoteDataSourceImpl(gh<_i986.AuthApiCall>()),
    );
    gh.lazySingleton<_i790.ProfileRepository>(
      () => _i988.ProfileRepositoryImpl(gh<_i327.ProfileRemoteDataSource>()),
    );
    gh.factory<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i408.DioHelper>(),
        gh<_i161.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i478.UpdateProfileUseCase>(
      () => _i478.UpdateProfileUseCase(
        gh<_i790.ProfileRepository>(),
        gh<_i234.TokenStorage>(),
      ),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.singleton<_i867.ChatsRepo>(
      () => _i447.ChatsRepoImpl(gh<_i408.DioHelper>()),
    );
    gh.factory<_i151.WebRTCService>(
      () => _i151.WebRTCService(dioHelper: gh<_i408.DioHelper>()),
    );
    gh.factory<_i729.HistoryUsecase>(
      () => _i729.HistoryUsecase(gh<_i133.HistoryRepo>()),
    );
    gh.factory<_i498.HistoryCubit>(
      () => _i498.HistoryCubit(historyUsecase: gh<_i729.HistoryUsecase>()),
    );
    gh.lazySingleton<_i996.GetProfileUseCase>(
      () => _i996.GetProfileUseCase(gh<_i790.ProfileRepository>()),
    );
    gh.factory<_i947.GetAllDoctorsUseCase>(
      () => _i947.GetAllDoctorsUseCase(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i705.GetAllSpecialityDoctorUseCase>(
      () => _i705.GetAllSpecialityDoctorUseCase(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i332.GetDoctorsByLocationUseCase>(
      () => _i332.GetDoctorsByLocationUseCase(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i416.GetDoctorsNearYouUseCase>(
      () => _i416.GetDoctorsNearYouUseCase(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i735.GetFavsDoctorsUseCase>(
      () => _i735.GetFavsDoctorsUseCase(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i187.GetSearchedDoctorsUsecase>(
      () => _i187.GetSearchedDoctorsUsecase(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i220.GetTopRatedDoctorsUsecae>(
      () => _i220.GetTopRatedDoctorsUsecae(gh<_i669.DoctorsRepository>()),
    );
    gh.factory<_i854.MessageEntity>(
      () => _i271.MessageModel(
        isPatient: gh<bool>(),
        senderUserId: gh<String>(),
        sentAt: gh<String>(),
        isRead: gh<bool>(),
        content: gh<String>(),
        mediaUrl: gh<String>(),
      ),
    );
    gh.lazySingleton<_i247.BookingSearchApiCall>(
      () => _i247.BookingSearchApiCall(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i456.DoctorDetailsApiCall>(
      () => _i456.DoctorDetailsApiCall(gh<_i408.DioHelper>()),
    );
    gh.lazySingleton<_i411.PaymentApiCall>(
      () => _i411.PaymentApiCall(gh<_i408.DioHelper>()),
    );
    gh.factory<_i142.CreateChatUseCase>(
      () => _i142.CreateChatUseCase(chatsRepo: gh<_i867.ChatsRepo>()),
    );
    gh.factory<_i644.ChatsCubit>(() => _i644.ChatsCubit(gh<_i867.ChatsRepo>()));
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i503.VerifyLoginUseCase>(
      () => _i503.VerifyLoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i503.VerifySignUpUseCase>(
      () => _i503.VerifySignUpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i107.AddReviewRemoteDatasource>(
      () => _i789.AddReviewRemoteDatasourceImpl(gh<_i936.AddReviewApiCall>()),
    );
    gh.lazySingleton<_i710.GetFaqUseCase>(
      () => _i710.GetFaqUseCase(
        gh<_i552.FaqRepository>(),
        gh<_i234.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i639.PaymentRepository>(
      () => _i265.PaymentRepositoryImpl(
        gh<_i247.PaymentRemoteDataSource>(),
        gh<_i234.TokenStorage>(),
      ),
    );
    gh.factory<_i561.AddReviewRepository>(
      () =>
          _i896.AddReviewRepositoryImpl(gh<_i107.AddReviewRemoteDatasource>()),
    );
    gh.lazySingleton<_i158.DoctorDetailsRemoteDataSource>(
      () => _i133.DoctorDetailsRemoteDataSourceImpl(
        gh<_i456.DoctorDetailsApiCall>(),
      ),
    );
    gh.lazySingleton<_i551.AllSpecialtiesRepo>(
      () => _i894.AllSpecialtiesRepoImp(
        remoteSource: gh<_i365.AllSpecialtiesRemoteSource>(),
      ),
    );
    gh.factory<_i46.DoctorDetailsRepo>(
      () => _i160.DoctorDetailsRepoImpl(
        gh<_i158.DoctorDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i911.VerifyCubit>(
      () => _i911.VerifyCubit(
        verifyLoginUseCase: gh<_i503.VerifyLoginUseCase>(),
        verifySignUpUseCase: gh<_i503.VerifySignUpUseCase>(),
      ),
    );
    gh.factory<_i779.AddReviewUseCase>(
      () => _i779.AddReviewUseCase(gh<_i561.AddReviewRepository>()),
    );
    gh.factory<_i706.AddReviewCubit>(
      () => _i706.AddReviewCubit(gh<_i779.AddReviewUseCase>()),
    );
    gh.factory<_i193.FavoriteCubit>(
      () => _i193.FavoriteCubit(
        makeFavUseCase: gh<_i1061.MakeDoctorFavUseCase>(),
      ),
    );
    gh.factory<_i581.CallCubit>(
      () => _i581.CallCubit(gh<_i151.WebRTCService>()),
    );
    gh.factory<_i153.LoginCubit>(
      () => _i153.LoginCubit(gh<_i188.LoginUseCase>()),
    );
    gh.factory<_i151.DoctorsCubit>(
      () => _i151.DoctorsCubit(
        allDoctors: gh<_i947.GetAllDoctorsUseCase>(),
        nearsDoctors: gh<_i416.GetDoctorsNearYouUseCase>(),
        specialityDoctors: gh<_i705.GetAllSpecialityDoctorUseCase>(),
        favsDoctors: gh<_i735.GetFavsDoctorsUseCase>(),
        doctorsByLocation: gh<_i332.GetDoctorsByLocationUseCase>(),
        topDocs: gh<_i220.GetTopRatedDoctorsUsecae>(),
        searchedDocs: gh<_i187.GetSearchedDoctorsUsecase>(),
      ),
    );
    gh.factory<_i36.ProfileCubit>(
      () => _i36.ProfileCubit(
        getProfileUseCase: gh<_i996.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i478.UpdateProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i736.PaymentRemoteDataSource>(
      () => _i0.PaymentRemoteDataSourceImpl(gh<_i411.PaymentApiCall>()),
    );
    gh.factory<_i1006.RegisterCubit>(
      () => _i1006.RegisterCubit(gh<_i941.RegisterUseCase>()),
    );
    gh.factory<_i845.GetAllSpecialtiesUseCase>(
      () => _i845.GetAllSpecialtiesUseCase(gh<_i551.AllSpecialtiesRepo>()),
    );
    gh.factory<_i364.GetDoctorDetailsUseCase>(
      () => _i364.GetDoctorDetailsUseCase(gh<_i46.DoctorDetailsRepo>()),
    );
    gh.lazySingleton<_i212.BookingSearchRemoteDataSource>(
      () => _i879.BookingSearchRemoteDataSourceImpl(
        gh<_i247.BookingSearchApiCall>(),
      ),
    );
    gh.factory<_i110.BookingRepo>(
      () => _i329.BookingRepoImpl(gh<_i212.BookingSearchRemoteDataSource>()),
    );
    gh.factory<_i195.FaqCubit>(() => _i195.FaqCubit(gh<_i710.GetFaqUseCase>()));
    gh.lazySingleton<_i496.GetPaymentMethods>(
      () => _i496.GetPaymentMethods(gh<_i639.PaymentRepository>()),
    );
    gh.factory<_i79.AddPaymentMethodUseCase>(
      () => _i79.AddPaymentMethodUseCase(gh<_i639.PaymentRepository>()),
    );
    gh.factory<_i711.SpecialtiesCubit>(
      () => _i711.SpecialtiesCubit(
        allSpecialtiesUseCase: gh<_i845.GetAllSpecialtiesUseCase>(),
      ),
    );
    gh.factory<_i278.AddPaymentCubit>(
      () => _i278.AddPaymentCubit(gh<_i79.AddPaymentMethodUseCase>()),
    );
    gh.factory<_i145.PaymentRepository>(
      () => _i939.PaymentRepositoryImpl(gh<_i736.PaymentRemoteDataSource>()),
    );
    gh.factory<_i513.PaymentCubit2>(
      () => _i513.PaymentCubit2(
        gh<_i496.GetPaymentMethods>(),
        gh<_i234.TokenStorage>(),
      ),
    );
    gh.factory<_i724.BookingSearchUseCase>(
      () => _i724.BookingSearchUseCase(gh<_i110.BookingRepo>()),
    );
    gh.factory<_i585.CancelBookingUseCase>(
      () => _i585.CancelBookingUseCase(gh<_i110.BookingRepo>()),
    );
    gh.factory<_i15.RescheduleBookingUseCase>(
      () => _i15.RescheduleBookingUseCase(gh<_i110.BookingRepo>()),
    );
    gh.factory<_i560.DoctorDetailsCubit>(
      () => _i560.DoctorDetailsCubit(
        gh<_i364.GetDoctorDetailsUseCase>(),
        gh<_i486.GetAvailableSlotsByDateUseCase>(),
      ),
    );
    gh.factory<_i156.CancelBookingCubit>(
      () => _i156.CancelBookingCubit(gh<_i585.CancelBookingUseCase>()),
    );
    gh.factory<_i56.BookingCubit>(
      () => _i56.BookingCubit(gh<_i724.BookingSearchUseCase>()),
    );
    gh.factory<_i261.PaymentUseCase>(
      () => _i261.PaymentUseCase(gh<_i145.PaymentRepository>()),
    );
    gh.factory<_i372.PaymentCubit>(
      () => _i372.PaymentCubit(gh<_i261.PaymentUseCase>()),
    );
    gh.factory<_i102.RescheduleCubit>(
      () => _i102.RescheduleCubit(gh<_i15.RescheduleBookingUseCase>()),
    );
    return this;
  }
}
