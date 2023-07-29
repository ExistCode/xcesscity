import 'package:flutter/material.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';

import '../models/colors.dart';
import '../navigation.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  static const routeName = '/question';
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
      
}

class _QuestionScreenState extends State<QuestionScreen> {
   String ?selectedValue;
  @override
 
  Widget build(BuildContext context) {
    final TextEditingController _controllerName = TextEditingController();
    final TextEditingController _controllerUserName = TextEditingController();
    final TextEditingController _controllerGender = TextEditingController();
    final TextEditingController _controllerAge = TextEditingController();
    final List<String> gender = [
      'male',
      'female',
      'prefer not to disclose',
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.only(                
                top: MediaQuery.of(context).padding.top + 20),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:100),
                Row(
                  children: [
                    SizedBox(width:20),
                    Text(
                      'Tell us about yourself',
                      style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize:25),
                      
                    ),
                  ],
                ),
                SizedBox(height:20),
                Expanded(
                  child: Container(                    
                    padding:EdgeInsets.all(20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: secondary,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        inputField('Name', _controllerName),
                        SizedBox(height:20),
                        inputField('Username', _controllerUserName),
                        SizedBox(height:20),
                        Text("Choose Gender", style:TextStyle(fontSize: 17,color:white,fontWeight: FontWeight.bold)),
                        SizedBox(height:10),
                        Container(            
                          padding:EdgeInsets.symmetric(horizontal:8,vertical: 6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color:white),
                          child: DropdownButton(                            
                            isExpanded: true,
                            hint: Text("Choose Gender", style: TextStyle(color:accentOrange, fontWeight:FontWeight.bold),),        
                            value:selectedValue,
                            items: gender
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(                                     
                                        item,
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: accentOrange,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            onChanged: dropdownCallBack
                        
                          ),
                        ),
                        SizedBox(height:20),
                        inputField('Age', _controllerAge),
                        SizedBox(height:30),
                        Center(child:_submitButton())
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

  Widget inputField(text, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style:TextStyle(fontSize: 17,color:white,fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          cursorColor: accentOrange,
          controller: controller,
          decoration: InputDecoration( 
            filled: true,
            fillColor: white,
            hintText: "Enter ${text} ...",
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: accentOrange.withOpacity(0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(width: 10),
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _submitButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 220,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: accentOrange),
          onPressed: (() =>
              Navigator.of(context).pushReplacementNamed(Navigation.routeName)),
          child: Text(
            "Get Started",
            style:  TextStyle(
                color: white, fontSize : 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  void dropdownCallBack(String ?value){
    if (value is String){
      setState(() {
        selectedValue=value;
      });
    }
  }
}
