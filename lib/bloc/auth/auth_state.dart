part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authed extends AuthState {
  final UserModel userModel;
  const Authed(this.userModel);
  @override
  List<Object> get props => [userModel];
}

class UnAuthed extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object> get props => [message];
}

class Authing extends AuthState {
  @override
  List<Object> get props => [];
}
