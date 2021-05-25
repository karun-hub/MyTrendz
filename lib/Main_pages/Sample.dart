
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';
import 'package:flutter_apps/Counters/TotalAmt.dart';
import 'package:flutter_apps/Main_pages/Bill.dart';
import 'package:flutter_apps/Main_pages/Delivery.dart';
import 'package:flutter_apps/Main_pages/Payments.dart';


class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

List<String> Items= EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);
int cartItemnumbers = Items.length;
String Carts;

int x=2;

int TotalPrice=0;
String Total;

void DataAdd(List head){

}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.black38),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: (){

          })
        ],

      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [



              StreamBuilder(
                stream: Firestore.instance.collection("items").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("No data");
                  }
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: snapshot.data.documents.map((model) {

                      return My_Cart(
                        ImgPath: model['image'],
                        name: model['name'],
                        mrp: model['mrp'].toString(),
                        discount: model['discount'].toString(),
                        your_price: model['your_price'].toString(),
                        long_description: model['long_description'],
                        status: model['status'],
                      );
                    }).toList(),

                  );
                },
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Payments()));

                  },
                  child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrange[300], width: 8),
                        color: Colors.orange,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Buy All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ))),


            ],
          ),
        ),
      ),
    );
  }
}


class My_Cart extends StatelessWidget {

  const My_Cart(
      {Key key,
        this.ImgPath,
        this.name,
        this.discount,
        this.mrp,
        this.your_price,
        this.long_description,
        this.status})
      : super(key: key);
  final String ImgPath, name;
  final String mrp, discount,  status,long_description;
  // ignore: non_constant_identifier_names
  final String your_price;

  @override
  Widget build(BuildContext context) {
    if(name==null){
      return Container(
        width: 0,height: 0,
      );
    }

      if (Items.any((e) => e.contains(name))) {
print(Items);


        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: Stack(children: [
            GestureDetector(
              onTap: () {

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 180,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  children: [
                    Image.network(
                      ImgPath,
                      width: 160,
                      height: 160,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ListView(children: [
                                Text(
                                  name,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline3
                                      .merge(
                                      TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                ),
                              ])),
                          Row(
                            children: [
                              Text(r"₹"),
                              Text(
                                mrp,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                your_price.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "You have saved ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                discount,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),

        );
      } else {
        return Container(
          width: 0,height: 0,
        );
      }
    }
  }





