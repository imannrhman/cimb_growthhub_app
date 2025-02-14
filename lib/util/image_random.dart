import 'dart:math';

import 'package:flutter/cupertino.dart';

class ImageRandom {

  static final String _baseName = "assets/illustration";


  static String randomImageFromAsset() {
    Random rnd;
    int min = 1;
    int max = 12;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    String imageName  = "$_baseName/$r.jpg";
    return imageName;
  }







}