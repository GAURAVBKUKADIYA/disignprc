import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarsulSlider_demo extends StatefulWidget {
  List<String> imgList;

  CarsulSlider_demo({this.imgList});
  @override
  State<CarsulSlider_demo> createState() => _CarsulSlider_demoState();
}

class _CarsulSlider_demoState extends State<CarsulSlider_demo> {

  List items = [
    'https://thumbs.dreamstime.com/b/love-birds-colorful-background-61784122.jpg',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxRdld8vauUUwUShzG94eNfH6MsOJbWDY6w&usqp=CAU',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-pet-birds-lead-1572839035.jpg?crop=0.666xw:1.00xh;0,0&resize=640:*',
  ];
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  CarouselSlider(
                    items: items
                        .map((image) => Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ))
                        .toList(),
                    options: CarouselOptions(
                      onPageChanged: (index,reason){
                        setState(() {
                          activeIndex=index;
                        });
                      },
                      height: 500,
                      viewportFraction: 1,
                      autoPlay: true,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: items.length,
                        effect:  WormEffect()
                    ),
                  )
                ],

              ),

              //use animated dots indicator
         

            ]
        ),
      ),
    );
  }
}

