package com.lauchlin.toyrobot;

public class Util {

  public static double fmod(double a, double b) {
    return a - b * Math.floor( a / b );
  }

}
