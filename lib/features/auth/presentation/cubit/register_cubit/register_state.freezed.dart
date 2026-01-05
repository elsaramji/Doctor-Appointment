// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 bool get isRememberMe;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,isRememberMe);

@override
String toString() {
  return 'RegisterState(isRememberMe: $isRememberMe)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 bool isRememberMe
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRememberMe = null,}) {
  return _then(_self.copyWith(
isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RegisterInitial value)?  initial,TResult Function( _RegisterLoading value)?  loading,TResult Function( _RegisterSuccess value)?  success,TResult Function( _RegisterFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterInitial() when initial != null:
return initial(_that);case _RegisterLoading() when loading != null:
return loading(_that);case _RegisterSuccess() when success != null:
return success(_that);case _RegisterFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RegisterInitial value)  initial,required TResult Function( _RegisterLoading value)  loading,required TResult Function( _RegisterSuccess value)  success,required TResult Function( _RegisterFailure value)  failure,}){
final _that = this;
switch (_that) {
case _RegisterInitial():
return initial(_that);case _RegisterLoading():
return loading(_that);case _RegisterSuccess():
return success(_that);case _RegisterFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RegisterInitial value)?  initial,TResult? Function( _RegisterLoading value)?  loading,TResult? Function( _RegisterSuccess value)?  success,TResult? Function( _RegisterFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _RegisterInitial() when initial != null:
return initial(_that);case _RegisterLoading() when loading != null:
return loading(_that);case _RegisterSuccess() when success != null:
return success(_that);case _RegisterFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isRememberMe)?  initial,TResult Function( bool isRememberMe)?  loading,TResult Function( AuthResponseEntity response,  bool isRememberMe)?  success,TResult Function( String message,  bool isRememberMe)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterInitial() when initial != null:
return initial(_that.isRememberMe);case _RegisterLoading() when loading != null:
return loading(_that.isRememberMe);case _RegisterSuccess() when success != null:
return success(_that.response,_that.isRememberMe);case _RegisterFailure() when failure != null:
return failure(_that.message,_that.isRememberMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isRememberMe)  initial,required TResult Function( bool isRememberMe)  loading,required TResult Function( AuthResponseEntity response,  bool isRememberMe)  success,required TResult Function( String message,  bool isRememberMe)  failure,}) {final _that = this;
switch (_that) {
case _RegisterInitial():
return initial(_that.isRememberMe);case _RegisterLoading():
return loading(_that.isRememberMe);case _RegisterSuccess():
return success(_that.response,_that.isRememberMe);case _RegisterFailure():
return failure(_that.message,_that.isRememberMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isRememberMe)?  initial,TResult? Function( bool isRememberMe)?  loading,TResult? Function( AuthResponseEntity response,  bool isRememberMe)?  success,TResult? Function( String message,  bool isRememberMe)?  failure,}) {final _that = this;
switch (_that) {
case _RegisterInitial() when initial != null:
return initial(_that.isRememberMe);case _RegisterLoading() when loading != null:
return loading(_that.isRememberMe);case _RegisterSuccess() when success != null:
return success(_that.response,_that.isRememberMe);case _RegisterFailure() when failure != null:
return failure(_that.message,_that.isRememberMe);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterInitial implements RegisterState {
  const _RegisterInitial({this.isRememberMe = false});
  

@override@JsonKey() final  bool isRememberMe;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterInitialCopyWith<_RegisterInitial> get copyWith => __$RegisterInitialCopyWithImpl<_RegisterInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterInitial&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,isRememberMe);

@override
String toString() {
  return 'RegisterState.initial(isRememberMe: $isRememberMe)';
}


}

/// @nodoc
abstract mixin class _$RegisterInitialCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterInitialCopyWith(_RegisterInitial value, $Res Function(_RegisterInitial) _then) = __$RegisterInitialCopyWithImpl;
@override @useResult
$Res call({
 bool isRememberMe
});




}
/// @nodoc
class __$RegisterInitialCopyWithImpl<$Res>
    implements _$RegisterInitialCopyWith<$Res> {
  __$RegisterInitialCopyWithImpl(this._self, this._then);

  final _RegisterInitial _self;
  final $Res Function(_RegisterInitial) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRememberMe = null,}) {
  return _then(_RegisterInitial(
isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _RegisterLoading implements RegisterState {
  const _RegisterLoading({this.isRememberMe = false});
  

@override@JsonKey() final  bool isRememberMe;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterLoadingCopyWith<_RegisterLoading> get copyWith => __$RegisterLoadingCopyWithImpl<_RegisterLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterLoading&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,isRememberMe);

@override
String toString() {
  return 'RegisterState.loading(isRememberMe: $isRememberMe)';
}


}

/// @nodoc
abstract mixin class _$RegisterLoadingCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterLoadingCopyWith(_RegisterLoading value, $Res Function(_RegisterLoading) _then) = __$RegisterLoadingCopyWithImpl;
@override @useResult
$Res call({
 bool isRememberMe
});




}
/// @nodoc
class __$RegisterLoadingCopyWithImpl<$Res>
    implements _$RegisterLoadingCopyWith<$Res> {
  __$RegisterLoadingCopyWithImpl(this._self, this._then);

  final _RegisterLoading _self;
  final $Res Function(_RegisterLoading) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRememberMe = null,}) {
  return _then(_RegisterLoading(
isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _RegisterSuccess implements RegisterState {
  const _RegisterSuccess({required this.response, this.isRememberMe = false});
  

 final  AuthResponseEntity response;
@override@JsonKey() final  bool isRememberMe;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterSuccessCopyWith<_RegisterSuccess> get copyWith => __$RegisterSuccessCopyWithImpl<_RegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterSuccess&&(identical(other.response, response) || other.response == response)&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,response,isRememberMe);

@override
String toString() {
  return 'RegisterState.success(response: $response, isRememberMe: $isRememberMe)';
}


}

/// @nodoc
abstract mixin class _$RegisterSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterSuccessCopyWith(_RegisterSuccess value, $Res Function(_RegisterSuccess) _then) = __$RegisterSuccessCopyWithImpl;
@override @useResult
$Res call({
 AuthResponseEntity response, bool isRememberMe
});




}
/// @nodoc
class __$RegisterSuccessCopyWithImpl<$Res>
    implements _$RegisterSuccessCopyWith<$Res> {
  __$RegisterSuccessCopyWithImpl(this._self, this._then);

  final _RegisterSuccess _self;
  final $Res Function(_RegisterSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,Object? isRememberMe = null,}) {
  return _then(_RegisterSuccess(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AuthResponseEntity,isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _RegisterFailure implements RegisterState {
  const _RegisterFailure({required this.message, this.isRememberMe = false});
  

 final  String message;
@override@JsonKey() final  bool isRememberMe;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFailureCopyWith<_RegisterFailure> get copyWith => __$RegisterFailureCopyWithImpl<_RegisterFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,message,isRememberMe);

@override
String toString() {
  return 'RegisterState.failure(message: $message, isRememberMe: $isRememberMe)';
}


}

/// @nodoc
abstract mixin class _$RegisterFailureCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterFailureCopyWith(_RegisterFailure value, $Res Function(_RegisterFailure) _then) = __$RegisterFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, bool isRememberMe
});




}
/// @nodoc
class __$RegisterFailureCopyWithImpl<$Res>
    implements _$RegisterFailureCopyWith<$Res> {
  __$RegisterFailureCopyWithImpl(this._self, this._then);

  final _RegisterFailure _self;
  final $Res Function(_RegisterFailure) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? isRememberMe = null,}) {
  return _then(_RegisterFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
