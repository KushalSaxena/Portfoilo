import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kushal_portfolio/widgets/site_logo.dart';

import '../styles/style.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          IconButton(onPressed: onMenuTap,
              icon: Icon(Icons.menu)),
          SizedBox(width: 15.0,),
        ],
      ),
    );
  }
}
