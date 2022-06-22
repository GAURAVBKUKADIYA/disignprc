import 'package:flutter/material.dart';
class StackAndPositionedDemo extends StatefulWidget {
  @override
  _StackAndPositionedDemoState createState() => _StackAndPositionedDemoState();
}

class _StackAndPositionedDemoState extends State<StackAndPositionedDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
        child: Container(
          child:Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("img/img.jpg",fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
                        SizedBox(width: 20,),
                        Text("TravelOption",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),


          Stack(
            children: <Widget>[
              Positioned(
                top: 30,
                left: 30,
                height:250,
                width: 250,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.green[300],
                  child: Container(


                    ),
                  ),
                ),
              ]),

            ],
          )
        )

      ),
      );
  }
}