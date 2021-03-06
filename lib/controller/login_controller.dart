import 'package:food_cafe/resource/routes.dart';
import 'package:food_cafe/utils/extensions.dart';
import 'package:food_cafe/utils/state_status.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<StateStatus> stateStatus = StateStatus.INITIAL.obs;

  String _email = '', _password = '';

  RxBool autoValidate = false.obs;
  RxBool passwordVisible = true.obs;

  changeUserName(String value) {
    _email = value;
  }

  changePassword(String value) {
    _password = value;
  }

  void checkAutoValidate() {
    autoValidate.value = true;
  }

  void togglePasswordVisibility() {
    this.passwordVisible.value = !passwordVisible.value;
  }

  Future<void> callLogin() async {
    stateStatus.value = StateStatus.LOADING;

    stateStatus.value = StateStatus.SUCCESS;

    Get.offNamed(homeRoute);
  }

  String isPasswordValid(String value) => value.validatePassword();

  String isEmailValid(String value) => value.validateEmail();
}
