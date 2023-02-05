import 'package:flutter/material.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/Utls/utls.dart';
import 'package:mvvvm_architecture/View_Model/auth_view_model.dart';
import 'package:mvvvm_architecture/res/component/round_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              title: 'Login',
              loading: _authViewModel.loading,
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
                  _authViewModel.loginApi(data,context);
                  return print('Api hit');
                }
          }),
          SizedBox(
            height: height * .05,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.SignUp);
            },
              child: const Text("Don't have an account? Sign Up")),
        ],
      ),
    );
  }
}
