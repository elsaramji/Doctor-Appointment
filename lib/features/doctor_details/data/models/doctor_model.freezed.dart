// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {

 String? get userName; String? get imageUrl; String? get comment;@JsonKey(name: 'createdAt', fromJson: _fixDate) String? get createdAt; double? get rating;
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<ReviewModel> get copyWith => _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewModel&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,imageUrl,comment,createdAt,rating);

@override
String toString() {
  return 'ReviewModel(userName: $userName, imageUrl: $imageUrl, comment: $comment, createdAt: $createdAt, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res>  {
  factory $ReviewModelCopyWith(ReviewModel value, $Res Function(ReviewModel) _then) = _$ReviewModelCopyWithImpl;
@useResult
$Res call({
 String? userName, String? imageUrl, String? comment,@JsonKey(name: 'createdAt', fromJson: _fixDate) String? createdAt, double? rating
});




}
/// @nodoc
class _$ReviewModelCopyWithImpl<$Res>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = freezed,Object? imageUrl = freezed,Object? comment = freezed,Object? createdAt = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userName,  String? imageUrl,  String? comment, @JsonKey(name: 'createdAt', fromJson: _fixDate)  String? createdAt,  double? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.userName,_that.imageUrl,_that.comment,_that.createdAt,_that.rating);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userName,  String? imageUrl,  String? comment, @JsonKey(name: 'createdAt', fromJson: _fixDate)  String? createdAt,  double? rating)  $default,) {final _that = this;
switch (_that) {
case _ReviewModel():
return $default(_that.userName,_that.imageUrl,_that.comment,_that.createdAt,_that.rating);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userName,  String? imageUrl,  String? comment, @JsonKey(name: 'createdAt', fromJson: _fixDate)  String? createdAt,  double? rating)?  $default,) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.userName,_that.imageUrl,_that.comment,_that.createdAt,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewModel implements ReviewModel {
  const _ReviewModel({required this.userName, required this.imageUrl, required this.comment, @JsonKey(name: 'createdAt', fromJson: _fixDate) required this.createdAt, required this.rating});
  factory _ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

@override final  String? userName;
@override final  String? imageUrl;
@override final  String? comment;
@override@JsonKey(name: 'createdAt', fromJson: _fixDate) final  String? createdAt;
@override final  double? rating;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewModelCopyWith<_ReviewModel> get copyWith => __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewModel&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,imageUrl,comment,createdAt,rating);

@override
String toString() {
  return 'ReviewModel(userName: $userName, imageUrl: $imageUrl, comment: $comment, createdAt: $createdAt, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res> implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(_ReviewModel value, $Res Function(_ReviewModel) _then) = __$ReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String? userName, String? imageUrl, String? comment,@JsonKey(name: 'createdAt', fromJson: _fixDate) String? createdAt, double? rating
});




}
/// @nodoc
class __$ReviewModelCopyWithImpl<$Res>
    implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = freezed,Object? imageUrl = freezed,Object? comment = freezed,Object? createdAt = freezed,Object? rating = freezed,}) {
  return _then(_ReviewModel(
userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Doctor {

 int get id; String get userId; String get fullName; String get email; String get phoneNumber; String get address; String get about; double get rating; int get pricePerHour; int get experienceYears; String get imgUrl; int get reviewsCount; List<ReviewModel> get reviews; List<String> get specialities; List<String> get licenses; double get latitude;@JsonKey(name: 'langtude') double get longitude; int get bookingCount; List<Slot> get availableSlots; bool get isFavourite;
/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorCopyWith<Doctor> get copyWith => _$DoctorCopyWithImpl<Doctor>(this as Doctor, _$identity);

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.about, about) || other.about == about)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.pricePerHour, pricePerHour) || other.pricePerHour == pricePerHour)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&const DeepCollectionEquality().equals(other.specialities, specialities)&&const DeepCollectionEquality().equals(other.licenses, licenses)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.bookingCount, bookingCount) || other.bookingCount == bookingCount)&&const DeepCollectionEquality().equals(other.availableSlots, availableSlots)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,fullName,email,phoneNumber,address,about,rating,pricePerHour,experienceYears,imgUrl,reviewsCount,const DeepCollectionEquality().hash(reviews),const DeepCollectionEquality().hash(specialities),const DeepCollectionEquality().hash(licenses),latitude,longitude,bookingCount,const DeepCollectionEquality().hash(availableSlots),isFavourite]);

