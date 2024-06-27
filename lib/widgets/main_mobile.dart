import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screeHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screeHeight,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
              shaderCallback: (bounds){
                return LinearGradient(colors: [
                  CustomColor.scaffoldbg.withOpacity(0.6),
                  CustomColor.scaffoldbg.withOpacity(0.6),
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset("assets/portfolio.jpg", width: screenWidth,)
          ),
          SizedBox(height: 30,),
          const Text("Hi,\nI'm Kushal Saxena\nRecent Graduate",
            style: TextStyle(
                fontSize: 24.0,
                height: 1.5,
                fontWeight: FontWeight.bold, color: CustomColor.whitePrimary),),
          SizedBox(height: 15.0,),
          SizedBox(
              width: 190,
              child: ElevatedButton(onPressed: (){}, child: Text("Get in touch"))
          ),
        ],
      ),
    );
  }
}
