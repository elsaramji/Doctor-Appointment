// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyRequestModel {

 String get phoneNumber; String get otpNumber;
/// Create a copy of VerifyRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyRequestModelCopyWith<VerifyRequestModel> get copyWith => _$VerifyRequestModelCopyWithImpl<VerifyRequestModel>(this as VerifyRequestModel, _$identity);

  /// Serializes this VerifyRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyRequestModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otpNumber, otpNumber) || other.otpNumber == otpNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otpNumber);

@override
String toString() {
  return 'VerifyRequestModel(phoneNumber: $phoneNumber, otpNumber: $otpNumber)';
}


}

/// @nodoc
abstract mixin class $VerifyRequestModelCopyWith<$Res>  {
  factory $VerifyRequestModelCopyWith(VerifyRequestModel value, $Res Function(VerifyRequestModel) _then) = _$VerifyRequestModelCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String otpNumber
});




}
/// @nodoc
class _$VerifyRequestModelCopyWithImpl<$Res>
    implements $VerifyRequestModelCopyWith<$Res> {
  _$VerifyRequestModelCopyWithImpl(this._self, this._then);

  final VerifyRequestModel _self;
  final $Res Function(VerifyRequestModel) _then;

/// Create a copy of VerifyRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? otpNumber = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otpNumber: null == otpNumber ? _self.otpNumber : otpNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyRequestModel].
extension VerifyRequestModelPatterns on VerifyRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String otpNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyRequestModel() when $default != null:
return $default(_that.phoneNumber,_that.otpNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String otpNumber)  $default,) {final _that = this;
switch (_that) {
case _VerifyRequestModel():
return $default(_that.phoneNumber,_that.otpNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String otpNumber)?  $default,) {final _that = this;
switch (_that) {
case _VerifyRequestModel() when $default != null:
return $default(_that.phoneNumber,_that.otpNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyRequestModel implements VerifyRequestModel {
  const _VerifyRequestModel({required this.phoneNumber, required this.otpNumber});
  factory _VerifyRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyRequestModelFromJson(json);

@override final  String phoneNumber;
@override final  String otpNumber;

/// Create a copy of VerifyRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyRequestModelCopyWith<_VerifyRequestModel> get copyWith => __$VerifyRequestModelCopyWithImpl<_VerifyRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyRequestModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otpNumber, otpNumber) || other.otpNumber == otpNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,otpNumber);

@override
String toString() {
  return 'VerifyRequestModel(phoneNumber: $phoneNumber, otpNumber: $otpNumber)';
}


}

/// @nodoc
abstract mixin class _$VerifyRequestModelCopyWith<$Res> implements $VerifyRequestModelCopyWith<$Res> {
  factory _$VerifyRequestModelCopyWith(_VerifyRequestModel value, $Res Function(_VerifyRequestModel) _then) = __$VerifyRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String otpNumber
});




}
/// @nodoc
class __$VerifyRequestModelCopyWithImpl<$Res>
    implements _$VerifyRequestModelCopyWith<$Res> {
  __$VerifyRequestModelCopyWithImpl(this._self, this._then);

  final _VerifyRequestModel _self;
  final $Res Function(_VerifyRequestModel) _then;

/// Create a copy of VerifyRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? otpNumber = null,}) {
  return _then(_VerifyRequestModel(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,otpNumber: null == otpNumber ? _self.otpNumber : otpNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
