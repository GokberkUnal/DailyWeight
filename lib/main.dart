import 'package:dailyweight/Widgets/new_weight.dart';
import 'package:dailyweight/Widgets/weight_list.dart';
import 'package:dailyweight/Widgets/weights_chart.dart';
import 'package:flutter/material.dart';
import 'Models/weight.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Weight> _userWeights = [
    Weight(
      id:'w1',
      weight: 105.5,
      date: DateTime.now().subtract(Duration(days: 1)),

    ),
    
    Weight(
      id:'w1',
      weight: 100.5,
      date: DateTime.now(),
    ),
    Weight(
      id:'w1',
      weight: 80.5,
      date: DateTime.now().subtract(Duration(days: -1))

    ),
    
  ];

  void _addnewWeight(double weight){
    final newW=Weight(weight:weight,date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
      _userWeights.add(newW);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap:(){},
        child:NewWeight(_addnewWeight),
        behavior:HitTestBehavior.opaque);
    },);
  }

  @override
  Widget build(BuildContext context) {
    
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Weight",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.03),),
        actions: <Widget>[
         /* IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))*/
        ],
        backgroundColor: Colors.amber[800],
      ),
      body:Column(children: <Widget>[
        
        WeightChart(data: _userWeights,),
        SizedBox(width: 0.02*MediaQuery.of(context).size.height,),
        WeightList(_userWeights),
      ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()=>_startAddNewTransaction(context),child: Icon(Icons.add),backgroundColor: Colors.orange[900],),
      );
     
    
  }
}
