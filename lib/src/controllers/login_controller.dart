// ignore_for_file: use_build_context_synchronously

import 'package:marketplace/src/api/repositories/login_repositoy_api.dart';
import 'package:marketplace/src/models/local_storage_model.dart';
import 'package:marketplace/src/models/login_model.dart';
import 'package:marketplace/src/models/mensage_model.dart';
import 'package:marketplace/src/views/components/atomic/show_dialog.dart';
import 'package:marketplace/src/views/pages/login/login_desktop_view.dart';
import 'package:marketplace/src/views/pages/login/login_mobile_invert_view.dart';
import 'package:marketplace/src/views/pages/login/login_mobile_view.dart';
import 'package:marketplace/src/views/pages/login/login_view.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  LoginModel? _loginModel;
  LoginMobileView? _loginMobileView;
  LoginMobileInvertView? _loginMobileInvertView;
  LoginDesktopView? _loginDesktopView;
  LoginView? _loginView;
  LoginRepositoryApi loginRepositoryApi = LoginRepositoryApi();
  ValueNotifier loading = ValueNotifier<bool>(false);

  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginController() {
    _loginModel = LoginModel();
    _loginMobileView = LoginMobileView(
      controller: this,
    );
    _loginDesktopView = LoginDesktopView(
      controller: this,
    );
    _loginMobileInvertView = LoginMobileInvertView(
      controller: this,
    );
    _loginView = LoginView(controller: this);
  }

  saveData() {
    //Salva os dados de entrada no cache
    LocalStorageModel.saveValue('user', _loginModel?.getUser());
    LocalStorageModel.saveValue('password', _loginModel?.getPassword());
  }

  retrievelInputs() {
    if (LocalStorageModel.getValue('password') != null) {
      passwordController.text = LocalStorageModel.getValue('password')!;
    }

    if (LocalStorageModel.getValue('user') != null) {
      userController.text = LocalStorageModel.getValue('user')!;
    }
  }

  validateInputUser(String? user) {
    if (user == null) {
      return MensageModel.ERRO_USER_INPUT;
    }
    if (user.isEmpty) {
      return MensageModel.ERRO_USER_INPUT;
    }
    return null;
  }

  validateInputPassword(String? password) {
    if (password == null) {
      return MensageModel.ERRO_PASSWORD_INPUT;
    }
    if (password.isEmpty) {
      return MensageModel.ERRO_PASSWORD_INPUT;
    }
    return null;
  }

  validateUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      loading.value = !loading.value;
      List status = await loginRepositoryApi.getPost(
          _loginModel?.getUser(), _loginModel?.getPassword());
      if (status[0]) {
        userController.text = '';
        passwordController.text = '';
        loading.value = !loading.value;
        Navigator.pushNamed(context, '/additens');
      } else {
        loading.value = !loading.value;
        MensageModel.showSnackBar(
            context: context,
            textDescription: status[1],
            colorText: Colors.white,
            colorBackgroundNormal: const Color.fromARGB(255, 209, 125, 0),
            functionAction: () {});
      }
    }
  }

  getLoginMobileView() {
    return _loginMobileView;
  }

  getLoginDesktopView() {
    return _loginDesktopView;
  }

  getLoginMobileInvertView() {
    return _loginMobileInvertView;
  }

  getLoginView() {
    return _loginView;
  }

  LoginModel? getLoginModel() {
    return _loginModel;
  }

  showDialog({required String title, required String mensage}) {
    return ShowDialog(tittleMensage: title, mensage: mensage);
  }
}
