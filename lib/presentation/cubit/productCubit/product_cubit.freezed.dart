// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)
        initialProduct,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialProduct value) initialProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialProduct value)? initialProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialProduct value)? initialProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IntialProductImplCopyWith<$Res> {
  factory _$$IntialProductImplCopyWith(
          _$IntialProductImpl value, $Res Function(_$IntialProductImpl) then) =
      __$$IntialProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BasketProduct basketProducts, FavoriteProduct favoriteProduct});
}

/// @nodoc
class __$$IntialProductImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$IntialProductImpl>
    implements _$$IntialProductImplCopyWith<$Res> {
  __$$IntialProductImplCopyWithImpl(
      _$IntialProductImpl _value, $Res Function(_$IntialProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketProducts = null,
    Object? favoriteProduct = null,
  }) {
    return _then(_$IntialProductImpl(
      null == basketProducts
          ? _value.basketProducts
          : basketProducts // ignore: cast_nullable_to_non_nullable
              as BasketProduct,
      null == favoriteProduct
          ? _value.favoriteProduct
          : favoriteProduct // ignore: cast_nullable_to_non_nullable
              as FavoriteProduct,
    ));
  }
}

/// @nodoc

class _$IntialProductImpl implements IntialProduct {
  const _$IntialProductImpl(this.basketProducts, this.favoriteProduct);

  @override
  final BasketProduct basketProducts;
  @override
  final FavoriteProduct favoriteProduct;

  @override
  String toString() {
    return 'ProductState.initialProduct(basketProducts: $basketProducts, favoriteProduct: $favoriteProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntialProductImpl &&
            (identical(other.basketProducts, basketProducts) ||
                other.basketProducts == basketProducts) &&
            (identical(other.favoriteProduct, favoriteProduct) ||
                other.favoriteProduct == favoriteProduct));
  }

  @override
  int get hashCode => Object.hash(runtimeType, basketProducts, favoriteProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntialProductImplCopyWith<_$IntialProductImpl> get copyWith =>
      __$$IntialProductImplCopyWithImpl<_$IntialProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)
        initialProduct,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return initialProduct(basketProducts, favoriteProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return initialProduct?.call(basketProducts, favoriteProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initialProduct != null) {
      return initialProduct(basketProducts, favoriteProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialProduct value) initialProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initialProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialProduct value)? initialProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initialProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialProduct value)? initialProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initialProduct != null) {
      return initialProduct(this);
    }
    return orElse();
  }
}

abstract class IntialProduct implements ProductState {
  const factory IntialProduct(final BasketProduct basketProducts,
      final FavoriteProduct favoriteProduct) = _$IntialProductImpl;

  BasketProduct get basketProducts;
  FavoriteProduct get favoriteProduct;
  @JsonKey(ignore: true)
  _$$IntialProductImplCopyWith<_$IntialProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)
        initialProduct,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialProduct value) initialProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialProduct value)? initialProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialProduct value)? initialProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProductState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'ProductState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)
        initialProduct,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BasketProduct basketProducts, FavoriteProduct favoriteProduct)?
        initialProduct,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialProduct value) initialProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialProduct value)? initialProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialProduct value)? initialProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ProductState {
  const factory Error() = _$ErrorImpl;
}
