import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});

  double bmi;



  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body:
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                child: Center(
                    child:Container(
                      height: 400,
                      width: 600,
                      color: Colors.deepPurpleAccent,
                      child: Text("Re Calculate"),
                    )
                ),


                onPressed: (){
                  Navigator.pop(context);
                  setState(() {

                  });
                // bmi=(counter*10000)/(_currentValue*_currentValue);
                }
              ),
              Text("Your BMI is ${widget.bmi.round()}",style: TextStyle(fontSize: 50),),




              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )],
          ),
      )
    );
  }
}
