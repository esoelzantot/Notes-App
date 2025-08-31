import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    debugPrint("onChange: ${bloc.runtimeType}, $change");
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    debugPrint("onClose: ${bloc.runtimeType}");
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    debugPrint("onCreate: ${bloc.runtimeType}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
