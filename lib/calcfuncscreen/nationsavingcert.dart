//import 'package:firstpro/screens/note_list.dart';
//import 'package:firstpro/second%20screen.dart';
//import 'package:firstpro/secondscreen.dart';
//import 'package:firstpro/second%20screen.dart';
//import 'package:firstpro/second%20screen.dart';
//import 'package:firstpro/utils/database_helper.dart';
//import 'dart:js';

//import 'dart:html';

import 'package:CWCFlutter/food_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:firstpro/models/note.dart';

//import 'package:firstpro/screens/note_detail.dart';
/*
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: Center(child: Text("Second Screen"),),
      )
    );
  }
}
*/

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import '../food_list.dart';

//import 'models/note.dart';
//import 'second screen.dart';
//import 'second screen.dart';

class nationalsaving extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
    throw UnimplementedError();
  }
}

class _SIFormState extends State<nationalsaving> {
  //DatabaseHelper helper = DatabaseHelper();

  String appBarTitle, result;

  //Note note;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int currentIndex;
 static var type="simple interest";
   var displayResult=" ";

 // String  displayResults=displayResult;


  changePage(int index) {
    setState(() {
      currentIndex = index;
    });

  }
/*
  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodForm(
              nameHolder : "we have calculated",
              title : type,
              description : displayResult,
            ))
    );
  }*/

  var _formKey = GlobalKey<FormState>();

  var _currencies = ['rupees', 'Dollars', 'pounds'];
  final _minimumpadding = 5.0;
  var _currentItemSelected = '';
  //static var result="";
  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
    currentIndex = 0;
    var displayResults=displayResult;
    resultController = new TextEditingController(text:displayResult);
  }
/**/

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  TextEditingController resultController;// =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("simple interest calculator"),
      ),
      body: Container(
        
        decoration: BoxDecoration(
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  "images/hellowel.jfif")
          ),
        ),
        
        child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(_minimumpadding * 2.0),
              child: ListView(
                children: <Widget>[
                  getImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumpadding, bottom: _minimumpadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: principalController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please enter principal amount';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'prinipal',
                            hintText: 'Enter principal amount eg 20000',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent, fontSize: 16.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumpadding, bottom: _minimumpadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: roiController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please enter rate of interest';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Rate of interest',
                            hintText: 'in percent',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent, fontSize: 16.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumpadding, bottom: _minimumpadding),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: termController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'please enter time';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Term',
                                hintText: 'in year',
                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 16.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),
                          Container(
                            width: _minimumpadding * 5,
                          ),
                          Expanded(
                              child: DropdownButton<String>(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _currentItemSelected,
                            onChanged: (String newValueSelected) {
                              _onDropDownItemSelected(newValueSelected);
                            },
                          ))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: _minimumpadding, top: _minimumpadding),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              color: Theme.of(context).accentColor,
                              textColor: Theme.of(context).primaryColorDark,
                              child: Text(
                                'calculate',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    this.displayResult = _calculateTotalReturns();
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 5,
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: Theme.of(context).accentColor,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'reset',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                _reset();
                               // _showAlertDialog("want to save?",
                                 //   "before reset ,if you want to save it then please copy the ans and past it in description field  by pressing save button!!");
                                //_save(context,NoteList[position]);
                              },
                            ),
                          )
                        ],
                      )),
                  Container(
                    height: 5,
                  ),

                  Container(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.all(_minimumpadding * 2),
                    child:  SelectableText(

                      this.displayResult,
                      style: textStyle,
                      
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                          showAlertDialog(context);
                          },
                          color: Color(0xffFF1744),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('help ?'),
                        ),
                      ),
                      Container(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodForm()));
                          },
                          color: Color(0xffFF1744),
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('save ?'),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FoodList()));
        },
        child: Icon(Icons.add_box,color: Colors.black,),
        backgroundColor: Colors.orange,
      ),

    );
  } //throw UnimplementedError();

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/simple.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumpadding * 10.0),
    );
  }

  void _onDropDownItemSelected(String newValuSelected) {
    setState(() {
      this._currentItemSelected = newValuSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    result =
        'after\n $term years \n,your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text = " ";
    roiController.text = " ";
    termController.text = " ";
    displayResult = "";
    _currentItemSelected = _currencies[0];
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('displayResult', displayResult));
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("how to save"),
    content: Text("long press on answer given above and press select all and paste it on another side description field by pressing save button!!!."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
