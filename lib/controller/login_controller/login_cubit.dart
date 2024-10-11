import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping/core/apis/end_points.dart';
import 'package:shoping/core/error/error_exception.dart';

import '../../core/apis/api_consumer.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  final ApiConsumer api;
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formLogin = GlobalKey();
  bool isPasswordShowing = true;
  void changePasswordVisibility(){
    isPasswordShowing =!isPasswordShowing;
    emit(IsPasswordShowing());
  }

  bool isLogin =false;
  changeLoginOrSignUp( bool value){
    isLogin = value;
    emit(LoginChangeToSignUp());
  }
  login() async{
    try{
      emit(LoginLoading());
     var responce =  await api.post(
          EndPoints.login,
          data:{
            ApiKey.email : email.text,
            ApiKey.password : password.text
          }
      );
     if (responce['status']){
       emit(LoginSuccess());
     }else{
      emit(LoginFailed(responce[ApiKey.message]));
     }

    } on ServerException catch(e){
      emit(LoginFailed(e.errorModel.errorMessage));
      print('------------------------${e.errorModel.errorMessage}');
    }
  }

}
