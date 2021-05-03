import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewWeight extends StatelessWidget {

  final Function addW;
    final weightController=TextEditingController();

   NewWeight(this.addW);



  @override
  Widget build(BuildContext context) {
    


    return Card(
      child:Container(
        height:0.5*MediaQuery.of(context).size.height ,
        child:Column(
          children: <Widget>[
        TextField(
          decoration:InputDecoration(labelText:'Weight',fillColor: Colors.black,focusColor: Colors.black,hoverColor: Colors.black,
          suffixStyle:TextStyle(color :Colors.black),
           ),
          controller: weightController,
          keyboardType: TextInputType.number,
          
          
          
          ),
        
        Align(),
        TextButton(child: Text('Add Weight'),style:TextButton.styleFrom(
          primary:Colors.white,
          backgroundColor:Colors.orange[900],
          onSurface:Colors.orange[900],
        ),
        onPressed: (){addW(double.parse(weightController.text));},
        )


     
     
        ],
        ),
        ),
      );
   
  }
}