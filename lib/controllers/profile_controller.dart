import 'package:cardealership/controllers/repository/user_repository.dart';
import 'package:cardealership/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  Rx<UserModel> user = UserModel(
          email: '',
          id: '',
          phoneNumber: '',
          firstName: '',
          lastName: '',
          profilePicture: '',
          userName: '')
      .obs;

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fatchUserIndformation();
      this.user(user);
    } catch (e) {
      user(UserModel(
          email: '',
          id: '',
          phoneNumber: '',
          firstName: '',
          lastName: '',
          profilePicture: '',
          userName: ''));
    }
  }
}
