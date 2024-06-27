import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screeHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screeHeight/1.2,
      constraints: BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hi,\nI'm Kushal Saxena\nRecent Graduate",
                style: TextStyle(
                    fontSize: 30.0,
                    height: 1.5,
                    fontWeight: FontWeight.bold, color: CustomColor.whitePrimary),),
              SizedBox(height: 15.0,),
              SizedBox(
                  width: 250,
                  child: ElevatedButton(onPressed: (){}, child: Text("Get in touch"))),
            ],
          ),
          Image.asset("assets/portfolio.jpg",width: screenWidth/2,)
        ],
      ),
    );
  }
}
