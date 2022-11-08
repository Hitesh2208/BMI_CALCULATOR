
import 'package:flutter/material.dart';
import 'package:bmi_calculator/secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),

    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _currentValue=100;
  double counter=50;
  double bmi=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title:
        Center(child: Text("BMI CALCULATOR"),),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Center(
            child: Container(
              height: 200,
              width: 600,
              color: Colors.orange,
              child: Column(
                  children:[

                    Center(child: Text("Height",style: TextStyle(fontSize: 40,fontFamily: 'RobotoMono'),)),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_currentValue.toString(),style: TextStyle(fontSize: 40),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: 250,
                        divisions: 250,
                        label: _currentValue.toString(),
                        onChanged: (value){
                          setState((){
                            _currentValue = value;
                          });
                        },
                      ),
                    )

                  ]//children
              ),



            ),
          ),

          Center(
            child: Container(
              height: 200,
              width: 600,
              color: Colors.grey,

              child: Column(
                children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Weight",style: TextStyle(fontSize: 40, fontStyle:FontStyle.italic),),
                  )),

                  Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(counter.toString(),style: TextStyle(fontSize: 40),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Column(
                            children: [
                              FloatingActionButton(
                                  child:
                                  Center(child: Icon(Icons.remove)),
                                  backgroundColor: Colors.lightBlue,
                                  foregroundColor:Colors.black,

                                  onPressed: (){
                                    setState(() {

                                    });
                                    counter--;

                                  }
                              ),
                            ],
                          ),
                          FloatingActionButton(
                              child: Center(child: Icon(Icons.add)),
                              backgroundColor: Colors.blue,
                              foregroundColor:Colors.black,
                              onPressed:(){
                                setState(() {

                                });
                                counter++;
                              }
                          ),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
          Container(
            height: 200,
            width: 600,
            color: Colors.deepPurpleAccent,

            child: Column(
              children: [
                 Text("Calculate BMI",style: TextStyle(fontSize: 40, fontFamily:"arial"),),
                // Text(bmi.round().toString(),style: TextStyle(fontSize: 50),),
                FloatingActionButton(
                    child: Center(child: Icon(Icons.control_point_sharp)),
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,

                    onPressed: (){
                      setState(() {

                      });
                      bmi=(counter*10000)/(_currentValue*_currentValue);
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPage(bmi:bmi)));

                    }
                ),
              ],
            ),

          ),
        ],

      ),


    );
  }
}