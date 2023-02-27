// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hive Local DB',
        ),
      ),
      body: ListView(
        children: [
          buildTextFieldContainer('Name'),
          buildTextFieldContainer(
            'Id',
            isNum: true,
          ),
          buildTextFieldContainer(
            'Age',
            isNum: true,
          ),
          buildTextFieldContainer('Degree'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Upload',
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextFieldContainer(
    String label, {
    bool isNum = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 10,
      ),
      child: TextField(
        keyboardType: isNum ? TextInputType.number : TextInputType.name,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
