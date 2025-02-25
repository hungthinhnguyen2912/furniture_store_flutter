import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/P.dart';
import 'package:office_furniture_store/src/view/screen/home_screen.dart';

class AuthController extends GetxController {
  Future<void> signIn(String email, String password) async {
    try {
      P.authFirebase.signInWithEmailAndPassword(email: email, password: password);
      Get.off(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Something went wrong", "${e.toString()}");
    };
  }
  Future<void> signUp (String email, String password, String userName) async {
    try {
      UserCredential userCredential = await P.authFirebase.createUserWithEmailAndPassword(email: email, password: password);
      Map <String,dynamic> userData = {
        "uid" : userCredential.user!.uid,
        "email": userCredential.user!.email,
        "name" : userName
      };
      await P.firestore.collection('Users').doc(userCredential.user!.uid).set(userData);
      Get.off(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Something went wrong", "${e.toString()}");
    }
  }
}
