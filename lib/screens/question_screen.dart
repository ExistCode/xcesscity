import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart';
import '../navigation.dart';
import '../providers/user_provider.dart';
import '../widgets/input_field.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  static const routeName = '/question';
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();

  Future<void> _updateUserName(String userName, BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false)
        .setUserName(userName);
  }

  Future<void> _updateName(String name, BuildContext context) async {
    Provider.of<UserProvider>(context, listen: false).setName(name);
  }

  Future<void> _updateGender(String gender, BuildContext context) async {
    Provider.of<UserProvider>(context, listen: false).setGender(gender);
  }

  Future<void> _updateAge(String age, BuildContext context) async {
    Provider.of<UserProvider>(context, listen: false).setAge(age);
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? selectedValue;
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final List<String> gender = [
    'male',
    'female',
    'prefer not to disclose',
  ];

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerUserName.dispose();
    _controllerGender.dispose();
    _controllerAge.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      'Tell us about yourself',
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: secondary,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        inputField(text: 'Name', controller: _controllerName),
                        const SizedBox(height: 20),
                        inputField(
                            text: 'Username', controller: _controllerUserName),
                        const SizedBox(height: 20),
                        Text("Choose Gender",
                            style: TextStyle(
                                fontSize: 17,
                                color: white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white),
                          child: DropdownButton(
                              isExpanded: true,
                              hint: Text(
                                "Choose Gender",
                                style: TextStyle(
                                    color: accentOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: selectedValue,
                              items: gender
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: accentOrange,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              onChanged: dropdownCallBack),
                        ),
                        const SizedBox(height: 20),
                        inputField(text: 'Age', controller: _controllerAge),
                        const SizedBox(height: 30),
                        Center(child: _submitButton())
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

  Widget _submitButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 220,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: accentOrange),
          onPressed: (() {
            widget._updateName(_controllerName.text, context);
            widget._updateUserName(_controllerUserName.text, context);
            widget._updateAge(_controllerAge.text, context);
            widget._updateGender(selectedValue!, context);

            Navigator.of(context).pushNamed(Navigation.routeName);
          }),
          child: Text(
            "Get Started",
            style: TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void dropdownCallBack(String? value) {
    if (value is String) {
      setState(() {
        selectedValue = value;
      });
    }
  }
}
