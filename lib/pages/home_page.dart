import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kushal_portfolio/constants/colors.dart';
import 'package:kushal_portfolio/constants/nav_items.dart';
import 'package:kushal_portfolio/constants/size.dart';
import 'package:kushal_portfolio/constants/skills.dart';
import 'package:kushal_portfolio/styles/style.dart';
import 'package:kushal_portfolio/utils/project_utils.dart';
import 'package:kushal_portfolio/widgets/certification_section.dart';
import 'package:kushal_portfolio/widgets/contact_section.dart';
import 'package:kushal_portfolio/widgets/custom_text_field.dart';
import 'package:kushal_portfolio/widgets/drawer_mobile.dart';
import 'package:kushal_portfolio/widgets/footer.dart';
import 'package:kushal_portfolio/widgets/header_desktop.dart';
import 'package:kushal_portfolio/widgets/header_mobile.dart';
import 'package:kushal_portfolio/widgets/main_desktop.dart';
import 'package:kushal_portfolio/widgets/main_mobile.dart';
import 'package:kushal_portfolio/widgets/project_card_widget.dart';
import 'package:kushal_portfolio/widgets/project_section.dart';
import 'package:kushal_portfolio/widgets/site_logo.dart';
import 'package:kushal_portfolio/widgets/skills_desktop.dart';
import 'package:kushal_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screeHeight = screenSize.height;
    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldbg,
          endDrawer: constraints.maxWidth>=kMinDesktopWIdth ? null : MobileDrawer(
            onNavItemTap: (int navIndex){
              scaffoldKey.currentState?.closeEndDrawer();
              scrollToSection(navIndex);
            },
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first,),
                //Main
                if(constraints.maxWidth>=kMinDesktopWIdth)
                  HeaderDesktop(
                    onNavMenuTap: (int navIndex){
                      scrollToSection(navIndex);
                    },
                  )
                else
                HeaderMobile(
                  onLogoTap: (){},
                  onMenuTap: (){
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
                if(constraints.maxWidth>=kMinDesktopWIdth)
                  const MainDesktop()
                else
                  const MainMobile(),
                //Skills
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  color: CustomColor.bgLight1,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("What i can do", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary
                      ),
                      ),
                      SizedBox(height: 50.0,),
                      if(constraints.maxWidth>=kMedDesktopWidth)
                        SkillsDesktop()
                      else
                        SkillsMobile(),
                    ],
                  ),
                ),

                //Projects
                SizedBox(height: 20,),
                ProjectSection(
                  key: navbarKeys[2],
                ),
                SizedBox(height:30),

                CertificationSection(
                  key: navbarKeys[3],
                ),
                SizedBox(height: 30,),
                //Contact
                ContactSection(
                  key: navbarKeys[4],
                ),
                SizedBox(height: 30,),

                //Footer
                Footer(),
              ],
            ),
          ),
        );
      }
    );
  }

  void scrollToSection(int navIndex){
   final key=navbarKeys[navIndex];
   Scrollable.ensureVisible(key.currentContext!,
       duration: const Duration(milliseconds: 500),
       curve: Curves.easeInOut);
  }
}
