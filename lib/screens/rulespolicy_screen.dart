import 'package:flutter/material.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import '../models/colors.dart' as custom_colors;

class rulesPolicy extends StatelessWidget {
  static const routeName = '/rulespolicy';
  const rulesPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_colors.accentOrange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: Container(
          child: Row(
            children: [
              Icon(
                Icons.flag,
                color: Colors.red,
              ),
              Text('Rules & Policy')
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Text(
            'What to Report: There are many types of crimes. This policy is focused on “Clery Act crimes,” which are: Murder and manslaughter Sexual violence and other sex offenses, forcible or non-forcible, but not including sexual harassment or indecent exposure (sexual violence must be reported to the Title IX Coordinator) Domestic violence and dating violence (if the alleged, suspected, or reported victim is a W&M student, the incident likely also needs to be reported to the Title IX Coordinator/Dean of Students; for further information, see the Policy on Discrimination, Harassment, and Retaliation or related guidance documents) Stalking (if the alleged, suspected, or reported victim is a W&M student, the stalking incident likely also needs to be reported to the Title IX Coordinator/Dean of Students; for further information, see the Policy on Discrimination, Harassment, and Retaliation or related guidance documents) Robbery and burglary aggravated assault motor vehicle theft – including theft of motorized scooters, golf carts, motorized wheelchairs and the like arson so-called “hate crimes” – (i) any other crime involving bodily injury, or (ii) larceny-theft, simple assault, intimidation, and destruction/ damage/ vandalism of property, when motivated by the perpetrator’s bias. Bias is defined as a negative opinion or attitude toward a group of persons based on their race, gender or gender identity, religion, sexual orientation, ethnicity/national origin, or disability.',
            style: TextStyle(
              color: custom_colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
