// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitData {}

/// @nodoc
abstract class $InitDataCopyWith<$Res> {
  factory $InitDataCopyWith(InitData value, $Res Function(InitData) then) =
      _$InitDataCopyWithImpl<$Res, InitData>;
}

/// @nodoc
class _$InitDataCopyWithImpl<$Res, $Val extends InitData>
    implements $InitDataCopyWith<$Res> {
  _$InitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitDataImplCopyWith<$Res> {
  factory _$$InitDataImplCopyWith(
          _$InitDataImpl value, $Res Function(_$InitDataImpl) then) =
      __$$InitDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitDataImplCopyWithImpl<$Res>
    extends _$InitDataCopyWithImpl<$Res, _$InitDataImpl>
    implements _$$InitDataImplCopyWith<$Res> {
  __$$InitDataImplCopyWithImpl(
      _$InitDataImpl _value, $Res Function(_$InitDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitDataImpl implements _InitData {
  const _$InitDataImpl();

  @override
  String toString() {
    return 'InitData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _InitData implements InitData {
  const factory _InitData() = _$InitDataImpl;
}

/// @nodoc
mixin _$RemoveProductToCart {
  int get cartId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemoveProductToCartCopyWith<RemoveProductToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveProductToCartCopyWith<$Res> {
  factory $RemoveProductToCartCopyWith(
          RemoveProductToCart value, $Res Function(RemoveProductToCart) then) =
      _$RemoveProductToCartCopyWithImpl<$Res, RemoveProductToCart>;
  @useResult
  $Res call({int cartId});
}

/// @nodoc
class _$RemoveProductToCartCopyWithImpl<$Res, $Val extends RemoveProductToCart>
    implements $RemoveProductToCartCopyWith<$Res> {
  _$RemoveProductToCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoveProductToCartImplCopyWith<$Res>
    implements $RemoveProductToCartCopyWith<$Res> {
  factory _$$RemoveProductToCartImplCopyWith(_$RemoveProductToCartImpl value,
          $Res Function(_$RemoveProductToCartImpl) then) =
      __$$RemoveProductToCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cartId});
}

/// @nodoc
class __$$RemoveProductToCartImplCopyWithImpl<$Res>
    extends _$RemoveProductToCartCopyWithImpl<$Res, _$RemoveProductToCartImpl>
    implements _$$RemoveProductToCartImplCopyWith<$Res> {
  __$$RemoveProductToCartImplCopyWithImpl(_$RemoveProductToCartImpl _value,
      $Res Function(_$RemoveProductToCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
  }) {
    return _then(_$RemoveProductToCartImpl(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveProductToCartImpl implements _RemoveProductToCart {
  const _$RemoveProductToCartImpl({required this.cartId});

  @override
  final int cartId;

  @override
  String toString() {
    return 'RemoveProductToCart(cartId: $cartId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductToCartImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductToCartImplCopyWith<_$RemoveProductToCartImpl> get copyWith =>
      __$$RemoveProductToCartImplCopyWithImpl<_$RemoveProductToCartImpl>(
          this, _$identity);
}

abstract class _RemoveProductToCart implements RemoveProductToCart {
  const factory _RemoveProductToCart({required final int cartId}) =
      _$RemoveProductToCartImpl;

  @override
  int get cartId;
  @override
  @JsonKey(ignore: true)
  _$$RemoveProductToCartImplCopyWith<_$RemoveProductToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RemoveAllCart {}

/// @nodoc
abstract class $RemoveAllCartCopyWith<$Res> {
  factory $RemoveAllCartCopyWith(
          RemoveAllCart value, $Res Function(RemoveAllCart) then) =
      _$RemoveAllCartCopyWithImpl<$Res, RemoveAllCart>;
}

/// @nodoc
class _$RemoveAllCartCopyWithImpl<$Res, $Val extends RemoveAllCart>
    implements $RemoveAllCartCopyWith<$Res> {
  _$RemoveAllCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemoveAllCartImplCopyWith<$Res> {
  factory _$$RemoveAllCartImplCopyWith(
          _$RemoveAllCartImpl value, $Res Function(_$RemoveAllCartImpl) then) =
      __$$RemoveAllCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveAllCartImplCopyWithImpl<$Res>
    extends _$RemoveAllCartCopyWithImpl<$Res, _$RemoveAllCartImpl>
    implements _$$RemoveAllCartImplCopyWith<$Res> {
  __$$RemoveAllCartImplCopyWithImpl(
      _$RemoveAllCartImpl _value, $Res Function(_$RemoveAllCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveAllCartImpl implements _RemoveAllCart {
  const _$RemoveAllCartImpl();

  @override
  String toString() {
    return 'RemoveAllCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemoveAllCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _RemoveAllCart implements RemoveAllCart {
  const factory _RemoveAllCart() = _$RemoveAllCartImpl;
}
