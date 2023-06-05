import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_bloc/model/user_model.dart';
import 'package:example_bloc/shared_pre/shared_pre.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      if (isClosed) return;
      emit(Authing());
      if (event.userName.isEmpty || event.password.isEmpty) {
        emit(const AuthError('Username and password cannot be empty'));
        return;
      }
      if (event.password.length < 6) {
        emit(const AuthError('Password must be at least 6 characters'));
        return;
      }
      if (event.userName == 'user' && event.password == '123123') {
        await Future.delayed(const Duration(seconds: 2));
        UserModel userModel = UserModel(
          userName: event.userName,
          password: event.password,
          fullName: 'anh vu',
          token: 'ass',
        );
        SharedPre.saveUser(userModel);
        emit(Authed(userModel));
      } else {
        emit(const AuthError('Invalid username or password'));
      }
    });
    on<AuthLogout>((event, emit) async {
      if (isClosed) return;
      emit(Authing());
      SharedPre.removeUser;
      emit(UnAuthed());
    });
    on<ReAuth>((event, emit) async {
      if (isClosed) return;
      emit(Authing());
      UserModel? userModel = await SharedPre.getUser();
      if (userModel == null) {
        if (isClosed) return;
        emit(UnAuthed());
      } else {
        if (isClosed) return;
        emit(Authed(userModel));
      }
    });
  }
}
