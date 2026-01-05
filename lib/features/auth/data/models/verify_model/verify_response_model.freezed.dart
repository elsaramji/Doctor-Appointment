// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyResponseModel {

 bool get success; String get message; VerifyDataModel get data;
/// Create a copy of VerifyResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyResponseModelCopyWith<VerifyResponseModel> get copyWith => _$VerifyResponseModelCopyWithImpl<VerifyResponseModel>(this as VerifyResponseModel, _$identity);

  /// Serializes this VerifyResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'VerifyResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $VerifyResponseModelCopyWith<$Res>  {
  factory $VerifyResponseModelCopyWith(VerifyResponseModel value, $Res Function(VerifyResponseModel) _then) = _$VerifyResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, VerifyDataModel data
});


$VerifyDataModelCopyWith<$Res> get data;

}
/// @nodoc
class _$VerifyResponseModelCopyWithImpl<$Res>
    implements $VerifyResponseModelCopyWith<$Res> {
  _$VerifyResponseModelCopyWithImpl(this._self, this._then);

  final VerifyResponseModel _self;
  final $Res Function(VerifyResponseModel) _then;

/// Create a copy of VerifyResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VerifyDataModel,
  ));
}
/// Create a copy of VerifyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyDataModelCopyWith<$Res> get data {
  
  return $VerifyDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyResponseModel].
extension VerifyResponseModelPatterns on VerifyResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  VerifyDataModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  VerifyDataModel data)  $default,) {final _that = this;
switch (_that) {
case _VerifyResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  VerifyDataModel data)?  $default,) {final _that = this;
switch (_that) {
case _VerifyResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyResponseModel implements VerifyResponseModel {
  const _VerifyResponseModel({required this.success, required this.message, required this.data});
  factory _VerifyResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  VerifyDataModel data;

/// Create a copy of VerifyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyResponseModelCopyWith<_VerifyResponseModel> get copyWith => __$VerifyResponseModelCopyWithImpl<_VerifyResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'VerifyResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VerifyResponseModelCopyWith<$Res> implements $VerifyResponseModelCopyWith<$Res> {
  factory _$VerifyResponseModelCopyWith(_VerifyResponseModel value, $Res Function(_VerifyResponseModel) _then) = __$VerifyResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, VerifyDataModel data
});


@override $VerifyDataModelCopyWith<$Res> get data;

}
/// @nodoc
class __$VerifyResponseModelCopyWithImpl<$Res>
    implements _$VerifyResponseModelCopyWith<$Res> {
  __$VerifyResponseModelCopyWithImpl(this._self, this._then);

  final _VerifyResponseModel _self;
  final $Res Function(_VerifyResponseModel) _then;

/// Create a copy of VerifyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_VerifyResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VerifyDataModel,
  ));
}

/// Create a copy of VerifyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyDataModelCopyWith<$Res> get data {
  
  return $VerifyDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VerifyDataModel {

 String get accessToken; String get refreshToken;
/// Create a copy of VerifyDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyDataModelCopyWith<VerifyDataModel> get copyWith => _$VerifyDataModelCopyWithImpl<VerifyDataModel>(this as VerifyDataModel, _$identity);

  /// Serializes this VerifyDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyDataModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'VerifyDataModel(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $VerifyDataModelCopyWith<$Res>  {
  factory $VerifyDataModelCopyWith(VerifyDataModel value, $Res Function(VerifyDataModel) _then) = _$VerifyDataModelCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class _$VerifyDataModelCopyWithImpl<$Res>
    implements $VerifyDataModelCopyWith<$Res> {
  _$VerifyDataModelCopyWithImpl(this._self, this._then);

  final VerifyDataModel _self;
  final $Res Function(VerifyDataModel) _then;

/// Create a copy of VerifyDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyDataModel].
extension VerifyDataModelPatterns on VerifyDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyDataModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyDataModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _VerifyDataModel():
return $default(_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _VerifyDataModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyDataModel implements VerifyDataModel {
  const _VerifyDataModel({required this.accessToken, required this.refreshToken});
  factory _VerifyDataModel.fromJson(Map<String, dynamic> json) => _$VerifyDataModelFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;

/// Create a copy of VerifyDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyDataModelCopyWith<_VerifyDataModel> get copyWith => __$VerifyDataModelCopyWithImpl<_VerifyDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyDataModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'VerifyDataModel(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$VerifyDataModelCopyWith<$Res> implements $VerifyDataModelCopyWith<$Res> {
  factory _$VerifyDataModelCopyWith(_VerifyDataModel value, $Res Function(_VerifyDataModel) _then) = __$VerifyDataModelCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class __$VerifyDataModelCopyWithImpl<$Res>
    implements _$VerifyDataModelCopyWith<$Res> {
  __$VerifyDataModelCopyWithImpl(this._self, this._then);

  final _VerifyDataModel _self;
  final $Res Function(_VerifyDataModel) _then;

/// Create a copy of VerifyDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_VerifyDataModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
