import 'package:eqraa_book_store/core/data_source/firebase_data_source.dart';
import 'package:eqraa_book_store/feature/authentication/cubit/auth_states.dart';
import 'package:eqraa_book_store/feature/authentication/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInatialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  final FirebaseDataSource _dataSource = FirebaseDataSource();

  // Login logic
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await _dataSource.login(email, password);
      emit(LoginSuccessState(message: "Login Successful!"));
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No user found for that email.";
          break;
        case 'wrong-password':
          errorMessage = "Wrong password provided for that user.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is badly formatted.";
          break;
        case 'user-disabled':
          errorMessage = "This user has been disabled.";
          break;
        case 'invalid-credential':
          errorMessage = "Invalid email or password.";
          break;
        default:
          errorMessage = e.message ?? "An unknown error occurred.";
      }
      emit(LoginErrorState(message: errorMessage));
    } catch (e) {
      emit(LoginErrorState(message: "Error: ${e.toString()}"));
    }
  }

  // Signup logic
  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    try {
      await _dataSource.signUp(
        UsersModel(name: name, phone: phone, email: email),
        password,
      );
      emit(SignUpSuccessState(message: "Sign Up Successful!"));
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "The account already exists for that email.";
          break;
        case 'weak-password':
          errorMessage = "The password provided is too weak.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is badly formatted.";
          break;
        default:
          errorMessage = e.message ?? "An unknown error occurred.";
      }
      emit(SignUpErrorState(message: errorMessage));
    } catch (e) {
      emit(SignUpErrorState(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoadingState());
    try {
      await _dataSource.updatePassword(newPassword);
      emit(ResetPasswordSuccessState(message: "Password Reset Successfully!"));
    } catch (e) {
      emit(ResetPasswordErrorState(message: e.toString()));
    }
  }
}
