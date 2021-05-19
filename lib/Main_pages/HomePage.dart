import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Theme/CustomAppbar.dart';
import 'package:flutter_apps/Theme/TextTheme.dart';
import 'package:flutter_apps/Main_pages/login.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  void OnpressedEvent(BuildContext context) {
    Navigator.of(context).pushNamed('/Showalldetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,color: Colors.purple,),
            title: new Text('Home',style: SmallGery,),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart_outlined,color: Colors.purple,),
            title: new Text('Cart',style: SmallGery,),
          ),
          BottomNavigationBarItem(
            
              icon: Icon(Icons.person,color: Colors.purple,),
              title: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()));
                },
                  child: Text('Profile',style: SmallGery,))
              
          )
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(9, 9, 9, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            Text(
              "Filter",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 1,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppbar(),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(0),
                ),
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("Trendings..",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              OfferZone(
                                ImgPath: "assets/image1.jpg",
                              ),
                              OfferZone(
                                ImgPath: "assets/image2.jpg",
                              ),
                              OfferZone(
                                ImgPath: "assets/image1.jpg",
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SafeArea(
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RoundBox(ImgPath: "assets/image3.jpeg", matter: "Menswear"),
                    RoundBox(ImgPath: "assets/image4.jpg", matter: "Kidswear"),
                    RoundBox(
                        ImgPath: "assets/image5.jpeg", matter: "Ladieswear"),
                    RoundBox(ImgPath: "assets/image6.jpg", matter: "Shoes"),
                    RoundBox(ImgPath: "assets/image7.jpg", matter: "Handbags"),
                    RoundBox(
                        ImgPath: "assets/image8.jpg", matter: "Accesories"),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(color: Colors.black12),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                     Row(
                        children: [
                          GestureDetector(
                            onTap: () => OnpressedEvent(context),
                          child:Product(ImgPath: "assets/image4.jpg"),),

                          Product(ImgPath: "assets/image6.jpg"),
                        ],
                      ),


                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class RoundBox extends StatelessWidget {
  final String ImgPath;
  final String matter;
  const RoundBox({Key key, this.ImgPath, this.matter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(image: AssetImage(ImgPath))),
            ),
            Text(
              matter,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferZone extends StatelessWidget {
  final String ImgPath;
  const OfferZone({Key key, this.ImgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(ImgPath),
      ),
    );
  }
}

class GreyBox extends StatelessWidget {
  final String title;

  const GreyBox({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black12,
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key key, this.ImgPath}) : super(key: key);
  final String ImgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 195,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage(ImgPath))),
            ),
          ],
        ),
        Positioned(
            top: 10,
            right: 20,
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.favorite_border)))
      ]),
    );
  }
}
