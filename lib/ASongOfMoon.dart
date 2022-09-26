import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}
// верстка безбожно кривая, потому что экран телефона с другой диагональю, так что печалька(
class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [ 
      Container(
      margin: EdgeInsets.fromLTRB(24, 47, 0, 0),
      width: 366,
      height: 51,
      child: Row(children: [
      Text('Meditate', style: TextStyle(fontSize: 22, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w700)),
        Container(
        margin: EdgeInsets.fromLTRB(220, 17, 0, 17),
        width: 20,
        height: 20,
        child: Image.asset('assets/lupa.png'),
      )
      ]),
      ),
      Container(
        child: Row(children: [  
          Padding(padding:  EdgeInsets.fromLTRB(23, 14, 10, 22), 
          child: InkWell(
          child: Container(
            alignment: Alignment.center,
          width: 35,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(3, 158, 162, 1)),
          child: Text('All', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500, 
                  color: Colors.white
                  )),
          ))
          ),
          Padding(padding:  EdgeInsets.fromLTRB(0, 14, 15, 22),
          child: InkWell(
          child: Container(
          alignment: Alignment.center,
          width: 104,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(230, 254, 255, 1)),
          child: Text('Bible In a Year', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500, 
                  color: Color.fromRGBO(3, 158, 162, 1)
                  )),
          ))
          ),
          Padding(padding:  EdgeInsets.fromLTRB(0, 14, 11, 22),
          child: InkWell(
          child: Container(
          alignment: Alignment.center,
          width: 61,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(230, 254, 255, 1)),
          child: Text('Dailies', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500, 
                  color: Color.fromRGBO(3, 158, 162, 1)
                  )),
          ))
          ),
          Padding(padding:  EdgeInsets.fromLTRB(0, 14, 12, 22),
          child: InkWell(
          child: Container(
          alignment: Alignment.center,
          width: 69,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(230, 254, 255, 1)),
          child: Text('Minutes', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500, 
                  color: Color.fromRGBO(3, 158, 162, 1)
                  )),
          ))
          ),
          Expanded(child: 
          Padding(padding:  EdgeInsets.fromLTRB(0, 14, 0, 22),
            child: InkWell(
          child: Container(
          alignment: Alignment.center, 
          width: 120,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Color.fromRGBO(230, 254, 255, 1)),
          child: Text('November', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500, 
                  color: Color.fromRGBO(3, 158, 162, 1)
                  )),
          ))      
          )
          )
        ])
        ),
        Padding(padding: EdgeInsets.fromLTRB(24,  0, 23, 11),
        child: Container(
        child: Image.asset('assets/Group 123.png', width: 342.25, height: 180),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(255, 242, 201, 76)),
        ),    
        ),
        Padding(padding:  EdgeInsets.fromLTRB(36, 0, 185, 0),
          child: Container(
            width: 336,
            height: 32,
            child:  Text('A Song Of Moon',  
            style: TextStyle(fontSize: 20, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700)), 
          )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(36, 0, 202, 0),
            width: 152,
            height: 22,
            child: Text('Start with the basics', 
            style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w400))
          ),
          Container(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(36.88, 8, 6.88, 0),
                width: 11.25,
                height: 10,
                child: Image.asset('assets/heart.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 14, 177, 0),
                width: 61,
                height: 22,
                child: Text('9 Sessions', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              InkWell(
              child: Row(children: [ 
                Container(
                margin: EdgeInsets.fromLTRB(0, 14, 0, 0),
                width: 29,
                height: 22,
                child: Text('Start', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 7, 0, 0),
                width: 5,
                height: 8,
                child: Image.asset('assets/chevron.forward.png')
              )
            ])
            )
            ]),
          ),
          Container(
          child: Row(children: [
          Container(
            margin: EdgeInsets.fromLTRB(17, 5, 8.86, 17),
            width: 166.57,
            height: 170, 
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1)),
            child: Column(
              children: [
            Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0.43, 0),
            child: Image.asset('assets/Image.png'), //да, да картинка кривая, просто скачивать все слои я не собираюсь
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1))
            ), 
            Container(
            margin: EdgeInsets.fromLTRB(11, 5, 38.57, 0),
            width: 117,
            height: 22,
            child: Text('The Sleep Hour', 
            style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700))
            ),
            Container(
            margin: EdgeInsets.fromLTRB(9.47, 0, 53.1, 0),
            width: 117,
            height: 22,
            child: Text('Ashna Mukherjee', 
            style: TextStyle(
            fontSize: 13, 
            fontFamily: 'Plus Jakarta Sans', 
            fontWeight: FontWeight.w400, 
            color: Color.fromRGBO(0, 0, 0, 0.5)))
            ),
            Container(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(13.4, 5, 4, 0),
                child: Image.asset('assets/heart.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 34.1, 0),
                child: Text('3 Sessions', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              InkWell(
              child: Row(children: [ 
                Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Start', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 7, 0, 0),
                width: 5,
                height: 8,
                child: Image.asset('assets/chevron.forward.png')
              )
            ])
            )
            ]),
          ),
            ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(17, 5, 8.86, 17),
            width: 166.57,
            height: 170, 
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1)),
            child: Column(
              children: [
            Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0.43, 0),
            child: Image.asset('assets/Image (1).png'), //да, да картинка кривая, просто скачивать все слои я не собираюсь
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1))
            ), 
            Container(
            margin: EdgeInsets.fromLTRB(11, 5, 38.57, 0),
            width: 117,
            height: 22,
            child: Text('Easy on the Mission', 
            style: TextStyle(fontSize: 12, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700))
            ),
            Container(
            margin: EdgeInsets.fromLTRB(9.47, 0, 53.1, 0),
            width: 117,
            height: 22,
            child: Text('Peter Mach', 
            style: TextStyle(
            fontSize: 13, 
            fontFamily: 'Plus Jakarta Sans', 
            fontWeight: FontWeight.w400, 
            color: Color.fromRGBO(0, 0, 0, 0.5)))
            ),
            Container(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(13.4, 5, 4, 0),
                child: Image.asset('assets/heart.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 34.1, 0),
                child: Text('5 minutes', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              InkWell(
              child: Row(children: [ 
                Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Start', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 7, 0, 0),
                width: 5,
                height: 8,
                child: Image.asset('assets/chevron.forward.png')
              )
            ])
            )
            ]),
          ),
            ]),
          ),
          ])
          ),
          Container(
          child: Row(children: [
          Container(
            margin: EdgeInsets.fromLTRB(17, 5, 8.86, 17),
            width: 166.57,
            height: 170, 
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1)),
            child: Column(
              children: [
            Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0.43, 0),
            child: Image.asset('assets/Image (2).png'), //да, да картинка кривая, просто скачивать все слои я не собираюсь
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1))
            ), 
            Container(
            margin: EdgeInsets.fromLTRB(11, 5, 38.57, 0),
            width: 117,
            height: 22,
            child: Text('Relax With Me', 
            style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700))
            ),
            Container(
            margin: EdgeInsets.fromLTRB(9.47, 0, 53.1, 0),
            width: 117,
            height: 22,
            child: Text('Amanda James', 
            style: TextStyle(
            fontSize: 13, 
            fontFamily: 'Plus Jakarta Sans', 
            fontWeight: FontWeight.w400, 
            color: Color.fromRGBO(0, 0, 0, 0.5)))
            ),
            Container(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(13.4, 5, 4, 0),
                child: Image.asset('assets/heart.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 34.1, 0),
                child: Text('3 Sessions', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              InkWell(
              child: Row(children: [ 
                Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Start', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 7, 0, 0),
                width: 5,
                height: 8,
                child: Image.asset('assets/chevron.forward.png')
              )
            ])
            )
            ]),
          ),
            ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(17, 5, 8.86, 17),
            width: 166.57,
            height: 170, 
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1)),
            child: Column(
              children: [
            Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0.43, 0),
            child: Image.asset('assets/Image (3).png'), //да, да картинка кривая, просто скачивать все слои я не собираюсь
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.2)), color: Color.fromRGBO(235, 235, 235, 1))
            ), 
            Container(
            margin: EdgeInsets.fromLTRB(11, 5, 38.57, 0),
            width: 117,
            height: 22,
            child: Text('Sun and Energy', 
            style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700))
            ),
            Container(
            margin: EdgeInsets.fromLTRB(9.47, 0, 53.1, 0),
            width: 117,
            height: 22,
            child: Text('Micheal Hiu', 
            style: TextStyle(
            fontSize: 13, 
            fontFamily: 'Plus Jakarta Sans', 
            fontWeight: FontWeight.w400, 
            color: Color.fromRGBO(0, 0, 0, 0.5)))
            ),
            Container(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(13.4, 5, 4, 0),
                child: Image.asset('assets/heart.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 34.1, 0),
                child: Text('5 minutes', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              InkWell(
              child: Row(children: [ 
                Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text('Start', 
                style: TextStyle(
                  fontSize: 12, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.5)))
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2, 7, 0, 0),
                width: 5,
                height: 8,
                child: Image.asset('assets/chevron.forward.png')
              )
            ])
            )
            ]),
          ),  
            ]),
          ),
          ])
          ),
        ])
      ); 
  }  
}
// тока щас понял что вместо некоторых контейнеров инквеллы должны быть

