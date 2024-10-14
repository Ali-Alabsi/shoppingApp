import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoping/controller/login_controller/login_cubit.dart';
import 'package:shoping/core/apis/dio_consumer.dart';
import 'package:shoping/core/sharing/valid.dart';
import 'package:shoping/core/theming/colors.dart';
import 'package:shoping/core/theming/text_styles.dart';

import '../../core/theming/spaces.dart';
import '../../core/widget_share/app_text_form_filed.dart';
import '../../core/widget_share/button.dart';
import '../../core/widget_share/dialog_message_in_bottom.dart';
import '../widget/login_widget.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(DioConsumer(dio: Dio())),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              BackImageInLoginScreen(),
              Positioned(
                right: 20,
                left: 20,
                top: 200,
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailed) {
                      dialogMessageInBottom(context, state.errorMessage);
                    } else if (state is LoginSuccess) {
                      dialogMessageInBottom(
                          context, 'الايميل وكلمة المرور صحيحه ✔');
                    }
                  },
                  builder: (context, state) {
                    return Card(
                      elevation: 4,
                      color: ProjectColors.whiteColor.withOpacity(0.9),
                      child: Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              RowSelectButton(),
                              SizedBox(
                                height: 30,
                              ),
                              LoginCubit.get(context).isLogin ? FormLoginScreen(
                                state: state,
                              )
                             : Signup()
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


