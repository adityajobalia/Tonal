/**
 * Edit screen to edit label and weight
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/data_model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  //TextFormField controller
  final _labelText = TextEditingController();
  final _weightText = TextEditingController();

  //validators
  bool _labelValidation = false;
  bool _weightValidation = false;

  bool isLoading = true;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//Get initial data
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() async {
    SharedPreferences prefs = await _prefs;
    if (!prefs.containsKey('label') && !prefs.containsKey('weight')) {
      prefs.setString('label', 'Upper Body');
      prefs.setInt('weight', 45);
    }
    _labelText.text = prefs.getString('label').toString();
    _weightText.text = prefs.getInt('weight').toString();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit options'),
            ),
            body: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  /**
             * TextField label
             */
                  TextFormField(
                    controller: _labelText,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter label',
                        hintText: 'Enter label here',
                        errorText:
                            _labelValidation ? 'Label empty or invalid' : null),
                  ),

                  /**
             * TextField Weight 
             */
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _weightText,
                    keyboardType: TextInputType.number,
                    enableInteractiveSelection: false,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Weight (MAX 350)',
                        hintText: 'Enter weight here',
                        errorText: _weightValidation
                            ? 'Value empty or invalid'
                            : null),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  /**
             * Submit button
             */
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_weightText.text.isNotEmpty) {
                          int.parse(_weightText.text) >= 350 ||
                                  int.parse(_weightText.text) == 0
                              ? _weightValidation = true
                              : _weightValidation = false;
                        } else if (_weightText.text.isEmpty) {
                          _weightValidation = true;
                        }

                        _labelText.text.trim().isEmpty
                            ? _labelValidation = true
                            : _labelValidation = false;

                        if (!_labelValidation && !_weightValidation) {
                          Model model = Model(
                              _labelText.text, int.parse(_weightText.text));
                          SharedPreferences prefs = await _prefs;
                          prefs.setString('label', model.getLabel);
                          prefs.setInt('weight', model.getWeight);
                          Navigator.pop(context, model);
                        }
                        setState(() {});
                      },
                      child: Text('Update'),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
