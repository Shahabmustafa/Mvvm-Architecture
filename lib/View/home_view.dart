import 'package:flutter/material.dart';
import 'package:mvvvm_architecture/Data/response/status.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/View_Model/Services/home_view_model.dart';
import 'package:mvvvm_architecture/View_Model/Services/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchPhotoListapi();
    super.initState();
  }
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
          const SizedBox(
            width: 10.0,
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context,value,_){
          switch (value.photoList.status){
            case Status.Loading:
              return CircularProgressIndicator();
            case Status.Error:
              return Text('Error');
            case Status.Complete:
              return Text('Data');
          }
          return Container();
          },
        ),
      ),
    );
  }
}
