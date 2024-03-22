import 'package:flutter/material.dart';

Future<void> customSucessDialog(BuildContext context,{required String title,required String content,}) async {

  return showDialog<void>(
    context: context,

    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.green,
        title:  Text(title,style: TextStyle(color: Colors.white),),
        content: Text(content,style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          TextButton(
            child: const Text('close',style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
