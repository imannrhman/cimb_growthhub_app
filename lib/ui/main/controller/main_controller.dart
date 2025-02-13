import 'dart:convert';

import 'package:cimb_growthhub_app/model/response/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  bool _maxScroll = false;
  bool get maxScroll => _maxScroll;

  bool _isFirstIndex = true;
  bool get isFirstIndex => _isFirstIndex;

  double _scrollIndex = 300;
  double get scrollIndex => _scrollIndex;

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  UserProfile? _profile;
  UserProfile? get profile => _profile;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void checkScroll() {
   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    _maxScroll = true;
    notifyListeners();
   } else {
     _maxScroll = false;
     notifyListeners();
   }

   if (_scrollController.position.pixels != 0) {
     _isFirstIndex = false;
     notifyListeners();
   } else {
     _isFirstIndex = true;
     notifyListeners();
   }

  }

  void notMaxScroll() {
    _maxScroll = false;
    notifyListeners();
  }
  
  void nextScroll() {
    if(_scrollController.hasClients) {
      _scrollIndex += 300;
      if (_scrollIndex >= _scrollController.position.maxScrollExtent) {
        double finalScore = _scrollIndex + (_scrollIndex - _scrollController.position.maxScrollExtent);
        _scrollController.animateTo(
            finalScore,
            duration: Duration(milliseconds: 1000),
            curve: Curves.ease);
        _scrollIndex = _scrollController.position.maxScrollExtent;
      } else {
        _scrollController.animateTo(
            _scrollIndex,
            duration: Duration(milliseconds: 1000),
            curve: Curves.ease);
      }
    }
  }

  void backScroll() {
    if(_scrollController.hasClients) {
      _scrollIndex -= 300;
      if (_scrollIndex >= 0){
        _scrollController.animateTo(
            _scrollIndex,
            duration: Duration(milliseconds: 1000),
            curve: Curves.ease);
      } else {
        _scrollIndex = 0;
      }

    }
  }

void checkLogin() {
  SharedPreferences.getInstance().then((value) {
    String? token = value.getString("token");
    if (token != null) {
      _isLogin = true;
      notifyListeners();
    } else {
      _isLogin = false;
      notifyListeners();
    }

     String? userProfile = value.getString("profile");
     if (userProfile != null ) {
        _profile = UserProfile.fromJson(jsonDecode(userProfile));
     }
  });
}


  



}