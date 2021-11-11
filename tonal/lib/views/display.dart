/**
 * First screen that gets displayed when application is launched
 */

import 'package:flutter/material.dart';
import 'package:tonal/views/EditScreen.dart';
import 'package:tonal/data_model/model.dart';
import 'package:tonal/reusable_widget/styles.dart';

class Display extends StatefulWidget {
  Display({Key? key}) : super(key: key);

  @override
  DisplayState createState() => DisplayState();
}

class DisplayState extends State<Display> {
  String res_label = 'Upper Body';
  String res_weight = '45';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Widget Display'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              Model? result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditScreen()));
              if(result == null){
                return;
              }
              res_label = result.getLabel;
              res_weight = result.getWeight.toString();
            } catch (error) {
              print("Error occurred -> $error");
            }
            setState(() {});
          },
          backgroundColor: Colors.blue,
          tooltip: 'Edit options',
          child: Icon(Icons.edit),
        ),
        body: Container(
          child: Center(
            child: Style( //calling the widget to resuse
              label: res_label,
              weight: res_weight,
            ),
          ),
        ));
  }
}
