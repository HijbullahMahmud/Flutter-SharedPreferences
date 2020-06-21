import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Text("$counter", style: TextStyle(fontSize: 22),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text("-", style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: (){
                  decrease();
                },
              ),
              SizedBox(width: 5,),
              RaisedButton(
                color: Colors.blue,
                child: Text("+", style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: (){
                  increase();
                },
              )
            ],
          )
        ],
      )
      );
  }

  increase() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState((){
      this.counter++;
      preferences.setInt('counter', counter);
    });

  }

  decrease() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      this.counter--;
      preferences.setInt('counter', this.counter);
    });
  }

  init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int value = (preferences.getInt('counter') ?? 0);
    setState(() {
      this.counter = value;
    });
  }
}
