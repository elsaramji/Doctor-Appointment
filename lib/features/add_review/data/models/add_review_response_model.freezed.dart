// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_review_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddReviewResponseModel {

 bool get success; String get message;
/// Create a copy of AddReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddReviewResponseModelCopyWith<AddReviewResponseModel> get copyWith => _$AddReviewResponseModelCopyWithImpl<AddReviewResponseModel>(this as AddReviewResponseModel, _$identity);

  /// Serializes this AddReviewResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddReviewResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'AddReviewResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $AddReviewResponseModelCopyWith<$Res>  {
  factory $AddReviewResponseModelCopyWith(AddReviewResponseModel value, $Res Function(AddReviewResponseModel) _then) = _$AddReviewResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$AddReviewResponseModelCopyWithImpl<$Res>
    implements $AddReviewResponseModelCopyWith<$Res> {
  _$AddReviewResponseModelCopyWithImpl(this._self, this._then);

  final AddReviewResponseModel _self;
  final $Res Function(AddReviewResponseModel) _then;

/// Create a copy of AddReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddReviewResponseModel].
extension AddReviewResponseModelPatterns on AddReviewResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddReviewResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddReviewResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddReviewResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AddReviewResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddReviewResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddReviewResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddReviewResponseModel() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _AddReviewResponseModel():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _AddReviewResponseModel() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddReviewResponseModel implements AddReviewResponseModel {
  const _AddReviewResponseModel({required this.success, required this.message});
  factory _AddReviewResponseModel.fromJson(Map<String, dynamic> json) => _$AddReviewResponseModelFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of AddReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddReviewResponseModelCopyWith<_AddReviewResponseModel> get copyWith => __$AddReviewResponseModelCopyWithImpl<_AddReviewResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddReviewResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddReviewResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'AddReviewResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AddReviewResponseModelCopyWith<$Res> implements $AddReviewResponseModelCopyWith<$Res> {
  factory _$AddReviewResponseModelCopyWith(_AddReviewResponseModel value, $Res Function(_AddReviewResponseModel) _then) = __$AddReviewResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$AddReviewResponseModelCopyWithImpl<$Res>
    implements _$AddReviewResponseModelCopyWith<$Res> {
  __$AddReviewResponseModelCopyWithImpl(this._self, this._then);

  final _AddReviewResponseModel _self;
  final $Res Function(_AddReviewResponseModel) _then;

/// Create a copy of AddReviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_AddReviewResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
