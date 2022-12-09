import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pr5/main.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Screen extends StatelessWidget{
  const Screen({super.key, required this.arguments});

  final Map<String, dynamic> arguments;

  @override
  Widget build(BuildContext context){
    return Scaffold( 
     body: Row(mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Column (mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(arguments["text"]), 
          ElevatedButton(onPressed: () {
            SharedPreferences.getInstance().then((value) => {value.remove("text")});
            Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => const MyApp()
                  )
                );
              }, 
            child: Text("Назад"))
          ]
         ),
       ],
     )   
    );  
  } 
}

 