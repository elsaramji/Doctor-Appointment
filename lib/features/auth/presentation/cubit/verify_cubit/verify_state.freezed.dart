// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyState()';
}


}

/// @nodoc
class $VerifyStateCopyWith<$Res>  {
$VerifyStateCopyWith(VerifyState _, $Res Function(VerifyState) __);
}


/// Adds pattern-matching-related methods to [VerifyState].
extension VerifyStatePatterns on VerifyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoginLoading value)?  loginLoading,TResult Function( _LoginFailure value)?  loginFailure,TResult Function( _LoginSuccess value)?  loginSuccess,TResult Function( _SignUpLoading value)?  signUpLoading,TResult Function( _SignUpFailure value)?  signUpFailure,TResult Function( _SignUpSuccess value)?  signUpSuccess,TResult Function( _TimerUpdated value)?  timerUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginFailure() when loginFailure != null:
return loginFailure(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _SignUpLoading() when signUpLoading != null:
return signUpLoading(_that);case _SignUpFailure() when signUpFailure != null:
return signUpFailure(_that);case _SignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that);case _TimerUpdated() when timerUpdated != null:
return timerUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoginLoading value)  loginLoading,required TResult Function( _LoginFailure value)  loginFailure,required TResult Function( _LoginSuccess value)  loginSuccess,required TResult Function( _SignUpLoading value)  signUpLoading,required TResult Function( _SignUpFailure value)  signUpFailure,required TResult Function( _SignUpSuccess value)  signUpSuccess,required TResult Function( _TimerUpdated value)  timerUpdated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoginLoading():
return loginLoading(_that);case _LoginFailure():
return loginFailure(_that);case _LoginSuccess():
return loginSuccess(_that);case _SignUpLoading():
return signUpLoading(_that);case _SignUpFailure():
return signUpFailure(_that);case _SignUpSuccess():
return signUpSuccess(_that);case _TimerUpdated():
return timerUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoginLoading value)?  loginLoading,TResult? Function( _LoginFailure value)?  loginFailure,TResult? Function( _LoginSuccess value)?  loginSuccess,TResult? Function( _SignUpLoading value)?  signUpLoading,TResult? Function( _SignUpFailure value)?  signUpFailure,TResult? Function( _SignUpSuccess value)?  signUpSuccess,TResult? Function( _TimerUpdated value)?  timerUpdated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginFailure() when loginFailure != null:
return loginFailure(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _SignUpLoading() when signUpLoading != null:
return signUpLoading(_that);case _SignUpFailure() when signUpFailure != null:
return signUpFailure(_that);case _SignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that);case _TimerUpdated() when timerUpdated != null:
return timerUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loginLoading,TResult Function( String message)?  loginFailure,TResult Function( VerifyResponseEntity? response)?  loginSuccess,TResult Function()?  signUpLoading,TResult Function( String message)?  signUpFailure,TResult Function( VerifyResponseEntity? response)?  signUpSuccess,TResult Function( int secondsRemaining,  bool canResend)?  timerUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginFailure() when loginFailure != null:
return loginFailure(_that.message);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.response);case _SignUpLoading() when signUpLoading != null:
return signUpLoading();case _SignUpFailure() when signUpFailure != null:
return signUpFailure(_that.message);case _SignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that.response);case _TimerUpdated() when timerUpdated != null:
return timerUpdated(_that.secondsRemaining,_that.canResend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loginLoading,required TResult Function( String message)  loginFailure,required TResult Function( VerifyResponseEntity? response)  loginSuccess,required TResult Function()  signUpLoading,required TResult Function( String message)  signUpFailure,required TResult Function( VerifyResponseEntity? response)  signUpSuccess,required TResult Function( int secondsRemaining,  bool canResend)  timerUpdated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoginLoading():
return loginLoading();case _LoginFailure():
return loginFailure(_that.message);case _LoginSuccess():
return loginSuccess(_that.response);case _SignUpLoading():
return signUpLoading();case _SignUpFailure():
return signUpFailure(_that.message);case _SignUpSuccess():
return signUpSuccess(_that.response);case _TimerUpdated():
return timerUpdated(_that.secondsRemaining,_that.canResend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loginLoading,TResult? Function( String message)?  loginFailure,TResult? Function( VerifyResponseEntity? response)?  loginSuccess,TResult? Function()?  signUpLoading,TResult? Function( String message)?  signUpFailure,TResult? Function( VerifyResponseEntity? response)?  signUpSuccess,TResult? Function( int secondsRemaining,  bool canResend)?  timerUpdated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginFailure() when loginFailure != null:
return loginFailure(_that.message);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.response);case _SignUpLoading() when signUpLoading != null:
return signUpLoading();case _SignUpFailure() when signUpFailure != null:
return signUpFailure(_that.message);case _SignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that.response);case _TimerUpdated() when timerUpdated != null:
return timerUpdated(_that.secondsRemaining,_that.canResend);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements VerifyState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyState.initial()';
}


}




