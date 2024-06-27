import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skills.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the number of columns you want
    const int numColumns = 6;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1000,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numColumns,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: 2.0,
              ),
              itemCount: skillItems.length,
              itemBuilder: (context, index) {
                return Chip(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  backgroundColor: CustomColor.bgLight2,
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        skillItems[index]["img"],
                        height: 30.0, // Adjust the size of the image as needed
                      ),
                      SizedBox(height: 8.0),
                      Text(skillItems[index]["title"]),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
