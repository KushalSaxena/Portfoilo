import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kushal_portfolio/styles/style.dart';
import 'package:kushal_portfolio/widgets/site_logo.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: (){},),
          Spacer(),
          for(int i=0; i<navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: (){},
                child: Text(navTitles[i],
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: CustomColor.whitePrimary),),
              ),
            ),
        ],
      ),
    );
  }
}
