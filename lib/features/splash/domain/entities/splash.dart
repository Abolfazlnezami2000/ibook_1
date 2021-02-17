import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Splash extends Equatable {
  final bool checkfirstapp;

  Splash({@required this.checkfirstapp});

  @override
  // TODO: implement props
  List<Object> get props => [checkfirstapp];

}