@override
String toString() {
  return 'Doctor(id: $id, userId: $userId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, address: $address, about: $about, rating: $rating, pricePerHour: $pricePerHour, experienceYears: $experienceYears, imgUrl: $imgUrl, reviewsCount: $reviewsCount, reviews: $reviews, specialities: $specialities, licenses: $licenses, latitude: $latitude, longitude: $longitude, bookingCount: $bookingCount, availableSlots: $availableSlots, isFavourite: $isFavourite)';
}


}

/// @nodoc
abstract mixin class $DoctorCopyWith<$Res>  {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) _then) = _$DoctorCopyWithImpl;
@useResult
$Res call({
 int id, String userId, String fullName, String email, String phoneNumber, String address, String about, double rating, int pricePerHour, int experienceYears, String imgUrl, int reviewsCount, List<ReviewModel> reviews, List<String> specialities, List<String> licenses, double latitude,@JsonKey(name: 'langtude') double longitude, int bookingCount, List<Slot> availableSlots, bool isFavourite
});




}
/// @nodoc
class _$DoctorCopyWithImpl<$Res>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._self, this._then);

  final Doctor _self;
  final $Res Function(Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? about = null,Object? rating = null,Object? pricePerHour = null,Object? experienceYears = null,Object? imgUrl = null,Object? reviewsCount = null,Object? reviews = null,Object? specialities = null,Object? licenses = null,Object? latitude = null,Object? longitude = null,Object? bookingCount = null,Object? availableSlots = null,Object? isFavourite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,about: null == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,pricePerHour: null == pricePerHour ? _self.pricePerHour : pricePerHour // ignore: cast_nullable_to_non_nullable
as int,experienceYears: null == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,specialities: null == specialities ? _self.specialities : specialities // ignore: cast_nullable_to_non_nullable
as List<String>,licenses: null == licenses ? _self.licenses : licenses // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,bookingCount: null == bookingCount ? _self.bookingCount : bookingCount // ignore: cast_nullable_to_non_nullable
as int,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as List<Slot>,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Doctor].
extension DoctorPatterns on Doctor {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Doctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Doctor value)  $default,){
final _that = this;
switch (_that) {
case _Doctor():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Doctor value)?  $default,){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String userId,  String fullName,  String email,  String phoneNumber,  String address,  String about,  double rating,  int pricePerHour,  int experienceYears,  String imgUrl,  int reviewsCount,  List<ReviewModel> reviews,  List<String> specialities,  List<String> licenses,  double latitude, @JsonKey(name: 'langtude')  double longitude,  int bookingCount,  List<Slot> availableSlots,  bool isFavourite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.email,_that.phoneNumber,_that.address,_that.about,_that.rating,_that.pricePerHour,_that.experienceYears,_that.imgUrl,_that.reviewsCount,_that.reviews,_that.specialities,_that.licenses,_that.latitude,_that.longitude,_that.bookingCount,_that.availableSlots,_that.isFavourite);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String userId,  String fullName,  String email,  String phoneNumber,  String address,  String about,  double rating,  int pricePerHour,  int experienceYears,  String imgUrl,  int reviewsCount,  List<ReviewModel> reviews,  List<String> specialities,  List<String> licenses,  double latitude, @JsonKey(name: 'langtude')  double longitude,  int bookingCount,  List<Slot> availableSlots,  bool isFavourite)  $default,) {final _that = this;
switch (_that) {
case _Doctor():
return $default(_that.id,_that.userId,_that.fullName,_that.email,_that.phoneNumber,_that.address,_that.about,_that.rating,_that.pricePerHour,_that.experienceYears,_that.imgUrl,_that.reviewsCount,_that.reviews,_that.specialities,_that.licenses,_that.latitude,_that.longitude,_that.bookingCount,_that.availableSlots,_that.isFavourite);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String userId,  String fullName,  String email,  String phoneNumber,  String address,  String about,  double rating,  int pricePerHour,  int experienceYears,  String imgUrl,  int reviewsCount,  List<ReviewModel> reviews,  List<String> specialities,  List<String> licenses,  double latitude, @JsonKey(name: 'langtude')  double longitude,  int bookingCount,  List<Slot> availableSlots,  bool isFavourite)?  $default,) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.email,_that.phoneNumber,_that.address,_that.about,_that.rating,_that.pricePerHour,_that.experienceYears,_that.imgUrl,_that.reviewsCount,_that.reviews,_that.specialities,_that.licenses,_that.latitude,_that.longitude,_that.bookingCount,_that.availableSlots,_that.isFavourite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Doctor implements Doctor {
  const _Doctor({required this.id, required this.userId, required this.fullName, required this.email, required this.phoneNumber, required this.address, required this.about, required this.rating, required this.pricePerHour, required this.experienceYears, required this.imgUrl, required this.reviewsCount, required final  List<ReviewModel> reviews, required final  List<String> specialities, required final  List<String> licenses, required this.latitude, @JsonKey(name: 'langtude') required this.longitude, required this.bookingCount, required final  List<Slot> availableSlots, this.isFavourite = false}): _reviews = reviews,_specialities = specialities,_licenses = licenses,_availableSlots = availableSlots;
  factory _Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

@override final  int id;
@override final  String userId;
@override final  String fullName;
@override final  String email;
@override final  String phoneNumber;
@override final  String address;
@override final  String about;
@override final  double rating;
@override final  int pricePerHour;
@override final  int experienceYears;
@override final  String imgUrl;
@override final  int reviewsCount;
 final  List<ReviewModel> _reviews;
@override List<ReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

 final  List<String> _specialities;
@override List<String> get specialities {
  if (_specialities is EqualUnmodifiableListView) return _specialities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialities);
}

 final  List<String> _licenses;
