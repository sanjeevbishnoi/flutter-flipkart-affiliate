import 'package:flutter/material.dart';
import 'package:example/fk/deals_of_day.dart';
import 'package:example/fk/offers.dart';

class FKCard extends StatelessWidget {
  const FKCard({
    Key key,
    @required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              "Deals of the Day",
              style: TextStyle(
                  fontSize: 16.00,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.amber : Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "From Flipkart",
              style: TextStyle(
                  fontSize: 12.00,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
          DOD(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              "Offers",
              style: TextStyle(
                  fontSize: 16.00,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.amber : Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "From Flipkart",
              style: TextStyle(
                  fontSize: 12.00,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
          Offers(),
        ],
      ),
    );
  }
}
