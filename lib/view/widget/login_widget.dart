
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoping/controller/login_controller/login_cubit.dart';

import '../../core/sharing/valid.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/spaces.dart';
import '../../core/theming/text_styles.dart';
import '../../core/widget_share/app_text_form_filed.dart';
import '../../core/widget_share/button.dart';

class RowSelectButton extends StatelessWidget {

  const RowSelectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonSelectLoginOrSignup(
          onPressed: (){
            LoginCubit.get(context).changeLoginOrSignUp(true);
          },
          name: 'تسجيل الدخول',
          isLogin: LoginCubit.get(context).isLogin,
        ),
        SizedBox(
          width: 15,
        ),
        ButtonSelectLoginOrSignup(
          onPressed: (){
            LoginCubit.get(context).changeLoginOrSignUp(false);
          },
          name: 'انشاء حساب ',
          isLogin: !LoginCubit.get(context).isLogin,
        ),

      ],
    );
  }
}

class ButtonSelectLoginOrSignup extends StatelessWidget {
  final String name;
  final bool isLogin;

  final void Function() onPressed;
  const ButtonSelectLoginOrSignup({
    super.key,
    required this.name,
    required this.isLogin, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: isLogin
            ? TextStyles.font16whiteColorW600
            : TextStyles.font16wMainColorW600,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 50),
          backgroundColor:
          isLogin ? ProjectColors.mainColor : ProjectColors.whiteColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          )),
    );
  }
}

class BackImageInLoginScreen extends StatelessWidget {
  const BackImageInLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            child: SvgPicture.asset('assets/svg/Shopping.svg'),
            decoration: BoxDecoration(
              color: ProjectColors.mainColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
          Container(
            height: 500,
          )
        ],
      ),
    );
  }
}

class SignInWithAntherWay extends StatelessWidget {
  const SignInWithAntherWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                color: ProjectColors.greyColor,
                height: 1,
              ),
            ),
            Spaces.width(10),
            Text(
              'او تسجيل الدخول بــ',
              style: TextStyles.font12GrayColor,
            ),
            Spaces.width(10),
            Expanded(
              child: Container(
                color: ProjectColors.greyColor,
                height: 1,
              ),
            ),
          ],
        ),
        Spaces.height(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: ProjectColors.moreGrayColors,
              child: Image.asset('assets/images/google.png'),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: ProjectColors.moreGrayColors,
              child: Image.asset('assets/images/facebook.png'),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: ProjectColors.moreGrayColors,
              child: Image.asset('assets/images/apple.png'),
            )
          ],
        ),
        Spaces.height(30),
      ],
    );
  }
}

class FormLoginScreen extends StatelessWidget {
  final LoginState state;

  const FormLoginScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formLogin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormFiled(
            validator: (value) {
              if (!isEmail(value!)) {
                return 'يجب ادخال الايمل بشكل صحيح';
              }
              return null;
            },
            hintText: 'الايميل',
            controller: LoginCubit.get(context).email,
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
            controller: LoginCubit.get(context).password,
            obscureText: LoginCubit.get(context).isPasswordShowing,
            prefixIcon: Icon(Icons.lock, color: ProjectColors.mainColor),
            suffixIcon: IconButton(
              onPressed: () {
                LoginCubit.get(context).changePasswordVisibility();
              },
              icon: Icon(LoginCubit.get(context).isPasswordShowing ? Icons.visibility : Icons.visibility_off, color: ProjectColors.greyColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'نسيت كلمة المرور ؟',
            style: TextStyles.font14grayColorW400,
          ),
          SizedBox(
            height: 15,
          ),
          state is LoginLoading
              ? Center(child: CircularProgressIndicator())
              : MainButton(
            name: 'تسجيل الدخول',
            onPressed: () {
              if (LoginCubit.get(context)
                  .formLogin
                  .currentState!
                  .validate()) {
                LoginCubit.get(context).login();
              }
            },
            margin: EdgeInsets.all(0),
          ),
          SizedBox(
            height: 15,
          ),
          SignInWithAntherWay()
        ],
      ),
    );
  }
}