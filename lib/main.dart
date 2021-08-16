import 'package:flutter/material.dart';
import 'package:zane_shop/CartScreen.dart';
import 'package:zane_shop/ConfirmDeets.dart';
import 'package:zane_shop/Login.dart';
import 'package:zane_shop/ProductDisplay.dart';
import 'package:zane_shop/ProductList.dart';
import 'package:zane_shop/VouchersClaimed.dart';
import 'LoadingPage.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'HomePage.dart';
import 'ProductDisplay.dart';
import 'CartScreen.dart';
import 'PaymentDeets.dart';
import 'ConfirmDeets.dart';
import 'OrderPlaced.dart';
import 'ProductSelect.dart';
import 'ProductList.dart';
import 'EditProfile.dart';
import 'Benefits.dart';
import 'VoucherApply.dart';
import 'VouchersClaimed.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loading(),
      '/Login' : (context) => Login(),
      '/SignUp' :(context) => SignUp(),
      '/HomePage' : (context) => homepage(),
      '/ProductDisplay' : (context) => ProductDisplay(),
      '/CartScreen' :(context) => CartScreen(),
      '/Payment' : (context) => PaymentDeets(),
      '/Confirm' : (context) => ConfirmDeets(),
      '/Placed' : (context) => OrderPlaced(),
      '/Select' : (context) => ProductSelect(),
      '/List' : (context) => ProductList(),
      '/Edit' : (context) => EditProfile(),
      '/Benefits' : (context) => Benefits(),
      '/Voucher' : (context) => VoucherApply(),
      '/VoucherDisplay' : (context) => VoucherClaimed()
    },
  ));
}
