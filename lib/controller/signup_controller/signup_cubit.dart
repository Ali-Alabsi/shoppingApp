import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/apis/api_consumer.dart';
import '../../core/apis/end_points.dart';
import '../../core/error/error_exception.dart';
import '../login_controller/login_cubit.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.api) : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);
  final ApiConsumer api;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formSignup = GlobalKey();
  bool isPasswordShowing = true;

  void changePasswordVisibility() {
    isPasswordShowing = !isPasswordShowing;
    emit(IsPasswordShowing());
  }

  Signup() async {
    try {
      emit(SignupLoading());
      var responce = await api.post(EndPoints.signup,
          data: {
            ApiKey.email: email.text,
            ApiKey.password: password.text,
            ApiKey.name: name.text,
            ApiKey.phone: phone.text,
          },
          isFormData: true);
      if (responce['status']) {
        emit(SignupSuccess());
        formClean();
      } else {
        emit(SignupFailed(responce[ApiKey.message]));
      }
    } catch (e) {
      emit(SignupFailed(e.toString()));
      print('------------------------${e.toString()}');
    }
  }
  formClean(){
    email.clear();
    password.clear();
    name.clear();
    phone.clear();
  }
}
