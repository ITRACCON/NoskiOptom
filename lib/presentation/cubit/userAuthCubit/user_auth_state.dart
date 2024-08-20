part of 'user_auth_cubit.dart';

@freezed
abstract class UserAuthState with _$UserAuthState {
  const factory UserAuthState.initial(User user) = Intial;

  const factory UserAuthState.loading() = Loading;

  const factory UserAuthState.error() = Error;
}
