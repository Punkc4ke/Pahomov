import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
      children: [
        Padding(padding: EdgeInsets.fromLTRB(23,  53, 23, 0),
        child: Container(
        child: Image.asset('assets/Frame 23.png', width: 343, height: 219),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Color.fromARGB(255, 242, 201, 76)),
        ),    
        ), 
        Padding(padding: EdgeInsets.fromLTRB(24,  13, 26, 1),
        child: Container(
        width: 340,
        height: 22,
        child: Text('Peter Mach', style: TextStyle(
          fontSize: 12, 
          fontFamily: 'Plus Jakarta Sans', 
          fontWeight: FontWeight.w500, 
          color: Color.fromRGBO(0, 0, 0, 0.5))
          )
        ),
        ),
        Padding(padding:  EdgeInsets.fromLTRB(26, 0, 28, 0),
        child: Container(
            width: 336,
            height: 112,
          child: Column(children: [
          Container(
            alignment: Alignment.topLeft, height: 32,
            child:  Text('Mind Deep Relax',  
            style: TextStyle(fontSize: 20, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700)), 
          ),
          Container(
            width: 336,
            height: 70,
            child: Text("Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.", 
            style: TextStyle(fontSize: 15, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w400))
          )]
          ),   
          ),
        ),
        Padding(padding:  EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: InkWell(
        child: Container(
        width: 342,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(3, 158, 162, 1)),
          child: Row(
        children: [
            Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.fromLTRB(94.5, 20, 0, 18),
            child: Image.asset('assets/shape.png', width: 11, height: 12)
            ),
            Container(
            margin: EdgeInsets.fromLTRB(5, 14, 90.5, 14),
            child: Text('Play Next Session', style: TextStyle(color: Colors.white))
            )  
        ])),
        )),
        Padding(padding: EdgeInsets.fromLTRB(7, 0, 25, 0),
        child: Container(
        width: 358, 
        height: 73, 
        child: Row(children: [
          InkWell(child: Container(
            margin: EdgeInsets.fromLTRB(16, 15.5, 13, 15.5),
            width: 42, height: 42,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Color.fromRGBO(47, 128, 237, 1)),
            child: Image.asset('assets/shape.png'),
            )),
            Container(
              width: 236,
              height: 61,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  width: 220,
                  height: 22,
                  child: Text('Sweet Memories',             
                  style: TextStyle(fontSize: 17, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w700)),     
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  width: 220,
                  height: 20,
                  child: Text('December 29 Pre-Launch',             
                  style: TextStyle(
                    fontSize: 12, 
                    fontFamily: 'Plus Jakarta Sans', 
                    fontWeight: FontWeight.w400, 
                  color: Color.fromRGBO(0, 0, 0, 0.5))),     
                ),
              ])),
              Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                ),
                Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                ),
                Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                )
        ]),
          )
        ),
        Padding(padding: EdgeInsets.fromLTRB(7, 0, 25, 0),
        child: Container(
        width: 358, 
        height: 73, 
        child: Row(children: [
          InkWell(child: Container(
            margin: EdgeInsets.fromLTRB(16, 15.5, 13, 15.5),
            width: 42, height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)), 
              color: Color.fromRGBO(3, 158, 162, 1)),
            child: Image.asset('assets/shape.png'),
            )),
            Container(
              width: 236,
              height: 61,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  width: 220,
                  height: 22,
                  child: Text('A Day Dream',             
                  style: TextStyle(fontSize: 17, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w700)),     
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  width: 220,
                  height: 20,
                  child: Text('December 29 Pre-Launch',             
                  style: TextStyle(
                    fontSize: 12, 
                    fontFamily: 'Plus Jakarta Sans', 
                    fontWeight: FontWeight.w400, 
                  color: Color.fromRGBO(0, 0, 0, 0.5))),     
                ),
              ])),
              Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                ),
                Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                ),
                Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                )
        ]),
          )
        ),
        Padding(padding: EdgeInsets.fromLTRB(7, 0, 25, 0),
        child: Container(
        width: 358, 
        height: 73, 
        child: Row(children: [
          InkWell(child: Container(
            margin: EdgeInsets.fromLTRB(16, 15.5, 13, 15.5),
            width: 42, height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)), 
              color: Color.fromRGBO(240, 146, 53, 1)),
            child: Image.asset('assets/shape.png'),
            )),
            Container(
              width: 236,
              height: 61,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  width: 220,
                  height: 22,
                  child: Text('Mind Explore',             
                  style: TextStyle(fontSize: 17, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w700)),     
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  width: 220,
                  height: 20,
                  child: Text('December 29 Pre-Launch',             
                  style: TextStyle(
                    fontSize: 12, 
                    fontFamily: 'Plus Jakarta Sans', 
                    fontWeight: FontWeight.w400, 
                  color: Color.fromRGBO(0, 0, 0, 0.5))),     
                ),
              ])),
              Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                ),
                Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                ),
                Container(
                margin: EdgeInsets.fromLTRB(2, 33.5, 0, 33.5),
                width: 6,
                height: 6,
                child: Image.asset('assets/Ellipse 1.png'),
                )
        ]),
          )
        )
      ])
    ); 
  }
}
