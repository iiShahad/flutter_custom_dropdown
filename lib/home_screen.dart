import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_dropdown/flutter_custom_dropdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 15, right: 15),
        child: Column(
          children: [
            FlutterCustomDropdown(
                selectedItem: (selectedValue) =>
                    print(selectedValue)) //here we receive the selected item
          ],
        ),
      ),
    );
  }
}
