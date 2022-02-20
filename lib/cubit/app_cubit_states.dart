// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:habit_application/model/data_model.dart';

abstract class CubitStates extends Equatable {
  final User? user;
  final String? errorMessage;
  const CubitStates({this.user, this.errorMessage});
  @override
  List<Object?> get props => [user, errorMessage];
}

// default state first state of the application
class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

// welcome state displays welcome screen
class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];
}

// login states
class AuthLoginLoading extends CubitStates {
  const AuthLoginLoading();
}

class AuthLoginSuccess extends CubitStates {
  const AuthLoginSuccess({required User user}) : super(user: user);
}

class AuthLoginError extends CubitStates {
  final String? error;
  const AuthLoginError(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthLoginError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}

// sign up states
class AuthSignUpLoading extends CubitStates {
  const AuthSignUpLoading();
}

class AuthSignUpSuccess extends CubitStates {
  const AuthSignUpSuccess({required User user}) : super(user: user);
}

class AuthSignUpError extends CubitStates {
  final String? error;
  const AuthSignUpError(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthSignUpError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}

//forgot password states
class AuthLForgotPasswordLoading extends CubitStates {
  const AuthLForgotPasswordLoading();
}

class AuthLForgotPasswordSuccess extends CubitStates {
  const AuthLForgotPasswordSuccess();
}

class AuthForgotPasswordError extends CubitStates {
  final String? error;
  const AuthForgotPasswordError(this.error);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthForgotPasswordError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}

// google auth states
class AuthGoogleLoading extends CubitStates {
  const AuthGoogleLoading();
}

class AuthGoogleSuccess extends CubitStates {
  const AuthGoogleSuccess(User? user) : super(user: user);
}

class AuthGoogleError extends CubitStates {
  const AuthGoogleError({String? error}) : super(errorMessage: error);
}

// logout state
class AuthLogout extends CubitStates {
  const AuthLogout();
}

// loading home state
class HomeLoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.habits);
  final List<DataModel> habits;
  @override
  List<Object> get props => [habits];
}

//habit detail state
class DetailState extends CubitStates {
  DetailState(this.habit);
  final DataModel habit;
  @override
  List<Object> get props => [habit];
}
