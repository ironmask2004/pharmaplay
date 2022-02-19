import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';

part 'mainboard_event.dart';
part 'mainboard_state.dart';

class MainboardBloc extends Bloc<MainboardEvent, MainboardState> {
  MainboardBloc() : super(MainboardInitial()) {
    on<MainboardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
