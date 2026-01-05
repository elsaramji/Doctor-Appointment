// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingSearchModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'doctorId') int get doctorId;@JsonKey(name: 'doctorName') String get doctorName;@JsonKey(name: 'doctorSpeciality') String get doctorSpeciality;@JsonKey(name: 'doctorImg') String? get doctorImageUrl;@JsonKey(name: 'appointmentAt') String get appointmentAt;@JsonKey(name: 'status') String get status;@JsonKey(name: 'address') String? get address;@JsonKey(name: 'amount') double? get amount;
/// Create a copy of BookingSearchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSearchModelCopyWith<BookingSearchModel> get copyWith => _$BookingSearchModelCopyWithImpl<BookingSearchModel>(this as BookingSearchModel, _$identity);

  /// Serializes this BookingSearchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSearchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorSpeciality, doctorSpeciality) || other.doctorSpeciality == doctorSpeciality)&&(identical(other.doctorImageUrl, doctorImageUrl) || other.doctorImageUrl == doctorImageUrl)&&(identical(other.appointmentAt, appointmentAt) || other.appointmentAt == appointmentAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,doctorName,doctorSpeciality,doctorImageUrl,appointmentAt,status,address,amount);

@override
String toString() {
  return 'BookingSearchModel(id: $id, doctorId: $doctorId, doctorName: $doctorName, doctorSpeciality: $doctorSpeciality, doctorImageUrl: $doctorImageUrl, appointmentAt: $appointmentAt, status: $status, address: $address, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $BookingSearchModelCopyWith<$Res>  {
  factory $BookingSearchModelCopyWith(BookingSearchModel value, $Res Function(BookingSearchModel) _then) = _$BookingSearchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'doctorId') int doctorId,@JsonKey(name: 'doctorName') String doctorName,@JsonKey(name: 'doctorSpeciality') String doctorSpeciality,@JsonKey(name: 'doctorImg') String? doctorImageUrl,@JsonKey(name: 'appointmentAt') String appointmentAt,@JsonKey(name: 'status') String status,@JsonKey(name: 'address') String? address,@JsonKey(name: 'amount') double? amount
});




}
/// @nodoc
class _$BookingSearchModelCopyWithImpl<$Res>
    implements $BookingSearchModelCopyWith<$Res> {
  _$BookingSearchModelCopyWithImpl(this._self, this._then);

  final BookingSearchModel _self;
  final $Res Function(BookingSearchModel) _then;

/// Create a copy of BookingSearchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = null,Object? doctorSpeciality = null,Object? doctorImageUrl = freezed,Object? appointmentAt = null,Object? status = null,Object? address = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,doctorSpeciality: null == doctorSpeciality ? _self.doctorSpeciality : doctorSpeciality // ignore: cast_nullable_to_non_nullable
as String,doctorImageUrl: freezed == doctorImageUrl ? _self.doctorImageUrl : doctorImageUrl // ignore: cast_nullable_to_non_nullable
as String?,appointmentAt: null == appointmentAt ? _self.appointmentAt : appointmentAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingSearchModel].
extension BookingSearchModelPatterns on BookingSearchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingSearchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingSearchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingSearchModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingSearchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingSearchModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingSearchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'doctorId')  int doctorId, @JsonKey(name: 'doctorName')  String doctorName, @JsonKey(name: 'doctorSpeciality')  String doctorSpeciality, @JsonKey(name: 'doctorImg')  String? doctorImageUrl, @JsonKey(name: 'appointmentAt')  String appointmentAt, @JsonKey(name: 'status')  String status, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'amount')  double? amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingSearchModel() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.doctorSpeciality,_that.doctorImageUrl,_that.appointmentAt,_that.status,_that.address,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'doctorId')  int doctorId, @JsonKey(name: 'doctorName')  String doctorName, @JsonKey(name: 'doctorSpeciality')  String doctorSpeciality, @JsonKey(name: 'doctorImg')  String? doctorImageUrl, @JsonKey(name: 'appointmentAt')  String appointmentAt, @JsonKey(name: 'status')  String status, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'amount')  double? amount)  $default,) {final _that = this;
switch (_that) {
case _BookingSearchModel():
return $default(_that.id,_that.doctorId,_that.doctorName,_that.doctorSpeciality,_that.doctorImageUrl,_that.appointmentAt,_that.status,_that.address,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'doctorId')  int doctorId, @JsonKey(name: 'doctorName')  String doctorName, @JsonKey(name: 'doctorSpeciality')  String doctorSpeciality, @JsonKey(name: 'doctorImg')  String? doctorImageUrl, @JsonKey(name: 'appointmentAt')  String appointmentAt, @JsonKey(name: 'status')  String status, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'amount')  double? amount)?  $default,) {final _that = this;
switch (_that) {
case _BookingSearchModel() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.doctorSpeciality,_that.doctorImageUrl,_that.appointmentAt,_that.status,_that.address,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingSearchModel implements BookingSearchModel {
  const _BookingSearchModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'doctorId') required this.doctorId, @JsonKey(name: 'doctorName') required this.doctorName, @JsonKey(name: 'doctorSpeciality') required this.doctorSpeciality, @JsonKey(name: 'doctorImg') this.doctorImageUrl, @JsonKey(name: 'appointmentAt') required this.appointmentAt, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'address') this.address, @JsonKey(name: 'amount') this.amount});
  factory _BookingSearchModel.fromJson(Map<String, dynamic> json) => _$BookingSearchModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'doctorId') final  int doctorId;
