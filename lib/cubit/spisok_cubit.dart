import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'spisok_state.dart';

class SpisokCubit extends Cubit<SpisokState> {
  SpisokCubit() : super(SpisokInitial());

  void onClick(List<Text> spisok, int counter, Brightness brightness) {
    
    String theme = brightness == Brightness.dark ? "Темная тема" : "Светлая тема";

    String text = DateTime.now().toString() + "/" + counter.toString() + "/" + theme; 

    spisok.insert(0, Text(text));

    emit(Spisok(spisok));
  }
}
