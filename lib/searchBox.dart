import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  // const SearchBoxWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(30.0)),
                width: 300,
                child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none) ),),
              ),
              FlatButton(
                child: Text("Search"),onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}