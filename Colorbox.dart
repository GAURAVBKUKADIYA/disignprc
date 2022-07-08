import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: myapp(),));
}
class myapp extends StatefulWidget {


  @override
  State<myapp> createState() => _myappState();
}

List<String>bg=[

];

class _myappState extends State<myapp> {
  List<Color> l = [
    Colors.red,
    Colors.green,
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.tealAccent,
    Colors.yellow,
    Colors.orange,
    Colors.deepPurple,
    Colors.brown,
    Colors.cyan,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.grey,
    Colors.orangeAccent,
    Colors.amber,
    Colors.amberAccent,
    Colors.blueAccent,
  ];
  Color bgcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              color:bgcolor,
            ),
            Container(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      builder: (context) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.all(10),
                          child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: l.length,
                              itemBuilder: (context, index) {
                                return GridTile(
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                          bgcolor=l[index];
                                        setState(() {});
                                      },
                                    ),
                                    color: l[index],
                                  ),
                                );
                              },
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1,
                                mainAxisSpacing: 10,
                              )),
                        );
                      },
                      context: context,
                    );
                  },
                  child: Text(
                    "Background",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
