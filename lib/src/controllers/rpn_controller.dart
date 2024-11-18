// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:marketplace/src/api/repositories/password_repository.dart';
import 'package:marketplace/src/models/local_storage_model.dart';
import 'package:marketplace/src/models/mensage_model.dart';
import 'package:marketplace/src/models/rpn_model.dart';
import 'package:marketplace/src/views/pages/recover_password_new/rpn_desktop_view.dart';
import 'package:marketplace/src/views/pages/recover_password_new/rpn_mobile_view.dart';
import 'package:marketplace/src/views/pages/recover_password_new/rpn_mobileinvert_view.dart';
import 'package:marketplace/src/views/pages/recover_password_new/rpn_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RpnController extends ChangeNotifier {
  RpnModel? _rpnModel;
  RpnDesktopView? _rpnDesktopView;
  RpnMobileView? _rpnMobileView;
  RpnMobileInvertView? _rpnMobileInvertView;
  RpnView? _rpnView;
  final PasswordRepository _passwordRepository = PasswordRepository();
  static String email = '';
  final formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController replayPasswordController = TextEditingController();
  ValueNotifier loading = ValueNotifier<bool>(false);

  RpnController() {
    _rpnModel = RpnModel();
    _rpnDesktopView = RpnDesktopView(controller: this);
    _rpnMobileView = RpnMobileView(controller: this);
    _rpnView = RpnView(controller: this);
    _rpnMobileInvertView = RpnMobileInvertView(controller: this);
  }

  validateReplyPassword(String? replayNewPassword) {
    if (replayNewPassword == null) {
      return MensageModel.ERRO_PASSWORD_EMPTY_INPUT;
    }
    if (replayNewPassword.isEmpty) {
      return MensageModel.ERRO_PASSWORD_EMPTY_INPUT;
    }
    if (replayNewPassword != newPasswordController.text) {
      return MensageModel.ERROR_PASSWORD_UP_INPUT;
    }
    return null;
  }

  validateNewPassword(String? newPassword) {
    if (newPassword == null) {
      return MensageModel.ERRO_PASSWORD_EMPTY_INPUT;
    }
    if (newPassword.isEmpty) {
      return MensageModel.ERRO_PASSWORD_EMPTY_INPUT;
    }
    if (newPassword != replayPasswordController.text) {
      return MensageModel.ERROR_PASSWORD_DOWN_INPUT;
    }

    return null;
  }

  saveData() {
    //Salva os dados de entrada no cache
    LocalStorageModel.saveValue('newPassword', _rpnModel?.getNewPassword());
    LocalStorageModel.saveValue('replyPassword', _rpnModel?.getReplyPassword());
  }

  retrievelInputs() {
    if (LocalStorageModel.getValue('newPassword') != null) {
      newPasswordController.text = LocalStorageModel.getValue('newPassword')!;
    }

    if (LocalStorageModel.getValue('replyPassword') != null) {
      newPasswordController.text = LocalStorageModel.getValue('replyPassword')!;
    }
  }

  sendNewPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      loading.value = !loading.value;
      List status =
          await _passwordRepository.put(_rpnModel?.getNewPassword(), email);
      if (status[0]) {
        LocalStorageModel.clearAll();
        loading.value = !loading.value;
        Navigator.pushNamed(context, "/login");
      } else {
        loading.value = !loading.value;
        MensageModel.showSnackBar(
          context: context,
          textDescription: status[1],
          colorText: Colors.white,
          colorBackgroundNormal: const Color.fromARGB(255, 209, 125, 0),
          functionAction: () {},
        );
      }
    }
  }

  returnLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  getRpnDesktopView() {
    return _rpnDesktopView;
  }

  getRpnMobileView() {
    return _rpnMobileView;
  }

  getRpnMobileInvertView() {
    return _rpnMobileInvertView;
  }

  getRpnView() {
    return _rpnView;
  }

  RpnModel? getRpnModel() {
    return _rpnModel;
  }
}
