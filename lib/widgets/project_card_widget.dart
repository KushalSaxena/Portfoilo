import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kushal_portfolio/utils/project_utils.dart';

import '../constants/colors.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
            clipBehavior: Clip.antiAlias,
            height: 290,
            width: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColor.bgLight2
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(project.image,
                  height: 140,
                  width: 260,
                  fit: BoxFit.cover,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12,15,12,12),
                  child: Text(
                    project.title,style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12,0,12,12),
                  child: Text(
                    project.subtitle,style: TextStyle(
                    fontSize: 12,
                    color: CustomColor.whiteSecondary,
                  ),),
                ),
                const Spacer(),
                Container(
                  color: CustomColor.bgLight1,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      Text("Available on:", style: TextStyle(
                          color: CustomColor.yellowSecondary,
                          fontSize: 10
                      ),),
                      const Spacer(),
                      InkWell(
                          onTap: (){
                            js.context.callMethod("open",[project.link]);
                          },
                          child: Image.asset("assets/github.jpeg", width: 17,))
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