@override List<String> get licenses {
  if (_licenses is EqualUnmodifiableListView) return _licenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_licenses);
}

@override final  double latitude;
@override@JsonKey(name: 'langtude') final  double longitude;
@override final  int bookingCount;
 final  List<Slot> _availableSlots;
@override List<Slot> get availableSlots {
  if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableSlots);
}

@override@JsonKey() final  bool isFavourite;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorCopyWith<_Doctor> get copyWith => __$DoctorCopyWithImpl<_Doctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.about, about) || other.about == about)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.pricePerHour, pricePerHour) || other.pricePerHour == pricePerHour)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&const DeepCollectionEquality().equals(other._specialities, _specialities)&&const DeepCollectionEquality().equals(other._licenses, _licenses)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.bookingCount, bookingCount) || other.bookingCount == bookingCount)&&const DeepCollectionEquality().equals(other._availableSlots, _availableSlots)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,fullName,email,phoneNumber,address,about,rating,pricePerHour,experienceYears,imgUrl,reviewsCount,const DeepCollectionEquality().hash(_reviews),const DeepCollectionEquality().hash(_specialities),const DeepCollectionEquality().hash(_licenses),latitude,longitude,bookingCount,const DeepCollectionEquality().hash(_availableSlots),isFavourite]);

@override
String toString() {
  return 'Doctor(id: $id, userId: $userId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, address: $address, about: $about, rating: $rating, pricePerHour: $pricePerHour, experienceYears: $experienceYears, imgUrl: $imgUrl, reviewsCount: $reviewsCount, reviews: $reviews, specialities: $specialities, licenses: $licenses, latitude: $latitude, longitude: $longitude, bookingCount: $bookingCount, availableSlots: $availableSlots, isFavourite: $isFavourite)';
}


}

