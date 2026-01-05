// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RescheduleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RescheduleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RescheduleState()';
}


}

/// @nodoc
class $RescheduleStateCopyWith<$Res>  {
$RescheduleStateCopyWith(RescheduleState _, $Res Function(RescheduleState) __);
}


/// Adds pattern-matching-related methods to [RescheduleState].
extension RescheduleStatePatterns on RescheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _RescheduleLoading value)?  rescheduleLoading,TResult Function( _RescheduleSuccess value)?  rescheduleSuccess,TResult Function( _RescheduleError value)?  rescheduleError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RescheduleLoading() when rescheduleLoading != null:
return rescheduleLoading(_that);case _RescheduleSuccess() when rescheduleSuccess != null:
return rescheduleSuccess(_that);case _RescheduleError() when rescheduleError != null:
return rescheduleError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _RescheduleLoading value)  rescheduleLoading,required TResult Function( _RescheduleSuccess value)  rescheduleSuccess,required TResult Function( _RescheduleError value)  rescheduleError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _RescheduleLoading():
return rescheduleLoading(_that);case _RescheduleSuccess():
return rescheduleSuccess(_that);case _RescheduleError():
return rescheduleError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _RescheduleLoading value)?  rescheduleLoading,TResult? Function( _RescheduleSuccess value)?  rescheduleSuccess,TResult? Function( _RescheduleError value)?  rescheduleError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RescheduleLoading() when rescheduleLoading != null:
return rescheduleLoading(_that);case _RescheduleSuccess() when rescheduleSuccess != null:
return rescheduleSuccess(_that);case _RescheduleError() when rescheduleError != null:
return rescheduleError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  rescheduleLoading,TResult Function( RescheduleResponseEntity response)?  rescheduleSuccess,TResult Function( String message)?  rescheduleError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RescheduleLoading() when rescheduleLoading != null:
return rescheduleLoading();case _RescheduleSuccess() when rescheduleSuccess != null:
return rescheduleSuccess(_that.response);case _RescheduleError() when rescheduleError != null:
return rescheduleError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  rescheduleLoading,required TResult Function( RescheduleResponseEntity response)  rescheduleSuccess,required TResult Function( String message)  rescheduleError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _RescheduleLoading():
return rescheduleLoading();case _RescheduleSuccess():
return rescheduleSuccess(_that.response);case _RescheduleError():
return rescheduleError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  rescheduleLoading,TResult? Function( RescheduleResponseEntity response)?  rescheduleSuccess,TResult? Function( String message)?  rescheduleError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RescheduleLoading() when rescheduleLoading != null:
return rescheduleLoading();case _RescheduleSuccess() when rescheduleSuccess != null:
return rescheduleSuccess(_that.response);case _RescheduleError() when rescheduleError != null:
return rescheduleError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RescheduleState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RescheduleState.initial()';
}


}




/// @nodoc


class _RescheduleLoading implements RescheduleState {
  const _RescheduleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RescheduleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RescheduleState.rescheduleLoading()';
}


}




/// @nodoc


class _RescheduleSuccess implements RescheduleState {
  const _RescheduleSuccess(this.response);
  

 final  RescheduleResponseEntity response;

/// Create a copy of RescheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RescheduleSuccessCopyWith<_RescheduleSuccess> get copyWith => __$RescheduleSuccessCopyWithImpl<_RescheduleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RescheduleSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'RescheduleState.rescheduleSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$RescheduleSuccessCopyWith<$Res> implements $RescheduleStateCopyWith<$Res> {
  factory _$RescheduleSuccessCopyWith(_RescheduleSuccess value, $Res Function(_RescheduleSuccess) _then) = __$RescheduleSuccessCopyWithImpl;
@useResult
$Res call({
 RescheduleResponseEntity response
});




}
/// @nodoc
class __$RescheduleSuccessCopyWithImpl<$Res>
    implements _$RescheduleSuccessCopyWith<$Res> {
  __$RescheduleSuccessCopyWithImpl(this._self, this._then);

  final _RescheduleSuccess _self;
  final $Res Function(_RescheduleSuccess) _then;

/// Create a copy of RescheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_RescheduleSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as RescheduleResponseEntity,
  ));
}


}

/// @nodoc


class _RescheduleError implements RescheduleState {
  const _RescheduleError(this.message);
  

 final  String message;

/// Create a copy of RescheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RescheduleErrorCopyWith<_RescheduleError> get copyWith => __$RescheduleErrorCopyWithImpl<_RescheduleError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RescheduleError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RescheduleState.rescheduleError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RescheduleErrorCopyWith<$Res> implements $RescheduleStateCopyWith<$Res> {
  factory _$RescheduleErrorCopyWith(_RescheduleError value, $Res Function(_RescheduleError) _then) = __$RescheduleErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RescheduleErrorCopyWithImpl<$Res>
    implements _$RescheduleErrorCopyWith<$Res> {
  __$RescheduleErrorCopyWithImpl(this._self, this._then);

  final _RescheduleError _self;
  final $Res Function(_RescheduleError) _then;

/// Create a copy of RescheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RescheduleError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
