import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quzzler/questionsList.dart';

QuestionBank questionTool= QuestionBank();
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String tex= questionTool.checkTest[0].qus;
  int count=0;
  List <Icon> displayIcons=[];
  TextButton button(String texx, Color col) {
    return TextButton(
      onPressed: () {
        setState(() {
            if((questionTool.checkTest[count].ans== true && texx =='YES') ||
                (questionTool.checkTest[count].ans== false && texx =='NO')) {
              displayIcons.add(checkIcon(Icons.check, Colors.green));
            }else{
              displayIcons.add(checkIcon(Icons.close, Colors.red));
            }
            count=Random().nextInt(questionTool.checkTest.length);
          tex = questionTool.checkTest[count].qus;
        });
      },
      child: Container(
        height: 60,
        color: col,
        child: Center(
          child: Text(
            texx,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200,bottom: 250),
              child: Center(
                child: Text(
                  tex,
                  style: TextStyle(color: Colors.white, fontSize: 30,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                button('YES', Colors.green),
                SizedBox(
                  height: 10,
                ),
                button('NO', Colors.red),
              ],
            ),
            SingleChildScrollView(
             scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i = 0; i<displayIcons.length;i++) displayIcons[i]

                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

Icon checkIcon(IconData ic, Color col){
  return Icon(
    ic,
    color: col,
  );
}




