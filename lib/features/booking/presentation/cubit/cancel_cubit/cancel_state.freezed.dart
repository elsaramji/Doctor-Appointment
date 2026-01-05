// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CancelState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelState()';
}


}

/// @nodoc
class $CancelStateCopyWith<$Res>  {
$CancelStateCopyWith(CancelState _, $Res Function(CancelState) __);
}


/// Adds pattern-matching-related methods to [CancelState].
extension CancelStatePatterns on CancelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _CancelLoading value)?  cancelLoading,TResult Function( _CancelSuccess value)?  cancelSuccess,TResult Function( _CancelError value)?  cancelError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _CancelLoading() when cancelLoading != null:
return cancelLoading(_that);case _CancelSuccess() when cancelSuccess != null:
return cancelSuccess(_that);case _CancelError() when cancelError != null:
return cancelError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _CancelLoading value)  cancelLoading,required TResult Function( _CancelSuccess value)  cancelSuccess,required TResult Function( _CancelError value)  cancelError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _CancelLoading():
return cancelLoading(_that);case _CancelSuccess():
return cancelSuccess(_that);case _CancelError():
return cancelError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _CancelLoading value)?  cancelLoading,TResult? Function( _CancelSuccess value)?  cancelSuccess,TResult? Function( _CancelError value)?  cancelError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _CancelLoading() when cancelLoading != null:
return cancelLoading(_that);case _CancelSuccess() when cancelSuccess != null:
return cancelSuccess(_that);case _CancelError() when cancelError != null:
return cancelError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  cancelLoading,TResult Function( RescheduleResponseEntity data)?  cancelSuccess,TResult Function( String message)?  cancelError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _CancelLoading() when cancelLoading != null:
return cancelLoading();case _CancelSuccess() when cancelSuccess != null:
return cancelSuccess(_that.data);case _CancelError() when cancelError != null:
return cancelError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  cancelLoading,required TResult Function( RescheduleResponseEntity data)  cancelSuccess,required TResult Function( String message)  cancelError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _CancelLoading():
return cancelLoading();case _CancelSuccess():
return cancelSuccess(_that.data);case _CancelError():
return cancelError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  cancelLoading,TResult? Function( RescheduleResponseEntity data)?  cancelSuccess,TResult? Function( String message)?  cancelError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _CancelLoading() when cancelLoading != null:
return cancelLoading();case _CancelSuccess() when cancelSuccess != null:
return cancelSuccess(_that.data);case _CancelError() when cancelError != null:
return cancelError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CancelState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelState.initial()';
}


}




/// @nodoc


class _CancelLoading implements CancelState {
  const _CancelLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelState.cancelLoading()';
}


}




/// @nodoc


class _CancelSuccess implements CancelState {
  const _CancelSuccess(this.data);
  

 final  RescheduleResponseEntity data;

/// Create a copy of CancelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelSuccessCopyWith<_CancelSuccess> get copyWith => __$CancelSuccessCopyWithImpl<_CancelSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CancelState.cancelSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CancelSuccessCopyWith<$Res> implements $CancelStateCopyWith<$Res> {
  factory _$CancelSuccessCopyWith(_CancelSuccess value, $Res Function(_CancelSuccess) _then) = __$CancelSuccessCopyWithImpl;
@useResult
$Res call({
 RescheduleResponseEntity data
});




}
/// @nodoc
class __$CancelSuccessCopyWithImpl<$Res>
    implements _$CancelSuccessCopyWith<$Res> {
  __$CancelSuccessCopyWithImpl(this._self, this._then);

  final _CancelSuccess _self;
  final $Res Function(_CancelSuccess) _then;

/// Create a copy of CancelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CancelSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RescheduleResponseEntity,
  ));
}


}

/// @nodoc


class _CancelError implements CancelState {
  const _CancelError(this.message);
  

 final  String message;

/// Create a copy of CancelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelErrorCopyWith<_CancelError> get copyWith => __$CancelErrorCopyWithImpl<_CancelError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CancelState.cancelError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$CancelErrorCopyWith<$Res> implements $CancelStateCopyWith<$Res> {
  factory _$CancelErrorCopyWith(_CancelError value, $Res Function(_CancelError) _then) = __$CancelErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$CancelErrorCopyWithImpl<$Res>
    implements _$CancelErrorCopyWith<$Res> {
  __$CancelErrorCopyWithImpl(this._self, this._then);

  final _CancelError _self;
  final $Res Function(_CancelError) _then;

/// Create a copy of CancelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_CancelError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
