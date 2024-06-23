import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kushal_portfolio/constants/colors.dart';
import 'package:kushal_portfolio/constants/nav_items.dart';
import 'package:kushal_portfolio/constants/size.dart';
import 'package:kushal_portfolio/styles/style.dart';
import 'package:kushal_portfolio/widgets/drawer_mobile.dart';
import 'package:kushal_portfolio/widgets/header_desktop.dart';
import 'package:kushal_portfolio/widgets/header_mobile.dart';
import 'package:kushal_portfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldbg,
          endDrawer: constraints.maxWidth>=kMinDesktopWIdth ? null : const MobileDrawer(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //Main
              if(constraints.maxWidth>=kMinDesktopWIdth)
                const HeaderDesktop()
              else
              HeaderMobile(
                onLogoTap: (){},
                onMenuTap: (){
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              //Skills
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //Projects
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //Contact
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
            ],
          ),
        );
      }
    );
  }
}