/// @nodoc


class _LoginLoading implements VerifyState {
  const _LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyState.loginLoading()';
}


}




/// @nodoc


class _LoginFailure implements VerifyState {
  const _LoginFailure(this.message);
  

 final  String message;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFailureCopyWith<_LoginFailure> get copyWith => __$LoginFailureCopyWithImpl<_LoginFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerifyState.loginFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoginFailureCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$LoginFailureCopyWith(_LoginFailure value, $Res Function(_LoginFailure) _then) = __$LoginFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LoginFailureCopyWithImpl<$Res>
    implements _$LoginFailureCopyWith<$Res> {
  __$LoginFailureCopyWithImpl(this._self, this._then);

  final _LoginFailure _self;
  final $Res Function(_LoginFailure) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LoginFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginSuccess implements VerifyState {
  const _LoginSuccess({this.response});
  

 final  VerifyResponseEntity? response;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginSuccessCopyWith<_LoginSuccess> get copyWith => __$LoginSuccessCopyWithImpl<_LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'VerifyState.loginSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$LoginSuccessCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$LoginSuccessCopyWith(_LoginSuccess value, $Res Function(_LoginSuccess) _then) = __$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 VerifyResponseEntity? response
});




}
/// @nodoc
class __$LoginSuccessCopyWithImpl<$Res>
    implements _$LoginSuccessCopyWith<$Res> {
  __$LoginSuccessCopyWithImpl(this._self, this._then);

  final _LoginSuccess _self;
  final $Res Function(_LoginSuccess) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(_LoginSuccess(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as VerifyResponseEntity?,
  ));
}


}

/// @nodoc


class _SignUpLoading implements VerifyState {
  const _SignUpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyState.signUpLoading()';
}


}




/// @nodoc


class _SignUpFailure implements VerifyState {
  const _SignUpFailure(this.message);
  

 final  String message;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpFailureCopyWith<_SignUpFailure> get copyWith => __$SignUpFailureCopyWithImpl<_SignUpFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerifyState.signUpFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SignUpFailureCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$SignUpFailureCopyWith(_SignUpFailure value, $Res Function(_SignUpFailure) _then) = __$SignUpFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SignUpFailureCopyWithImpl<$Res>
    implements _$SignUpFailureCopyWith<$Res> {
  __$SignUpFailureCopyWithImpl(this._self, this._then);

  final _SignUpFailure _self;
  final $Res Function(_SignUpFailure) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SignUpFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SignUpSuccess implements VerifyState {
  const _SignUpSuccess({this.response});
  

 final  VerifyResponseEntity? response;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpSuccessCopyWith<_SignUpSuccess> get copyWith => __$SignUpSuccessCopyWithImpl<_SignUpSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'VerifyState.signUpSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$SignUpSuccessCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$SignUpSuccessCopyWith(_SignUpSuccess value, $Res Function(_SignUpSuccess) _then) = __$SignUpSuccessCopyWithImpl;
@useResult
$Res call({
 VerifyResponseEntity? response
});




}
/// @nodoc
class __$SignUpSuccessCopyWithImpl<$Res>
    implements _$SignUpSuccessCopyWith<$Res> {
  __$SignUpSuccessCopyWithImpl(this._self, this._then);

  final _SignUpSuccess _self;
  final $Res Function(_SignUpSuccess) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(_SignUpSuccess(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as VerifyResponseEntity?,
  ));
}


}

/// @nodoc


class _TimerUpdated implements VerifyState {
  const _TimerUpdated(this.secondsRemaining, {required this.canResend});
  

 final  int secondsRemaining;
 final  bool canResend;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerUpdatedCopyWith<_TimerUpdated> get copyWith => __$TimerUpdatedCopyWithImpl<_TimerUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerUpdated&&(identical(other.secondsRemaining, secondsRemaining) || other.secondsRemaining == secondsRemaining)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,secondsRemaining,canResend);

@override
String toString() {
  return 'VerifyState.timerUpdated(secondsRemaining: $secondsRemaining, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class _$TimerUpdatedCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$TimerUpdatedCopyWith(_TimerUpdated value, $Res Function(_TimerUpdated) _then) = __$TimerUpdatedCopyWithImpl;
@useResult
$Res call({
 int secondsRemaining, bool canResend
});




}
/// @nodoc
class __$TimerUpdatedCopyWithImpl<$Res>
    implements _$TimerUpdatedCopyWith<$Res> {
  __$TimerUpdatedCopyWithImpl(this._self, this._then);

  final _TimerUpdated _self;
  final $Res Function(_TimerUpdated) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? secondsRemaining = null,Object? canResend = null,}) {
  return _then(_TimerUpdated(
null == secondsRemaining ? _self.secondsRemaining : secondsRemaining // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
