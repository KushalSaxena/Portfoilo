import 'package:flutter/cupertino.dart';
import 'package:kushal_portfolio/widgets/project_card_widget.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';

class CertificationSection extends StatelessWidget {
  const CertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      color: CustomColor.bgLight1,
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          const Text("Certifications", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary
          ),
          ),
          SizedBox(height: 50,),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 900
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for(int i=0; i<certifications.length; i++)
                  ProjectCardWidget(project: certifications[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
