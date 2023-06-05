part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLogin extends AuthEvent {
  final String userName;
  final String password;
  const AuthLogin(this.userName, this.password);
  @override
  List<Object> get props => [userName, password];
}

class AuthLogout extends AuthEvent {
  @override
  List<Object> get props => [];
}

class ReAuth extends AuthEvent {
  @override
  List<Object> get props => [];
}
