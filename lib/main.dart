import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr5/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/change_theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ChangeThemeCubit()),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          if (state is ThemeState) {
            return MaterialApp(
                theme: ThemeData(brightness: state.brightness),
                debugShowCheckedModeBanner: false,
                home: MyHomePage(title: 'Темная тема'));
          }
          return MaterialApp(
            theme: ThemeData(brightness: Brightness.light),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(title: 'Светлая тема'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = new TextEditingController();
  GlobalKey<FormState> globalkey = GlobalKey();
  
  SharedPreferences? sharedPreferences;

  Future<void>  initShared() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initShared().then((value){
      if (sharedPreferences!.getString("text") != null && sharedPreferences!.getString("text") != "") {
      String? _text  = sharedPreferences!.getString('text');
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        arguments: { "text": _text,},
            )
          )
        );
      }                    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: 
          MainAxisAlignment.center,
          children: <Widget>[
             Container( 
              width: 1000, 
              height: 100,
              child:
            Form(
                key: globalkey,
                child: TextFormField(
                  controller: textController,
                  validator: ((value) {
                    if (value == "" || value == null) {
                      return "Поле обязательно к заполнению";
                    }
                  }),
                )),
             ),
            ElevatedButton(onPressed: () {
              if (!globalkey.currentState!.validate()) return;
                  sharedPreferences!.setString("text", textController.text);
              Navigator.push(
                context, MaterialPageRoute(
                   builder: (context) => Screen(
                                arguments: { "text": sharedPreferences!.getString("text")}
                    ),
                  )
                );
              }, 
              child: Text("На следующее окно")) 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read<ChangeThemeCubit>()
            .onClick(Theme.of(context).brightness),
        tooltip: 'Изменить тему',
        child: const Icon(Icons.edit),
      ), 
    );
  }
}
