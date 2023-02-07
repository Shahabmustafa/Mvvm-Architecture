import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utls/utls.dart';
import '../View_Model/Services/auth_view_model.dart';
import '../res/component/round_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)
            ),
            onFieldSubmitted: (value){
              Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context,value,child){
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword.value,
                  obscuringCharacter: '*',
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password ',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        _obscurePassword.value =! _obscurePassword.value;
                      },
                      child: Icon(
                          _obscurePassword.value ? Icons.visibility_off_outlined : Icons.visibility
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: height * .1,
          ),
          RoundButton(
              title: 'Sign Up',
              loading: _authViewModel.signuploading,
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('Enter Your Email', context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Enter Your Password', context);
                }else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessage('Please Enter 6 Digits', context);
                }else{
                  Map data = {
                    "email": _emailController.text.toString(),
                    "password": _passwordController.text.toString(),
                  };
                  _authViewModel.SignUpApi(data,context);
                  return print('Api hit');
                }
              }),
        ],
      ),
    );
  }
}
