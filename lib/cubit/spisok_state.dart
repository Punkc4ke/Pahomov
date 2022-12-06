part of 'spisok_cubit.dart';

@immutable
abstract class SpisokState {}

class SpisokInitial extends SpisokState {}

class Spisok extends SpisokState {
  
  final List<Text> spisok;

  Spisok(this.spisok);
}
