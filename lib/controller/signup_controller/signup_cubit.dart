import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/apis/api_consumer.dart';
import '../login_controller/login_cubit.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.api) : super(SignupInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final ApiConsumer api;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isPasswordShowing = true;
  void changePasswordVisibility(){
    isPasswordShowing =!isPasswordShowing;
    emit(IsPasswordShowing());
  }

}
