// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names, unused_element, nullable_type_in_catch_clause, prefer_typing_uninitialized_variables, empty_catches

import 'package:bloc/bloc.dart';
import 'package:habit_application/cubit/app_cubit_states.dart';
import 'package:habit_application/data_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignin _googleSignIn = GoogleSigIn.instancee;
    emit(WelcomeState());
    // login
    Future Login(String email, String password) async {
      // when loading
      emit(const AuthLoginLoading());
      try {
        User? user = (await _firebaseAuth.signInWithWmailAndPassword(
                email: email, password: password))
            .user;
        if (user != null) {
          emit(AuthLoginSuccess(user: user));
        }
      } on FireBaseAuthException catch (e) {
        emit(AuthLoginError(e.message!));
      }
    }

    // signup
    Future SignUp(String email, String password, String name) async {
      emit(const AuthSignUpLoading());
      try {
        User? user = (await _firebaseAuth.createUserWithWmailAndPassword(
                email: email, password: password))
            .user;
        if (user != null) {
          // update display name
          user.updateDisplayName(name);
          emit(AuthSignUpSuccess(user: user));
        }
      } on FireBaseAuthException catch (e) {
        emit(AuthSignUpError(e.message!));
      }
    }

    // forgot password
    Future ForgotPassword(String email) async {
      emit(const AuthLForgotPasswordLoading());
      try {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
        emit(const AuthLForgotPasswordSuccess());
      } on FireBaseAuthException catch (e) {
        emit(AuthForgotPasswordError(e.message!));
      }
    }

    // logout
    Future logout() async {
      await _firebaseAuth.signOut();
      emit(const AuthLogout());
    }
  }

  final DataServices data;
  late final habits;
  void getData() async {
    try {
      emit(HomeLoadingState());
      habits = await data.getInfo();
      emit(LoadedState(habits));
    } catch (e) {}
  }

  detailScreen(DataModel, data) {
    emit(DetailState(data));
  }
}
