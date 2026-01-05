// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_review_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddReviewRequestModel {

@JsonKey(name: 'doctorId') int get doctorId;@JsonKey(name: 'rating') int get rating;@JsonKey(name: 'comment') String get comment;
/// Create a copy of AddReviewRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddReviewRequestModelCopyWith<AddReviewRequestModel> get copyWith => _$AddReviewRequestModelCopyWithImpl<AddReviewRequestModel>(this as AddReviewRequestModel, _$identity);

  /// Serializes this AddReviewRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddReviewRequestModel&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,rating,comment);

@override
String toString() {
  return 'AddReviewRequestModel(doctorId: $doctorId, rating: $rating, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $AddReviewRequestModelCopyWith<$Res>  {
  factory $AddReviewRequestModelCopyWith(AddReviewRequestModel value, $Res Function(AddReviewRequestModel) _then) = _$AddReviewRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctorId') int doctorId,@JsonKey(name: 'rating') int rating,@JsonKey(name: 'comment') String comment
});




}
/// @nodoc
class _$AddReviewRequestModelCopyWithImpl<$Res>
    implements $AddReviewRequestModelCopyWith<$Res> {
  _$AddReviewRequestModelCopyWithImpl(this._self, this._then);

  final AddReviewRequestModel _self;
  final $Res Function(AddReviewRequestModel) _then;

/// Create a copy of AddReviewRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? rating = null,Object? comment = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddReviewRequestModel].
extension AddReviewRequestModelPatterns on AddReviewRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddReviewRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddReviewRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddReviewRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AddReviewRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddReviewRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddReviewRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctorId')  int doctorId, @JsonKey(name: 'rating')  int rating, @JsonKey(name: 'comment')  String comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddReviewRequestModel() when $default != null:
return $default(_that.doctorId,_that.rating,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctorId')  int doctorId, @JsonKey(name: 'rating')  int rating, @JsonKey(name: 'comment')  String comment)  $default,) {final _that = this;
switch (_that) {
case _AddReviewRequestModel():
return $default(_that.doctorId,_that.rating,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctorId')  int doctorId, @JsonKey(name: 'rating')  int rating, @JsonKey(name: 'comment')  String comment)?  $default,) {final _that = this;
switch (_that) {
case _AddReviewRequestModel() when $default != null:
return $default(_that.doctorId,_that.rating,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddReviewRequestModel implements AddReviewRequestModel {
  const _AddReviewRequestModel({@JsonKey(name: 'doctorId') required this.doctorId, @JsonKey(name: 'rating') required this.rating, @JsonKey(name: 'comment') required this.comment});
  factory _AddReviewRequestModel.fromJson(Map<String, dynamic> json) => _$AddReviewRequestModelFromJson(json);

@override@JsonKey(name: 'doctorId') final  int doctorId;
@override@JsonKey(name: 'rating') final  int rating;
@override@JsonKey(name: 'comment') final  String comment;

/// Create a copy of AddReviewRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddReviewRequestModelCopyWith<_AddReviewRequestModel> get copyWith => __$AddReviewRequestModelCopyWithImpl<_AddReviewRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddReviewRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddReviewRequestModel&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,rating,comment);

@override
String toString() {
  return 'AddReviewRequestModel(doctorId: $doctorId, rating: $rating, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$AddReviewRequestModelCopyWith<$Res> implements $AddReviewRequestModelCopyWith<$Res> {
  factory _$AddReviewRequestModelCopyWith(_AddReviewRequestModel value, $Res Function(_AddReviewRequestModel) _then) = __$AddReviewRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctorId') int doctorId,@JsonKey(name: 'rating') int rating,@JsonKey(name: 'comment') String comment
});




}
/// @nodoc
class __$AddReviewRequestModelCopyWithImpl<$Res>
    implements _$AddReviewRequestModelCopyWith<$Res> {
  __$AddReviewRequestModelCopyWithImpl(this._self, this._then);

  final _AddReviewRequestModel _self;
  final $Res Function(_AddReviewRequestModel) _then;

/// Create a copy of AddReviewRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? rating = null,Object? comment = null,}) {
  return _then(_AddReviewRequestModel(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
