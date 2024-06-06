// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home.event.dart';

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
mixin _$AddProductToCart {
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductToCartCopyWith<AddProductToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductToCartCopyWith<$Res> {
  factory $AddProductToCartCopyWith(
          AddProductToCart value, $Res Function(AddProductToCart) then) =
      _$AddProductToCartCopyWithImpl<$Res, AddProductToCart>;
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class _$AddProductToCartCopyWithImpl<$Res, $Val extends AddProductToCart>
    implements $AddProductToCartCopyWith<$Res> {
  _$AddProductToCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductToCartImplCopyWith<$Res>
    implements $AddProductToCartCopyWith<$Res> {
  factory _$$AddProductToCartImplCopyWith(_$AddProductToCartImpl value,
          $Res Function(_$AddProductToCartImpl) then) =
      __$$AddProductToCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class __$$AddProductToCartImplCopyWithImpl<$Res>
    extends _$AddProductToCartCopyWithImpl<$Res, _$AddProductToCartImpl>
    implements _$$AddProductToCartImplCopyWith<$Res> {
  __$$AddProductToCartImplCopyWithImpl(_$AddProductToCartImpl _value,
      $Res Function(_$AddProductToCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$AddProductToCartImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddProductToCartImpl implements _AddProductToCart {
  const _$AddProductToCartImpl(
      {required this.productId, required this.quantity});

  @override
  final int productId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'AddProductToCart(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductToCartImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductToCartImplCopyWith<_$AddProductToCartImpl> get copyWith =>
      __$$AddProductToCartImplCopyWithImpl<_$AddProductToCartImpl>(
          this, _$identity);
}

abstract class _AddProductToCart implements AddProductToCart {
  const factory _AddProductToCart(
      {required final int productId,
      required final int quantity}) = _$AddProductToCartImpl;

  @override
  int get productId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$AddProductToCartImplCopyWith<_$AddProductToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