/// @nodoc
abstract mixin class _$DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$DoctorCopyWith(_Doctor value, $Res Function(_Doctor) _then) = __$DoctorCopyWithImpl;
@override @useResult
$Res call({
 int id, String userId, String fullName, String email, String phoneNumber, String address, String about, double rating, int pricePerHour, int experienceYears, String imgUrl, int reviewsCount, List<ReviewModel> reviews, List<String> specialities, List<String> licenses, double latitude,@JsonKey(name: 'langtude') double longitude, int bookingCount, List<Slot> availableSlots, bool isFavourite
});




}
/// @nodoc
class __$DoctorCopyWithImpl<$Res>
    implements _$DoctorCopyWith<$Res> {
  __$DoctorCopyWithImpl(this._self, this._then);

  final _Doctor _self;
  final $Res Function(_Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? about = null,Object? rating = null,Object? pricePerHour = null,Object? experienceYears = null,Object? imgUrl = null,Object? reviewsCount = null,Object? reviews = null,Object? specialities = null,Object? licenses = null,Object? latitude = null,Object? longitude = null,Object? bookingCount = null,Object? availableSlots = null,Object? isFavourite = null,}) {
  return _then(_Doctor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,about: null == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,pricePerHour: null == pricePerHour ? _self.pricePerHour : pricePerHour // ignore: cast_nullable_to_non_nullable
as int,experienceYears: null == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewModel>,specialities: null == specialities ? _self._specialities : specialities // ignore: cast_nullable_to_non_nullable
as List<String>,licenses: null == licenses ? _self._licenses : licenses // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,bookingCount: null == bookingCount ? _self.bookingCount : bookingCount // ignore: cast_nullable_to_non_nullable
as int,availableSlots: null == availableSlots ? _self._availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as List<Slot>,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Slot {

 int get id; int get doctorId; String get dateTime; String get startTime; String get endTime; bool get isBooked;
/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotCopyWith<Slot> get copyWith => _$SlotCopyWithImpl<Slot>(this as Slot, _$identity);

  /// Serializes this Slot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Slot&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,dateTime,startTime,endTime,isBooked);

@override
String toString() {
  return 'Slot(id: $id, doctorId: $doctorId, dateTime: $dateTime, startTime: $startTime, endTime: $endTime, isBooked: $isBooked)';
}


}

/// @nodoc
abstract mixin class $SlotCopyWith<$Res>  {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) _then) = _$SlotCopyWithImpl;
@useResult
$Res call({
 int id, int doctorId, String dateTime, String startTime, String endTime, bool isBooked
});




}
/// @nodoc
class _$SlotCopyWithImpl<$Res>
    implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._self, this._then);

  final Slot _self;
  final $Res Function(Slot) _then;

/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? dateTime = null,Object? startTime = null,Object? endTime = null,Object? isBooked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Slot].
extension SlotPatterns on Slot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Slot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Slot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Slot value)  $default,){
final _that = this;
switch (_that) {
case _Slot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Slot value)?  $default,){
final _that = this;
switch (_that) {
case _Slot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int doctorId,  String dateTime,  String startTime,  String endTime,  bool isBooked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Slot() when $default != null:
return $default(_that.id,_that.doctorId,_that.dateTime,_that.startTime,_that.endTime,_that.isBooked);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int doctorId,  String dateTime,  String startTime,  String endTime,  bool isBooked)  $default,) {final _that = this;
switch (_that) {
case _Slot():
return $default(_that.id,_that.doctorId,_that.dateTime,_that.startTime,_that.endTime,_that.isBooked);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int doctorId,  String dateTime,  String startTime,  String endTime,  bool isBooked)?  $default,) {final _that = this;
switch (_that) {
case _Slot() when $default != null:
return $default(_that.id,_that.doctorId,_that.dateTime,_that.startTime,_that.endTime,_that.isBooked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Slot extends Slot {
  const _Slot({required this.id, required this.doctorId, required this.dateTime, required this.startTime, required this.endTime, required this.isBooked}): super._();
  factory _Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

@override final  int id;
@override final  int doctorId;
@override final  String dateTime;
@override final  String startTime;
@override final  String endTime;
@override final  bool isBooked;

/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotCopyWith<_Slot> get copyWith => __$SlotCopyWithImpl<_Slot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Slot&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,dateTime,startTime,endTime,isBooked);

@override
String toString() {
  return 'Slot(id: $id, doctorId: $doctorId, dateTime: $dateTime, startTime: $startTime, endTime: $endTime, isBooked: $isBooked)';
}


}

/// @nodoc
abstract mixin class _$SlotCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$SlotCopyWith(_Slot value, $Res Function(_Slot) _then) = __$SlotCopyWithImpl;
@override @useResult
$Res call({
 int id, int doctorId, String dateTime, String startTime, String endTime, bool isBooked
});




}
/// @nodoc
class __$SlotCopyWithImpl<$Res>
    implements _$SlotCopyWith<$Res> {
  __$SlotCopyWithImpl(this._self, this._then);

  final _Slot _self;
  final $Res Function(_Slot) _then;

/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? dateTime = null,Object? startTime = null,Object? endTime = null,Object? isBooked = null,}) {
  return _then(_Slot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
