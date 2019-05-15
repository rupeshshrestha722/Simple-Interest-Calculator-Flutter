import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  double si;
  String value;

  final TextEditingController _p = new TextEditingController();
  final TextEditingController _t = new TextEditingController();
  final TextEditingController _r = new TextEditingController();

  void _calculateInterest() {
    setState(() {
      if (_p.text.isNotEmpty && _t.text.isNotEmpty && _r.text.isNotEmpty) {
        double _prin = double.parse(_p.text);
        double _time = double.parse(_t.text);
        double _rate = double.parse(_r.text);
        si = _prin * _time * _rate / 100;
        value = si.toString();
      } else {
        value = "invalid. Please fill all forms";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Simple Interest Calculator"),
        backgroundColor: Colors.greenAccent.shade400,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
           onPressed: ()=>debugPrint("Search Button is clicked"),
          )
        ],
      ),
      body: new Container(
        padding: EdgeInsets.all(14.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                "Simple Interest Calculator",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              new TextField(
                controller: _p,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "50,000",
                    labelText: "Enter Principal",
                    icon: Icon(Icons.add)),
              ),
              new TextField(
                controller: _t,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "13.2",
                    labelText: "Enter Time",
                    icon: Icon(Icons.add)),
              ),
              new TextField(
                controller: _r,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "3.2",
                    labelText: "Enter Rate",
                    icon: Icon(Icons.add)),
              ),
              new RaisedButton(
                onPressed: _calculateInterest,
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                'The simple interest is $value.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: new Text("Home")
          ),
           new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: new Text("Search")
          ),
           new BottomNavigationBarItem(
            icon: Icon(Icons.print),
            title: new Text("Print")
          ),
        ],
        
      ),
    );
  }
}
