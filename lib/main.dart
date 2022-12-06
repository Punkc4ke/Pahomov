import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4/cubit/click_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4/cubit/spisok_cubit.dart';
import 'package:pr4/cubit/change_theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ClickCubit()),
        BlocProvider(create: (BuildContext context) => ChangeThemeCubit()),
        BlocProvider(create: (BuildContext context) => SpisokCubit())
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
  static String textCounter = "0";

  static List<Text> history = [Text("")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<ClickCubit, ClickState>(
                  builder: (context, state) {
                    if (state is ClickError) {
                      textCounter = state.message;
                      return Text(
                        textCounter,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }

                    if (state is Click) {
                      textCounter = state.count.toString();
                      return Text(
                        textCounter,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }

                    return Text("0",
                        style: Theme.of(context).textTheme.headline4);
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: ElevatedButton(
                          onPressed: () {
                            Brightness brightness =
                                Theme.of(context).brightness;
                            context
                                .read<ClickCubit>()
                                .onClick(brightness, true);
                            context.read<SpisokCubit>().onClick(
                                history, int.parse(textCounter), brightness);
                          },
                          child: const Icon(Icons.remove)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Brightness brightness = Theme.of(context).brightness;
                          
                          context.read<ClickCubit>().onClick(brightness, false);
                          context.read<SpisokCubit>().onClick(
                              history, int.parse(textCounter), brightness);
                        },
                        
                        child: const Icon(Icons.add)),
                        
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 100),
                child: BlocBuilder<SpisokCubit, SpisokState>(
                  builder: (context, state) {
                    if (state is Spisok) {
                      return Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: state.spisok,)
                        ),
                      );
                    }
                    return Container();
                  },
                )
            )],
            ),
          ),
        ],
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