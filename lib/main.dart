import 'package:flutter/material.dart';
import '../login.dart';
import 'package:innovationfinale/nav.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'premiumbanner.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: 'Bottom nav bar',
      home: LoginPage(),
      route: '',
      initialBinding: PremiumMembershipBinding(),
    );
  }

}

class PremiumMembershipBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PremiumMembershipController());
  }
}

