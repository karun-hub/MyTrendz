import 'package:flutter/material.dart';

class SearchBoxDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      InkWell(
        onTap: () {
          Route route = MaterialPageRoute(builder: (c) => SearchProduct());
          Navigator.push(context, route);
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.grey),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text("Search Here"),
              ),
            ],
          ),
        ),
      );

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  SearchProduct() {}
}
