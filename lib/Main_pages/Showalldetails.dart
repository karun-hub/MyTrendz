import 'package:flutter/material.dart';

class ShowallDetails extends StatelessWidget {
  //final  String Img = Product.ImgPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
      children: [
          Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/image4.jpg'),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [

                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child:Text("Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              )

            ],
          )
      ],
    ),
        ));
  }
}
