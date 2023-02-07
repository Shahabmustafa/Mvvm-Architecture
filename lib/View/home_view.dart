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
              return Center(child: const CircularProgressIndicator());
            case Status.Error:
              return Center(child: Text('Error'));
            case Status.Complete:
              return ListView.builder(
                itemCount: value.photoList.data!.data!.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage((value.photoList.data!.data![index].avatar.toString())),
                        radius: 30.0,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id: ${(value.photoList.data!.data![index].id.toString())}'),
                          Row(
                            children: [
                              Text('Name : ${value.photoList.data!.data![index].firstName.toString()}'),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(value.photoList.data!.data![index].lastName.toString()),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text('Email: ${value.photoList.data!.data![index].email.toString()}'),
                    )
                  );
                },
              );
          }
          return Container();
          },
        ),
      ),
    );
  }
}