@override@JsonKey(name: 'doctorName') final  String doctorName;
@override@JsonKey(name: 'doctorSpeciality') final  String doctorSpeciality;
@override@JsonKey(name: 'doctorImg') final  String? doctorImageUrl;
@override@JsonKey(name: 'appointmentAt') final  String appointmentAt;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'address') final  String? address;
@override@JsonKey(name: 'amount') final  double? amount;

/// Create a copy of BookingSearchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingSearchModelCopyWith<_BookingSearchModel> get copyWith => __$BookingSearchModelCopyWithImpl<_BookingSearchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingSearchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingSearchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.doctorSpeciality, doctorSpeciality) || other.doctorSpeciality == doctorSpeciality)&&(identical(other.doctorImageUrl, doctorImageUrl) || other.doctorImageUrl == doctorImageUrl)&&(identical(other.appointmentAt, appointmentAt) || other.appointmentAt == appointmentAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.address, address) || other.address == address)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,doctorName,doctorSpeciality,doctorImageUrl,appointmentAt,status,address,amount);

@override
String toString() {
  return 'BookingSearchModel(id: $id, doctorId: $doctorId, doctorName: $doctorName, doctorSpeciality: $doctorSpeciality, doctorImageUrl: $doctorImageUrl, appointmentAt: $appointmentAt, status: $status, address: $address, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$BookingSearchModelCopyWith<$Res> implements $BookingSearchModelCopyWith<$Res> {
  factory _$BookingSearchModelCopyWith(_BookingSearchModel value, $Res Function(_BookingSearchModel) _then) = __$BookingSearchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'doctorId') int doctorId,@JsonKey(name: 'doctorName') String doctorName,@JsonKey(name: 'doctorSpeciality') String doctorSpeciality,@JsonKey(name: 'doctorImg') String? doctorImageUrl,@JsonKey(name: 'appointmentAt') String appointmentAt,@JsonKey(name: 'status') String status,@JsonKey(name: 'address') String? address,@JsonKey(name: 'amount') double? amount
});




}
/// @nodoc
class __$BookingSearchModelCopyWithImpl<$Res>
    implements _$BookingSearchModelCopyWith<$Res> {
  __$BookingSearchModelCopyWithImpl(this._self, this._then);

  final _BookingSearchModel _self;
  final $Res Function(_BookingSearchModel) _then;

/// Create a copy of BookingSearchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = null,Object? doctorSpeciality = null,Object? doctorImageUrl = freezed,Object? appointmentAt = null,Object? status = null,Object? address = freezed,Object? amount = freezed,}) {
  return _then(_BookingSearchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,doctorSpeciality: null == doctorSpeciality ? _self.doctorSpeciality : doctorSpeciality // ignore: cast_nullable_to_non_nullable
as String,doctorImageUrl: freezed == doctorImageUrl ? _self.doctorImageUrl : doctorImageUrl // ignore: cast_nullable_to_non_nullable
as String?,appointmentAt: null == appointmentAt ? _self.appointmentAt : appointmentAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
