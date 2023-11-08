import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/app/home_screen/models/user_model.dart';

part 'home_provider.g.dart';
@riverpod
class Home extends _$Home{
  @override
  User build()=> User();

  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  void getEmails(String email){
    state.email= email;

  }
  void getPassword(String password){
    state.password= password;
  }

  submitUser(){
    print(state.email);
    print(state.password);
    ref.notifyListeners();
  }
}