

import 'package:flutter/material.dart';
import 'package:flutter_ui_1/ui/body/home.dart';
import 'package:flutter_ui_1/ui/interest/interest.dart';
class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text('Jetnews',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          height: 80,
          color: Colors.red,

        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.grey[850],
          ),
          title: Text('Home'),
          onTap: () =>
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home())),
        ),
        ListTile(
          leading: Icon(
            Icons.account_balance_wallet_outlined,
            color: Colors.grey[850],
          ),
          title: Text('Interest'),
          onTap: ()=>
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Interests())),
        ),
      ],
    );
  }
}