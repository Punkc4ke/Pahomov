import 'package:flutter/material.dart';

class Medinow extends StatefulWidget {
  const Medinow({super.key});

  @override
  State<Medinow> createState() => _MedinowState();
}

class _MedinowState extends State<Medinow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 158, 162, 1),
      body: Container(
      child: Column( 
      children: [
      Container(
        margin: EdgeInsets.fromLTRB(106, 149, 99.9, 2.22),
        width: 184.1,
        height: 30.78,
        child: Image.asset('assets/medinow.png')
        ),
        Container(
          margin: EdgeInsets.fromLTRB(106, 12, 99.9, 2.22),
          height: 42,
          child: Text('Meditate With Us!', 
          style: TextStyle(
            fontSize: 17, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w600, color: Colors.white
                  )),
        ),
        Padding(padding:  EdgeInsets.fromLTRB(24, 45, 24, 12),
        child: InkWell(
        child: Container(
        width: 342,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Colors.white),
          child: Container(
            margin: EdgeInsets.fromLTRB(103, 14, 103, 14),
            child: Text('Sign in with Apple', 
            style: TextStyle(fontSize: 16,
            fontFamily: 'Plus Jakarta Sans', 
            color: Colors.black,
            fontWeight: FontWeight.w600))
            )  
        ),
        )),
        Padding(padding:  EdgeInsets.fromLTRB(24, 0, 24, 22),
        child: InkWell(
        child: Container(
        width: 342,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(205, 253, 254, 1  )),
          child: Container(
            width: 300,
            height: 22,
            margin: EdgeInsets.fromLTRB(59.5, 14, 59.5, 14),
            child: Text('Continue with Email or Phone', 
            style: TextStyle(fontSize: 16,
            fontFamily: 'Plus Jakarta Sans', 
            color: Colors.black,
            fontWeight: FontWeight.w600))
            )  
        ),
        )),
        InkWell(child: Text('Continue With Google', 
        style: TextStyle(fontSize: 16,
            fontFamily: 'Plus Jakarta Sans', 
            color: Colors.white,
            fontWeight: FontWeight.w600))
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 90, 0, 0),
              width: 377,
              height: 284,
              child: Image.asset('assets/image 3.png'),
            )
      ])
      )
    ); 
  }
  
}
