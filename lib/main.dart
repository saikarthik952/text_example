import 'package:flutter/material.dart';
void main() {
  runApp(new MaterialApp(
      title: 'Tip Calculator',
      home: new TipCalculator()
  ));
}

// ignore: must_be_immutable
class TipCalculator extends StatelessWidget {
  double billAmount = 0.0;
  double tipPercentage = 0.0;
  double calculatedTip=0.0;
  double total=0.0;

  @override
  Widget build(BuildContext context)
  {
    TextField billAmountField = new TextField(
        keyboardType: TextInputType.number,
decoration: new InputDecoration(

    hintText: ("Bill amount(\$)")
),


        onChanged: (String value) {
          try {
            billAmount = double.parse(value.toString());
          } catch (exception) {
            billAmount = 0.0;
          }
        }
    );
    TextField tipPercentageField = new TextField(
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            labelText: "Tip %",

            hintText: "15"
        ),

        onChanged: (String value) {
          try {
            tipPercentage = double.parse(value.toString());
          } catch (exception) {
            tipPercentage = 0.0;
          }
        }
    );
    // Create button
    RaisedButton calculateButton = new RaisedButton(
      highlightElevation: 3.0,


        child: new Text("Calculate"),

       padding: new EdgeInsets.all(16.0) ,
        onPressed: () {
          // More code goes here
           calculatedTip = billAmount * tipPercentage / 100.0;
           total = billAmount + calculatedTip;
           // Generate dialog
           AlertDialog dialog = new AlertDialog(
               content: new Text("Tip: \$$calculatedTip \n"
                   "Total: \$$total")
           );

// Show dialog
          showDialog(context: context, child: dialog);
        }
    );



    Container container = new Container(
        margin: const EdgeInsets.all(15.0),
        height: 300.0,

        child: new Column(

          textDirection: TextDirection.ltr,
            mainAxisSize: MainAxisSize.min

            ,

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ billAmountField,
            tipPercentageField,

            calculateButton ]
        )
    );
    AppBar appBar = new AppBar(title: new Text("Tip Calculator"));
    Scaffold scaffold = new Scaffold(appBar: appBar,
        body: container
    );
    return scaffold;
  }



}