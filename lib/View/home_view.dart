import 'package:flutter/material.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/View_Model/user_view_model.dart';
import 'package:mvvvm_architecture/res/component/round_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final usermodelview = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              usermodelview.remove().then((value){
                Navigator.pushNamed(context, RoutesName.Login);
              },
              );
            },
            child: Center(child: Text('LogOut')),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
