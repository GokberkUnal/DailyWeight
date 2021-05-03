
import 'package:dailyweight/Models/weight.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightList extends StatefulWidget {
  final List<Weight> weights;
  WeightList(this.weights);

  @override
  _WeightListState createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> {

  final List<Weight> data=[];

  @override
  Widget build(BuildContext context) {
    

    
     
    return Container(
      
     
      height: 0.466*MediaQuery.of(context).size.height,
      child: ListView.builder(itemBuilder:(ctx,i)
      {
        
         
       return Dismissible(child:Card(
         
              margin: EdgeInsets.all(10.9),
              elevation: 5,
              shape: Border(),
              
              child:Container(
                height: 0.066*MediaQuery.of(context).size.height,
                child: Row(children: <Widget>[
                  Container(
                    child: Text(
                      widget.weights[i].weight.toString(),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 4, color: Colors.orange[900])),
                  ),
                  SizedBox(width: 0.25*MediaQuery.of(context).size.width),
                  Container(
                    child: Text(
                      DateFormat.yMMMd().format(widget.weights[i].date),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ]),
              ),
              
        ),key:UniqueKey(),background:Container(alignment:Alignment.centerRight,
        color: Colors.red,child: Icon(Icons.delete),) ,onDismissed: (direction){
          setState(() {
            widget.weights.removeAt(i);
          });
          
          
         
         
       }); 
       
      }, itemCount:widget.weights.length));
  }
}
