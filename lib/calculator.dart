import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget{
  @override
  _CalculatorState createState() => _CalculatorState();

  
}

class _CalculatorState extends State<Calculator> {
  String keyCode="";
  
  Expression exp;
  double output=0;

  void btnClicked(String btnText){
    if(keyCode.length<12){
      
    }
    setState(() {
      if(btnText=="AC"){
        keyCode = "";
      }
      if(keyCode.length<12){
        switch(btnText){
        case "1":
          keyCode += "1";
          break;
        case "2":
          keyCode += "2";
          break;
        case "3":
          keyCode += "3";
          break;
        case "4":
          keyCode += "4";
          break;
        case "5":
          keyCode += "5";
          break;
        case "6":
          keyCode += "6";
          break;
        case "7":
          keyCode += "7";
          break;
        case "8":
          keyCode += "8";
          break;
        case "9":
          keyCode += "9";
          break;
        case "+":
          keyCode += "+";
          break;
        case "=":
          Parser p = new Parser();
          exp = p.parse(keyCode);

          ContextModel cm = new ContextModel();

          output = exp.evaluate(EvaluationType.REAL, cm);
          keyCode = "";
          break;
        case "%":
          keyCode += "%";
          break;
        case "÷":
          keyCode += "/";
          break;
        case "-":
          keyCode += "-";
          break;
        case "x":
          keyCode += "*";
          break;
      } 
      }
      
    });
  
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color:  _getColorFromHex("E5F4F5"),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("$keyCode",style: TextStyle(fontSize: 22,color: _getColorFromHex("353131"))),
                      margin: EdgeInsets.only(left: 20,top: 48),
                      alignment: Alignment.topLeft ,),
                  Container(
                    child: Text("$output",style: TextStyle(fontSize: 42,color: _getColorFromHex("4DB4BA"))),
                      margin: EdgeInsets.only(right: 20,top: 52),
                      alignment: Alignment.bottomRight ,),

                    
                    
                ],
              ),
            )
          ),
          Expanded(
            flex: 6,
            child: Container(child: input(),padding: EdgeInsets.only(bottom: 15),alignment: Alignment.center,)
            ),
        ],
      )
    );
  }

  Widget custButNum(String name,String hex){
    return Container(    
      padding: EdgeInsets.only(bottom: 12),
        child: RaisedButton(
          elevation: 0,
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
          onPressed: (){
            btnClicked(name);
          },
          child: Text("$name",style: TextStyle(fontSize: 25)),
          color: _getColorFromHex(hex),
        ),
      );
  }
  Widget custButNumEqual(String name,String hex){
    return Container(
      margin: EdgeInsets.only(left: 19.5,right: 20),   
        padding: EdgeInsets.only(bottom: 12),
        child: RaisedButton(
          elevation: 0,
          padding: EdgeInsets.only(right: 65,top:15,left:65,bottom: 15),
          shape: StadiumBorder(),
          onPressed: (){
            btnClicked(name);
          },
          child: Text("$name",style: TextStyle(fontSize: 25)),
          color: _getColorFromHex(hex),
        ),
      );
  }
  Widget custButNumAc(String name,String hex,String textColor){
    return Container(
        padding: EdgeInsets.only(bottom: 12),
        child: RaisedButton(
          elevation: 0,
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
          onPressed: (){
            btnClicked(name);
          },
          textColor: _getColorFromHex(textColor),
          child: Text("$name",style: TextStyle(fontSize: 25)),
          color: _getColorFromHex(hex),
        ),
      );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse('FF' + hexColor, radix: 16));
  }
      
  Widget input(){
    return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Row(
                  children: <Widget>[
                    custButNumAc("AC","fff","4DB4BA"),
                    custButNumAc("C","fff","4DB4BA"),
                    custButNumAc("%","fff","4DB4BA"),
                    custButNumAc("÷","fff","4DB4BA"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    custButNum("7","F5F4F5"),
                    custButNum("8","F5F4F5"),
                    custButNum("9","F5F4F5"),
                    custButNumAc("x","fff","4DB4BA"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    custButNum("4","F5F4F5"),
                    custButNum("5","F5F4F5"),
                    custButNum("6","F5F4F5"),
                    custButNumAc("-","fff","4DB4BA"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    custButNum("1","F5F4F5"),
                    custButNum("2","F5F4F5"),
                    custButNum("3","F5F4F5"),
                    custButNumAc("+","fff","4DB4BA"),
                  ],
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    custButNum("0","F5F4F5"),
                    custButNum(".","F5F4F5"),
                    custButNumEqual("=","E5F4F5"),
                  ],
                ),
                ],
              );
  }

}



