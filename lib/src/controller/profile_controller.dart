import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/P.dart';

class ProfileController extends GetxController {
  Rxn<User> currentUser = Rxn<User>();
  Rx<String> userName = "".obs;
  Rx<String> emailUser = "".obs;

  Future<void> getCurrentUser() async {
    currentUser.value = P.authFirebase.currentUser;
  }

  Future<void> getInformationUser() async {
    var doc = await P.firestore.collection('Users').doc(currentUser.value!.uid).get();
    userName.value = doc['name'];
    emailUser.value = doc['email'];
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCurrentUser();
    if (currentUser.value != null) {
      await getInformationUser();
    }
  }
}
