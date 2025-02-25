import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/src/controller/auth_controller.dart';
import 'package:office_furniture_store/src/controller/office_furniture_controller.dart';
import 'package:office_furniture_store/src/controller/profile_controller.dart';

class P {
  static initialize  () {
    Get.put(OfficeFurnitureController());
    Get.put(AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

  static final FirebaseAuth authFirebase = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static OfficeFurnitureController get office => Get.find();
  static AuthController get auth => Get.find();
  static ProfileController get profile => Get.find();
}