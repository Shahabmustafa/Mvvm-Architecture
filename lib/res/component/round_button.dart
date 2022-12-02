import 'package:flutter/material.dart';
import 'package:mvvvm_architecture/res/colors.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  RoundButton({Key? key,required this.title,this.loading = false,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: loading ? CircularProgressIndicator(): Center(child: Text(title,style: TextStyle(color: AppColors.whiteColor),)),
      ),
    );
  }
}
