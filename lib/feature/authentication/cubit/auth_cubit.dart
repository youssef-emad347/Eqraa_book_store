import 'package:eqraa_book_store/core/data_souece/firebase_data_source.dart';
import 'package:eqraa_book_store/feature/authentication/cubit/auth_states.dart';
import 'package:eqraa_book_store/feature/authentication/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInatialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  final FirebaseDataSource _dataSource = FirebaseDataSource();

  // Login logic
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await _dataSource.login(email, password);
      emit(LoginSuccessState(message: "Login Successful!"));
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
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
    } catch (e) {
      emit(SignUpErrorState(message: e.toString()));
    }
  }
}
