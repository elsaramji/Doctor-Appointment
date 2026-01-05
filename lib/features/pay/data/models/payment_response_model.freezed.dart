// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentResponseModel {

 bool get success; String get message; PaymentDataModel? get data;
/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentResponseModelCopyWith<PaymentResponseModel> get copyWith => _$PaymentResponseModelCopyWithImpl<PaymentResponseModel>(this as PaymentResponseModel, _$identity);

  /// Serializes this PaymentResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'PaymentResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $PaymentResponseModelCopyWith<$Res>  {
  factory $PaymentResponseModelCopyWith(PaymentResponseModel value, $Res Function(PaymentResponseModel) _then) = _$PaymentResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, PaymentDataModel? data
});


$PaymentDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$PaymentResponseModelCopyWithImpl<$Res>
    implements $PaymentResponseModelCopyWith<$Res> {
  _$PaymentResponseModelCopyWithImpl(this._self, this._then);

  final PaymentResponseModel _self;
  final $Res Function(PaymentResponseModel) _then;

/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaymentDataModel?,
  ));
}
/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PaymentDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentResponseModel].
extension PaymentResponseModelPatterns on PaymentResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  PaymentDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  PaymentDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _PaymentResponseModel():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  PaymentDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _PaymentResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentResponseModel implements PaymentResponseModel {
  const _PaymentResponseModel({this.success = false, this.message = '', this.data});
  factory _PaymentResponseModel.fromJson(Map<String, dynamic> json) => _$PaymentResponseModelFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  PaymentDataModel? data;

/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentResponseModelCopyWith<_PaymentResponseModel> get copyWith => __$PaymentResponseModelCopyWithImpl<_PaymentResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'PaymentResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PaymentResponseModelCopyWith<$Res> implements $PaymentResponseModelCopyWith<$Res> {
  factory _$PaymentResponseModelCopyWith(_PaymentResponseModel value, $Res Function(_PaymentResponseModel) _then) = __$PaymentResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, PaymentDataModel? data
});


@override $PaymentDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$PaymentResponseModelCopyWithImpl<$Res>
    implements _$PaymentResponseModelCopyWith<$Res> {
  __$PaymentResponseModelCopyWithImpl(this._self, this._then);

  final _PaymentResponseModel _self;
  final $Res Function(_PaymentResponseModel) _then;

/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_PaymentResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaymentDataModel?,
  ));
}

/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PaymentDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PaymentDataModel {

 int get id; int get doctorId; String get doctorName; String get doctorSpeciality; String get doctorImg; int get patientId; String get patientName;@JsonKey(name: 'payment') String get paymentMethod; String get status; String get paymentUrl; DateTime? get appointmentAt;
/// Create a copy of PaymentDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDataModelCopyWith<PaymentDataModel> get copyWith => _$PaymentDataModelCopyWithImpl<PaymentDataModel>(this as PaymentDataModel, _$identity);

  /// Serializes this PaymentDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorSpeciality, doctorSpeciality) || other.doctorSpeciality == doctorSpeciality)&&(identical(other.doctorImg, doctorImg) || other.doctorImg == doctorImg)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.appointmentAt, appointmentAt) || other.appointmentAt == appointmentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,doctorName,doctorSpeciality,doctorImg,patientId,patientName,paymentMethod,status,paymentUrl,appointmentAt);

@override
String toString() {
  return 'PaymentDataModel(id: $id, doctorId: $doctorId, doctorName: $doctorName, doctorSpeciality: $doctorSpeciality, doctorImg: $doctorImg, patientId: $patientId, patientName: $patientName, paymentMethod: $paymentMethod, status: $status, paymentUrl: $paymentUrl, appointmentAt: $appointmentAt)';
}


}

