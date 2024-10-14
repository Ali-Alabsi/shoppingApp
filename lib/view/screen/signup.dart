import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping/controller/signup_controller/signup_cubit.dart';
import 'package:shoping/core/apis/dio_consumer.dart';

import '../../core/sharing/valid.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/spaces.dart';
import '../../core/theming/text_styles.dart';
import '../../core/widget_share/app_text_form_filed.dart';
import '../../core/widget_share/button.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SignupCubit(DioConsumer(dio: Dio())),
  child: BlocConsumer<SignupCubit, SignupState>(
  listener: (context, state) {
    
        },
  builder: (context, state) {
    return Column(
      children: [
        AppTextFormFiled(
          spaceActive: true,
          validator: (value) {
            if (value =='') {
              return 'يجب ادخال الاسم';
            }
            return null;
          },
          hintText: 'الاسم',
          controller: SignupCubit.get(context).email,
          prefixIcon: Icon(
            Icons.account_circle,
            color: ProjectColors.mainColor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AppTextFormFiled(
          validator: (value) {
            if (!isEmail(value!)) {
              return 'يجب ادخال الايمل بشكل صحيح';
            }
            return null;
          },
          hintText: 'الايميل',
          controller: SignupCubit.get(context).email,
          prefixIcon: Icon(
            Icons.email,
            color: ProjectColors.mainColor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AppTextFormFiled(
          validator: (value) {
            if (value == '') {
              return 'يجب ادخال كلمة المرور ';
            }
            return null;
          },
          hintText: 'كلمة المرور',
          controller: SignupCubit.get(context).password,
          obscureText: SignupCubit.get(context).isPasswordShowing,
          prefixIcon: Icon(Icons.lock, color: ProjectColors.mainColor),
          suffixIcon: IconButton(
            onPressed: () {
              SignupCubit.get(context).changePasswordVisibility();
            },
            icon: Icon(SignupCubit.get(context).isPasswordShowing ? Icons.visibility : Icons.visibility_off, color: ProjectColors.greyColor),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AppTextFormFiled(
          validator: (value) {
            if (value =='') {
              return 'يجب ادخال الرقم بشكل صحيح';
            }
            return null;
          },
          hintText: 'الايميل',
          keyboardType:  TextInputType.number,
          controller: SignupCubit.get(context).email,
          prefixIcon: Icon(
            Icons.phone,
            color: ProjectColors.mainColor,
          ),
        ),

        SizedBox(
          height: 15,
        ),
        state is SignupLoading
            ? Center(child: CircularProgressIndicator())
            : MainButton(
          name: 'تسجيل الدخول',
          onPressed: () {
            if (SignupCubit.get(context)
                .formLogin
                .currentState!
                .validate()) {
              SignupCubit.get(context).login();
            }
          },
          margin: EdgeInsets.all(0),
        ),
        SizedBox(
          height: 15,
        ),

      ],
    );
  },
),
);
  }
}
