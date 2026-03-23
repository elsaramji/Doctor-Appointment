class ApiConstant {
  //TODO: Profile EnidPoint
  static const String getAllPayments = "api/Profile/PaymentMethods/getall";
  static const String addPaymentMethod = "api/Profile/PaymentMethods/add";
  static const String getProfile = "api/profile/Editprofile/getprofile";
  static const String updateProfile = "api/profile/Editprofile/updateprofile";
  static const String faq = "api/profile/faq";
  static const String logout = "/api/Identity/Accounts/logout";
  //TODO: base Url
  static const String baseUrl = "https://cure-doctor-booking.runasp.net/";
  //TODO: Doctor Details Logic EndPoint
  static const String doctorDetailsEndPoint =
      "api/Customer/Doctors/DoctorDetails";
  //TODO: Pay Logic Endpoint
  static const String payEndPoint = "api/Customer/Booking/CreateBooking";
  //TODO: Review Logic Endpoint
  static const String getReviewsByDoctorEndPoint =
      "api/Customer/Reviews/GetReviewsByDoctor";
  static const String addReviewEndPoint = "api/Customer/Reviews/AddReview";

  //TODO: Booking Search Endpoint
  static const String bookingSearchEndPoint =
      "api/Customer/Booking/BookingSearch";

  //TODO: Booking Cancel Endpoint
  static const String bookingCancelEndPoint =
      "api/Customer/Booking/CancelBooking";
  static const String bookingRescheduleEndPoint =
      "api/Customer/Booking/RescheduleBooking";

  //TODO: Auth End Point
  static const registerEndPoint = "api/Identity/Accounts/Register";
  static const loginEndPoint = "api/Identity/Accounts/login";
  static const verifySignUpEndPoint = "api/Identity/Accounts/verify-register";
  static const verifyLoginEndPoint = "api/Identity/Accounts/verify-login";

  //TODO: Doctor Near You  EndPoint
  static const String doctorNearYou = "api/Customer/Doctors/GetNearestDoctors";

  //TODO: All Doctors EndPoint
  static const String allDoctors = "api/Customer/Doctors/GetAllDoctors";

  //TODO: All Specialties EndPoint
  static const String allSpecialties =
      "api/Customer/Specialists/GetAllSpecialists";

  //TODO:  Specialty EndPoint
  static const String Specialty =
      "api/Customer/Specialists/GetAllDoctorsInSpecialist";

  //TODO:  Search By Location EndPoint
  static const String searchByLocation =
      "api/Customer/SearchData/SearchByLocation";

  //TODO:  Favorite Doctors EndPoint
  static const String favoriteDoctors =
      "api/Customer/Favourites/GetAllFavourites";

  //TODO:  Make Favorite Doctors EndPoint
  static const String makeFavoriteDoctors =
      "api/Customer/Favourites/FavouriteAndUnFavourite";

  //TODO:  Search About Doctors EndPoint
  static const String searchAboutDocs = "api/Customer/SearchData/SearchDoctors";

  //TODO:  Top Rted Doctors EndPoint
  static const String topDoctors = "api/Customer/Doctors/GetTopRatedDoctors";

  //TODO:  Search History EndPoint
  static const String history = "api/Customer/SearchData/GetHistory";

  //TODO:  Google KEY
  static const String googleKey = "AIzaSyCuTilAfnGfkZtIx0T3qf-eOmWZ_N2LpoY";

  static const String callOffer = "api/realtime/call/offer";
  static const String callAnswer = "api/realtime/call/answer";
  static const String callCandidate = "api/realtime/call/candidate";
  static const String callEnd = "api/realtime/call/end";
}