/// @nodoc
abstract mixin class $PaymentDataModelCopyWith<$Res>  {
  factory $PaymentDataModelCopyWith(PaymentDataModel value, $Res Function(PaymentDataModel) _then) = _$PaymentDataModelCopyWithImpl;
@useResult
$Res call({
 int id, int doctorId, String doctorName, String doctorSpeciality, String doctorImg, int patientId, String patientName,@JsonKey(name: 'payment') String paymentMethod, String status, String paymentUrl, DateTime? appointmentAt
});




}
/// @nodoc
class _$PaymentDataModelCopyWithImpl<$Res>
    implements $PaymentDataModelCopyWith<$Res> {
  _$PaymentDataModelCopyWithImpl(this._self, this._then);

  final PaymentDataModel _self;
  final $Res Function(PaymentDataModel) _then;

/// Create a copy of PaymentDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = null,Object? doctorSpeciality = null,Object? doctorImg = null,Object? patientId = null,Object? patientName = null,Object? paymentMethod = null,Object? status = null,Object? paymentUrl = null,Object? appointmentAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,doctorSpeciality: null == doctorSpeciality ? _self.doctorSpeciality : doctorSpeciality // ignore: cast_nullable_to_non_nullable
as String,doctorImg: null == doctorImg ? _self.doctorImg : doctorImg // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,appointmentAt: freezed == appointmentAt ? _self.appointmentAt : appointmentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDataModel].
extension PaymentDataModelPatterns on PaymentDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDataModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int doctorId,  String doctorName,  String doctorSpeciality,  String doctorImg,  int patientId,  String patientName, @JsonKey(name: 'payment')  String paymentMethod,  String status,  String paymentUrl,  DateTime? appointmentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDataModel() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.doctorSpeciality,_that.doctorImg,_that.patientId,_that.patientName,_that.paymentMethod,_that.status,_that.paymentUrl,_that.appointmentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int doctorId,  String doctorName,  String doctorSpeciality,  String doctorImg,  int patientId,  String patientName, @JsonKey(name: 'payment')  String paymentMethod,  String status,  String paymentUrl,  DateTime? appointmentAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentDataModel():
return $default(_that.id,_that.doctorId,_that.doctorName,_that.doctorSpeciality,_that.doctorImg,_that.patientId,_that.patientName,_that.paymentMethod,_that.status,_that.paymentUrl,_that.appointmentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int doctorId,  String doctorName,  String doctorSpeciality,  String doctorImg,  int patientId,  String patientName, @JsonKey(name: 'payment')  String paymentMethod,  String status,  String paymentUrl,  DateTime? appointmentAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDataModel() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.doctorSpeciality,_that.doctorImg,_that.patientId,_that.patientName,_that.paymentMethod,_that.status,_that.paymentUrl,_that.appointmentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDataModel implements PaymentDataModel {
  const _PaymentDataModel({this.id = 0, this.doctorId = 0, this.doctorName = '', this.doctorSpeciality = '', this.doctorImg = '', this.patientId = 0, this.patientName = '', @JsonKey(name: 'payment') this.paymentMethod = '', this.status = '', this.paymentUrl = '', this.appointmentAt});
  factory _PaymentDataModel.fromJson(Map<String, dynamic> json) => _$PaymentDataModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int doctorId;
@override@JsonKey() final  String doctorName;
@override@JsonKey() final  String doctorSpeciality;
@override@JsonKey() final  String doctorImg;
@override@JsonKey() final  int patientId;
@override@JsonKey() final  String patientName;
@override@JsonKey(name: 'payment') final  String paymentMethod;
@override@JsonKey() final  String status;
@override@JsonKey() final  String paymentUrl;
@override final  DateTime? appointmentAt;

/// Create a copy of PaymentDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDataModelCopyWith<_PaymentDataModel> get copyWith => __$PaymentDataModelCopyWithImpl<_PaymentDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorSpeciality, doctorSpeciality) || other.doctorSpeciality == doctorSpeciality)&&(identical(other.doctorImg, doctorImg) || other.doctorImg == doctorImg)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.appointmentAt, appointmentAt) || other.appointmentAt == appointmentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,doctorName,doctorSpeciality,doctorImg,patientId,patientName,paymentMethod,status,paymentUrl,appointmentAt);

@override
String toString() {
  return 'PaymentDataModel(id: $id, doctorId: $doctorId, doctorName: $doctorName, doctorSpeciality: $doctorSpeciality, doctorImg: $doctorImg, patientId: $patientId, patientName: $patientName, paymentMethod: $paymentMethod, status: $status, paymentUrl: $paymentUrl, appointmentAt: $appointmentAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentDataModelCopyWith<$Res> implements $PaymentDataModelCopyWith<$Res> {
  factory _$PaymentDataModelCopyWith(_PaymentDataModel value, $Res Function(_PaymentDataModel) _then) = __$PaymentDataModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int doctorId, String doctorName, String doctorSpeciality, String doctorImg, int patientId, String patientName,@JsonKey(name: 'payment') String paymentMethod, String status, String paymentUrl, DateTime? appointmentAt
});




}
/// @nodoc
class __$PaymentDataModelCopyWithImpl<$Res>
    implements _$PaymentDataModelCopyWith<$Res> {
  __$PaymentDataModelCopyWithImpl(this._self, this._then);

  final _PaymentDataModel _self;
  final $Res Function(_PaymentDataModel) _then;

/// Create a copy of PaymentDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = null,Object? doctorSpeciality = null,Object? doctorImg = null,Object? patientId = null,Object? patientName = null,Object? paymentMethod = null,Object? status = null,Object? paymentUrl = null,Object? appointmentAt = freezed,}) {
  return _then(_PaymentDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,doctorSpeciality: null == doctorSpeciality ? _self.doctorSpeciality : doctorSpeciality // ignore: cast_nullable_to_non_nullable
as String,doctorImg: null == doctorImg ? _self.doctorImg : doctorImg // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,appointmentAt: freezed == appointmentAt ? _self.appointmentAt : appointmentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
