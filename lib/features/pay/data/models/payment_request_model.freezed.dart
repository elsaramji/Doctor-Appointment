// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentRequestModel {

@JsonKey(name: 'DoctorId') int get doctorId;@JsonKey(name: 'SlotId') int get slotId;@JsonKey(name: 'Amount') double get amount;@JsonKey(name: 'Payment') int get payment;@JsonKey(name: 'Status') int get status;@JsonKey(name: 'AppointmentAt') String get appointmentAt;
/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentRequestModelCopyWith<PaymentRequestModel> get copyWith => _$PaymentRequestModelCopyWithImpl<PaymentRequestModel>(this as PaymentRequestModel, _$identity);

  /// Serializes this PaymentRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentRequestModel&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.status, status) || other.status == status)&&(identical(other.appointmentAt, appointmentAt) || other.appointmentAt == appointmentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,slotId,amount,payment,status,appointmentAt);

@override
String toString() {
  return 'PaymentRequestModel(doctorId: $doctorId, slotId: $slotId, amount: $amount, payment: $payment, status: $status, appointmentAt: $appointmentAt)';
}


}

/// @nodoc
abstract mixin class $PaymentRequestModelCopyWith<$Res>  {
  factory $PaymentRequestModelCopyWith(PaymentRequestModel value, $Res Function(PaymentRequestModel) _then) = _$PaymentRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DoctorId') int doctorId,@JsonKey(name: 'SlotId') int slotId,@JsonKey(name: 'Amount') double amount,@JsonKey(name: 'Payment') int payment,@JsonKey(name: 'Status') int status,@JsonKey(name: 'AppointmentAt') String appointmentAt
});




}
/// @nodoc
class _$PaymentRequestModelCopyWithImpl<$Res>
    implements $PaymentRequestModelCopyWith<$Res> {
  _$PaymentRequestModelCopyWithImpl(this._self, this._then);

  final PaymentRequestModel _self;
  final $Res Function(PaymentRequestModel) _then;

/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? slotId = null,Object? amount = null,Object? payment = null,Object? status = null,Object? appointmentAt = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,appointmentAt: null == appointmentAt ? _self.appointmentAt : appointmentAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentRequestModel].
extension PaymentRequestModelPatterns on PaymentRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DoctorId')  int doctorId, @JsonKey(name: 'SlotId')  int slotId, @JsonKey(name: 'Amount')  double amount, @JsonKey(name: 'Payment')  int payment, @JsonKey(name: 'Status')  int status, @JsonKey(name: 'AppointmentAt')  String appointmentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
return $default(_that.doctorId,_that.slotId,_that.amount,_that.payment,_that.status,_that.appointmentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DoctorId')  int doctorId, @JsonKey(name: 'SlotId')  int slotId, @JsonKey(name: 'Amount')  double amount, @JsonKey(name: 'Payment')  int payment, @JsonKey(name: 'Status')  int status, @JsonKey(name: 'AppointmentAt')  String appointmentAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentRequestModel():
return $default(_that.doctorId,_that.slotId,_that.amount,_that.payment,_that.status,_that.appointmentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DoctorId')  int doctorId, @JsonKey(name: 'SlotId')  int slotId, @JsonKey(name: 'Amount')  double amount, @JsonKey(name: 'Payment')  int payment, @JsonKey(name: 'Status')  int status, @JsonKey(name: 'AppointmentAt')  String appointmentAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentRequestModel() when $default != null:
return $default(_that.doctorId,_that.slotId,_that.amount,_that.payment,_that.status,_that.appointmentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentRequestModel implements PaymentRequestModel {
  const _PaymentRequestModel({@JsonKey(name: 'DoctorId') required this.doctorId, @JsonKey(name: 'SlotId') required this.slotId, @JsonKey(name: 'Amount') required this.amount, @JsonKey(name: 'Payment') required this.payment, @JsonKey(name: 'Status') required this.status, @JsonKey(name: 'AppointmentAt') required this.appointmentAt});
  factory _PaymentRequestModel.fromJson(Map<String, dynamic> json) => _$PaymentRequestModelFromJson(json);

@override@JsonKey(name: 'DoctorId') final  int doctorId;
@override@JsonKey(name: 'SlotId') final  int slotId;
@override@JsonKey(name: 'Amount') final  double amount;
@override@JsonKey(name: 'Payment') final  int payment;
@override@JsonKey(name: 'Status') final  int status;
@override@JsonKey(name: 'AppointmentAt') final  String appointmentAt;

/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentRequestModelCopyWith<_PaymentRequestModel> get copyWith => __$PaymentRequestModelCopyWithImpl<_PaymentRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentRequestModel&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.status, status) || other.status == status)&&(identical(other.appointmentAt, appointmentAt) || other.appointmentAt == appointmentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,slotId,amount,payment,status,appointmentAt);

@override
String toString() {
  return 'PaymentRequestModel(doctorId: $doctorId, slotId: $slotId, amount: $amount, payment: $payment, status: $status, appointmentAt: $appointmentAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentRequestModelCopyWith<$Res> implements $PaymentRequestModelCopyWith<$Res> {
  factory _$PaymentRequestModelCopyWith(_PaymentRequestModel value, $Res Function(_PaymentRequestModel) _then) = __$PaymentRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DoctorId') int doctorId,@JsonKey(name: 'SlotId') int slotId,@JsonKey(name: 'Amount') double amount,@JsonKey(name: 'Payment') int payment,@JsonKey(name: 'Status') int status,@JsonKey(name: 'AppointmentAt') String appointmentAt
});




}
/// @nodoc
class __$PaymentRequestModelCopyWithImpl<$Res>
    implements _$PaymentRequestModelCopyWith<$Res> {
  __$PaymentRequestModelCopyWithImpl(this._self, this._then);

  final _PaymentRequestModel _self;
  final $Res Function(_PaymentRequestModel) _then;

/// Create a copy of PaymentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? slotId = null,Object? amount = null,Object? payment = null,Object? status = null,Object? appointmentAt = null,}) {
  return _then(_PaymentRequestModel(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,appointmentAt: null == appointmentAt ? _self.appointmentAt : appointmentAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
