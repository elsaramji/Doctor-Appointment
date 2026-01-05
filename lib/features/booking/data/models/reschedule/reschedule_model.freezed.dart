// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RescheduleRequest {

 String get newDateTime;
/// Create a copy of RescheduleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RescheduleRequestCopyWith<RescheduleRequest> get copyWith => _$RescheduleRequestCopyWithImpl<RescheduleRequest>(this as RescheduleRequest, _$identity);

  /// Serializes this RescheduleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RescheduleRequest&&(identical(other.newDateTime, newDateTime) || other.newDateTime == newDateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newDateTime);

@override
String toString() {
  return 'RescheduleRequest(newDateTime: $newDateTime)';
}


}

/// @nodoc
abstract mixin class $RescheduleRequestCopyWith<$Res>  {
  factory $RescheduleRequestCopyWith(RescheduleRequest value, $Res Function(RescheduleRequest) _then) = _$RescheduleRequestCopyWithImpl;
@useResult
$Res call({
 String newDateTime
});




}
/// @nodoc
class _$RescheduleRequestCopyWithImpl<$Res>
    implements $RescheduleRequestCopyWith<$Res> {
  _$RescheduleRequestCopyWithImpl(this._self, this._then);

  final RescheduleRequest _self;
  final $Res Function(RescheduleRequest) _then;

/// Create a copy of RescheduleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newDateTime = null,}) {
  return _then(_self.copyWith(
newDateTime: null == newDateTime ? _self.newDateTime : newDateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RescheduleRequest].
extension RescheduleRequestPatterns on RescheduleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RescheduleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RescheduleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RescheduleRequest value)  $default,){
final _that = this;
switch (_that) {
case _RescheduleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RescheduleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RescheduleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String newDateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RescheduleRequest() when $default != null:
return $default(_that.newDateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String newDateTime)  $default,) {final _that = this;
switch (_that) {
case _RescheduleRequest():
return $default(_that.newDateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String newDateTime)?  $default,) {final _that = this;
switch (_that) {
case _RescheduleRequest() when $default != null:
return $default(_that.newDateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RescheduleRequest implements RescheduleRequest {
  const _RescheduleRequest({required this.newDateTime});
  factory _RescheduleRequest.fromJson(Map<String, dynamic> json) => _$RescheduleRequestFromJson(json);

@override final  String newDateTime;

/// Create a copy of RescheduleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RescheduleRequestCopyWith<_RescheduleRequest> get copyWith => __$RescheduleRequestCopyWithImpl<_RescheduleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RescheduleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RescheduleRequest&&(identical(other.newDateTime, newDateTime) || other.newDateTime == newDateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newDateTime);

@override
String toString() {
  return 'RescheduleRequest(newDateTime: $newDateTime)';
}


}

/// @nodoc
abstract mixin class _$RescheduleRequestCopyWith<$Res> implements $RescheduleRequestCopyWith<$Res> {
  factory _$RescheduleRequestCopyWith(_RescheduleRequest value, $Res Function(_RescheduleRequest) _then) = __$RescheduleRequestCopyWithImpl;
@override @useResult
$Res call({
 String newDateTime
});




}
/// @nodoc
class __$RescheduleRequestCopyWithImpl<$Res>
    implements _$RescheduleRequestCopyWith<$Res> {
  __$RescheduleRequestCopyWithImpl(this._self, this._then);

  final _RescheduleRequest _self;
  final $Res Function(_RescheduleRequest) _then;

/// Create a copy of RescheduleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newDateTime = null,}) {
  return _then(_RescheduleRequest(
newDateTime: null == newDateTime ? _self.newDateTime : newDateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RescheduleResponse {

 String get message; bool get success;
/// Create a copy of RescheduleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RescheduleResponseCopyWith<RescheduleResponse> get copyWith => _$RescheduleResponseCopyWithImpl<RescheduleResponse>(this as RescheduleResponse, _$identity);

  /// Serializes this RescheduleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RescheduleResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'RescheduleResponse(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class $RescheduleResponseCopyWith<$Res>  {
  factory $RescheduleResponseCopyWith(RescheduleResponse value, $Res Function(RescheduleResponse) _then) = _$RescheduleResponseCopyWithImpl;
@useResult
$Res call({
 String message, bool success
});




}
/// @nodoc
class _$RescheduleResponseCopyWithImpl<$Res>
    implements $RescheduleResponseCopyWith<$Res> {
  _$RescheduleResponseCopyWithImpl(this._self, this._then);

  final RescheduleResponse _self;
  final $Res Function(RescheduleResponse) _then;

/// Create a copy of RescheduleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? success = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RescheduleResponse].
extension RescheduleResponsePatterns on RescheduleResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RescheduleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RescheduleResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RescheduleResponse value)  $default,){
final _that = this;
switch (_that) {
case _RescheduleResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RescheduleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RescheduleResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RescheduleResponse() when $default != null:
return $default(_that.message,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  bool success)  $default,) {final _that = this;
switch (_that) {
case _RescheduleResponse():
return $default(_that.message,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  bool success)?  $default,) {final _that = this;
switch (_that) {
case _RescheduleResponse() when $default != null:
return $default(_that.message,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RescheduleResponse implements RescheduleResponse {
  const _RescheduleResponse({required this.message, required this.success});
  factory _RescheduleResponse.fromJson(Map<String, dynamic> json) => _$RescheduleResponseFromJson(json);

@override final  String message;
@override final  bool success;

/// Create a copy of RescheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RescheduleResponseCopyWith<_RescheduleResponse> get copyWith => __$RescheduleResponseCopyWithImpl<_RescheduleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RescheduleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RescheduleResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'RescheduleResponse(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class _$RescheduleResponseCopyWith<$Res> implements $RescheduleResponseCopyWith<$Res> {
  factory _$RescheduleResponseCopyWith(_RescheduleResponse value, $Res Function(_RescheduleResponse) _then) = __$RescheduleResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, bool success
});




}
/// @nodoc
class __$RescheduleResponseCopyWithImpl<$Res>
    implements _$RescheduleResponseCopyWith<$Res> {
  __$RescheduleResponseCopyWithImpl(this._self, this._then);

  final _RescheduleResponse _self;
  final $Res Function(_RescheduleResponse) _then;

/// Create a copy of RescheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? success = null,}) {
  return _then(_RescheduleResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
