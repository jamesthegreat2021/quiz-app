import 'package:flutter/material.dart';


void main () {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final questionList = [
    {
      'questionText' : 'What is your favorite color?',
      'answer' : [
        {'text' : 'Black'},
        {'text': 'Red'},
        {'text': 'blue'}
      ]
    },

    {
      'questionText' : 'What is your favorite animal? ',

      'answer': [
      {'text': 'rabbit'},
      {'text': 'kangaroo'},
      {'text': 'dog'}

      ]
    }
  ];

var questionIndex = 0; 

  void answerQuestions (){
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionList.length);
    print(questionIndex);
    if (questionIndex< questionList.length)
    {
      print('we have more questions');
    }
    else print('no more questions');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quiz application',


      home: Scaffold(
        
        appBar: AppBar(
          title: 
          Text('quiz application'),),
        //this stands for the body of the scaffold
        body: questionIndex<questionList.length ? Column(children: [
          
          Container(

            child: Text(questionList[questionIndex]['questionText'] as String
            ,
            textAlign: TextAlign.center,),


            
          ),
          ...(questionList[questionIndex]['answer'] as List<Map<String, dynamic>>).map((value) {

            return Container(
              child: RaisedButton(
                child: Text(value['text']),
                onPressed: () => answerQuestions(),)
            );
          }).toList()

        
        ],)
        : Center(
          child: Text('hellow this is james'),
        )
        ),

    );
  }
}