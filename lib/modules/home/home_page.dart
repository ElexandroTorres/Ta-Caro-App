import 'package:flutter/material.dart';
import 'package:ta_caro/shared/models/user_model.dart';

class HomePage extends StatelessWidget {
  //final UserModel user;

  const HomePage({
    Key? key,
    /*required this.user*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, bottom: 14),
            child: Container(
              height: 76,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.green,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
