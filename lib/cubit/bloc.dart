import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../cubit/states.dart';
import 'package:sqflite/sqlite_api.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> newtasks = [];
  late Database database;
  GetStorage box = GetStorage('dataBox2');
  
  String key = 'data';
  List<String> messages = [];
  List<bool> isUsers = [];
  addMessage(String message , bool isUser) {
    emit(AppAddMessageLoading());
    messages.add(message);
    isUsers.add(isUser);
    emit(AppAddMessageFinishing());
  }

  Future<void> addToDatabase(Map post) async {
    await box.remove(key);
    newtasks.add(post);
    await box.write(key, newtasks);
  }

  Future<void> initDataBox() async {
    if (box.hasData(key)) {
      List data = await box.read(key);
      for (int i = 0; i < data.length; i++) {
        newtasks.add(data[i]);
      }
    }
  }

  bool isclosed = false;
  IconData fabicon = Icons.edit;
  void Changebottomsheet({
    required bool isshow,
    required IconData icon,
  }) {
    isclosed = isshow;
    fabicon = icon;
    emit(Isclosedstate());
  }
}
