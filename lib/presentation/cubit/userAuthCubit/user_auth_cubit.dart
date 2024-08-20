import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsocks/domain/repository/user_repository.dart';
import 'package:shopsocks/domain/models/user_model.dart';

part 'user_auth_cubit.freezed.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final UserRepository _userRepository = UserRepository();

  UserAuthCubit() : super(const Loading());

  Future<void> intialUser(int idTg) async {
    emit(Loading());
    await Future.delayed(Duration(seconds: 2));
    Map result = await _userRepository.getUser(idTg);
    if (result['result']) {
      User user = result['user'];
      emit(Intial(user));
    } else {
      emit(Error());
    }
  }
}
