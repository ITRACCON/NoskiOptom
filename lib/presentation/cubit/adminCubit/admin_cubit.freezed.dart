// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IntialStatsImplCopyWith<$Res> {
  factory _$$IntialStatsImplCopyWith(
          _$IntialStatsImpl value, $Res Function(_$IntialStatsImpl) then) =
      __$$IntialStatsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<User> users,
      List<OrderUser> orders,
      List<BasketProductStats> basketProductStat});
}

/// @nodoc
class __$$IntialStatsImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$IntialStatsImpl>
    implements _$$IntialStatsImplCopyWith<$Res> {
  __$$IntialStatsImplCopyWithImpl(
      _$IntialStatsImpl _value, $Res Function(_$IntialStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? orders = null,
    Object? basketProductStat = null,
  }) {
    return _then(_$IntialStatsImpl(
      null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderUser>,
      null == basketProductStat
          ? _value._basketProductStat
          : basketProductStat // ignore: cast_nullable_to_non_nullable
              as List<BasketProductStats>,
    ));
  }
}

/// @nodoc

class _$IntialStatsImpl implements IntialStats {
  const _$IntialStatsImpl(final List<User> users, final List<OrderUser> orders,
      final List<BasketProductStats> basketProductStat)
      : _users = users,
        _orders = orders,
        _basketProductStat = basketProductStat;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<OrderUser> _orders;
  @override
  List<OrderUser> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<BasketProductStats> _basketProductStat;
  @override
  List<BasketProductStats> get basketProductStat {
    if (_basketProductStat is EqualUnmodifiableListView)
      return _basketProductStat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basketProductStat);
  }

  @override
  String toString() {
    return 'AdminState.initialStats(users: $users, orders: $orders, basketProductStat: $basketProductStat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntialStatsImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._basketProductStat, _basketProductStat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_basketProductStat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntialStatsImplCopyWith<_$IntialStatsImpl> get copyWith =>
      __$$IntialStatsImplCopyWithImpl<_$IntialStatsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return initialStats(users, orders, basketProductStat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return initialStats?.call(users, orders, basketProductStat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initialStats != null) {
      return initialStats(users, orders, basketProductStat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initialStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initialStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initialStats != null) {
      return initialStats(this);
    }
    return orElse();
  }
}

abstract class IntialStats implements AdminState {
  const factory IntialStats(
      final List<User> users,
      final List<OrderUser> orders,
      final List<BasketProductStats> basketProductStat) = _$IntialStatsImpl;

  List<User> get users;
  List<OrderUser> get orders;
  List<BasketProductStats> get basketProductStat;
  @JsonKey(ignore: true)
  _$$IntialStatsImplCopyWith<_$IntialStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntialImplCopyWith<$Res> {
  factory _$$IntialImplCopyWith(
          _$IntialImpl value, $Res Function(_$IntialImpl) then) =
      __$$IntialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IntialImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$IntialImpl>
    implements _$$IntialImplCopyWith<$Res> {
  __$$IntialImplCopyWithImpl(
      _$IntialImpl _value, $Res Function(_$IntialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IntialImpl implements Intial {
  const _$IntialImpl();

  @override
  String toString() {
    return 'AdminState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IntialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Intial implements AdminState {
  const factory Intial() = _$IntialImpl;
}

/// @nodoc
abstract class _$$initialMassAddImplCopyWith<$Res> {
  factory _$$initialMassAddImplCopyWith(_$initialMassAddImpl value,
          $Res Function(_$initialMassAddImpl) then) =
      __$$initialMassAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<dynamic, dynamic> init});
}

/// @nodoc
class __$$initialMassAddImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$initialMassAddImpl>
    implements _$$initialMassAddImplCopyWith<$Res> {
  __$$initialMassAddImplCopyWithImpl(
      _$initialMassAddImpl _value, $Res Function(_$initialMassAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? init = null,
  }) {
    return _then(_$initialMassAddImpl(
      null == init
          ? _value._init
          : init // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$initialMassAddImpl implements initialMassAdd {
  const _$initialMassAddImpl(final Map<dynamic, dynamic> init) : _init = init;

  final Map<dynamic, dynamic> _init;
  @override
  Map<dynamic, dynamic> get init {
    if (_init is EqualUnmodifiableMapView) return _init;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_init);
  }

  @override
  String toString() {
    return 'AdminState.initialMassAdd(init: $init)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initialMassAddImpl &&
            const DeepCollectionEquality().equals(other._init, _init));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_init));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initialMassAddImplCopyWith<_$initialMassAddImpl> get copyWith =>
      __$$initialMassAddImplCopyWithImpl<_$initialMassAddImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return initialMassAdd(init);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return initialMassAdd?.call(init);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initialMassAdd != null) {
      return initialMassAdd(init);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initialMassAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initialMassAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initialMassAdd != null) {
      return initialMassAdd(this);
    }
    return orElse();
  }
}

abstract class initialMassAdd implements AdminState {
  const factory initialMassAdd(final Map<dynamic, dynamic> init) =
      _$initialMassAddImpl;

  Map<dynamic, dynamic> get init;
  @JsonKey(ignore: true)
  _$$initialMassAddImplCopyWith<_$initialMassAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'AdminState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements AdminState {
  const factory Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$InitEditProductImplCopyWith<$Res> {
  factory _$$InitEditProductImplCopyWith(_$InitEditProductImpl value,
          $Res Function(_$InitEditProductImpl) then) =
      __$$InitEditProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$InitEditProductImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$InitEditProductImpl>
    implements _$$InitEditProductImplCopyWith<$Res> {
  __$$InitEditProductImplCopyWithImpl(
      _$InitEditProductImpl _value, $Res Function(_$InitEditProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$InitEditProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$InitEditProductImpl implements InitEditProduct {
  const _$InitEditProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'AdminState.initEditProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEditProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEditProductImplCopyWith<_$InitEditProductImpl> get copyWith =>
      __$$InitEditProductImplCopyWithImpl<_$InitEditProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return initEditProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return initEditProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initEditProduct != null) {
      return initEditProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initEditProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initEditProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initEditProduct != null) {
      return initEditProduct(this);
    }
    return orElse();
  }
}

abstract class InitEditProduct implements AdminState {
  const factory InitEditProduct(final Product product) = _$InitEditProductImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$InitEditProductImplCopyWith<_$InitEditProductImpl> get copyWith =>
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
    extends _$AdminStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'AdminState.loading()';
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
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
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
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
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

abstract class Loading implements AdminState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AdminState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)
        initialStats,
    required TResult Function() initial,
    required TResult Function(Map<dynamic, dynamic> init) initialMassAdd,
    required TResult Function() success,
    required TResult Function(Product product) initEditProduct,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult? Function()? initial,
    TResult? Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult? Function()? success,
    TResult? Function(Product product)? initEditProduct,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, List<OrderUser> orders,
            List<BasketProductStats> basketProductStat)?
        initialStats,
    TResult Function()? initial,
    TResult Function(Map<dynamic, dynamic> init)? initialMassAdd,
    TResult Function()? success,
    TResult Function(Product product)? initEditProduct,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntialStats value) initialStats,
    required TResult Function(Intial value) initial,
    required TResult Function(initialMassAdd value) initialMassAdd,
    required TResult Function(Success value) success,
    required TResult Function(InitEditProduct value) initEditProduct,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IntialStats value)? initialStats,
    TResult? Function(Intial value)? initial,
    TResult? Function(initialMassAdd value)? initialMassAdd,
    TResult? Function(Success value)? success,
    TResult? Function(InitEditProduct value)? initEditProduct,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntialStats value)? initialStats,
    TResult Function(Intial value)? initial,
    TResult Function(initialMassAdd value)? initialMassAdd,
    TResult Function(Success value)? success,
    TResult Function(InitEditProduct value)? initEditProduct,
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

abstract class Error implements AdminState {
  const factory Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
