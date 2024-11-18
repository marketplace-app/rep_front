// ignore_for_file: prefer_const_constructors, camel_case_types, use_build_context_synchronously

import 'package:marketplace/src/api/repositories/email_repository.dart';
import 'package:marketplace/src/controllers/rpc_controller.dart';
import 'package:marketplace/src/controllers/rpn_controller.dart';
import 'package:marketplace/src/models/local_storage_model.dart';
import 'package:marketplace/src/models/mensage_model.dart';
import 'package:marketplace/src/models/rpe_model.dart';
import 'package:marketplace/src/views/pages/recover_password_email/rpe_desktop_view.dart';
import 'package:marketplace/src/views/pages/recover_password_email/rpe_mobileinvert_view.dart';
import 'package:marketplace/src/views/pages/recover_password_email/rpe_mobile_view.dart';
import 'package:marketplace/src/views/pages/recover_password_email/rpe_view.dart';
import 'package:flutter/material.dart';

class RpeController extends ChangeNotifier {
  RpeModel? _rpeModel;
  RpeDesktopView? _rpeDesktopView;
  RpeMobileInvertView? _rpeMobileInvertView;
  RpeMobileView? _rpeMobileView;
  RpeView? _rpeView;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  EmailRepository emailRepository = EmailRepository();
  ValueNotifier loading = ValueNotifier<bool>(false);

  RpeController() {
    _rpeModel = RpeModel();
    _rpeMobileInvertView = RpeMobileInvertView(controller: this);
    _rpeDesktopView = RpeDesktopView(controller: this);
    _rpeMobileView = RpeMobileView(controller: this);
    _rpeView = RpeView(controller: this);
  }

  saveData() {
    //Salva os dados de entrada no cache
    LocalStorageModel.saveValue('email', _rpeModel?.getEmail());
  }

  retrievelInputs() {
    if (LocalStorageModel.getValue('email') != null) {
      emailController.text = LocalStorageModel.getValue('email')!;
    }
  }

  sendEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      loading.value = !loading.value;
      List itens = await emailRepository.getEmail(_rpeModel?.getEmail());
      if (itens[0]) {
        RpnController.email = _rpeModel?.getEmail();
        RpcController.token = itens[1];
        emailController.text = '';
        loading.value = !loading.value;
        Navigator.pushNamed(context, "/recoverpasswordcode");
      }else {
        loading.value = !loading.value;
        MensageModel.showSnackBar(
          context: context,
          textDescription: itens[1],
          colorText: Colors.white,
          colorBackgroundNormal: const Color.fromARGB(255, 209, 125, 0),
          functionAction: () {},
        );
      }

      //Navigator.pushNamed(context, '/recoverpasswordnew');
      LocalStorageModel.clearAll();
    }
  }

  validateEmail(String? email) {
    if (email == null) {
      return MensageModel.ERRO_EMAIL_INPUT;
    }
    if (email.isEmpty) {
      return MensageModel.ERRO_EMAIL_INPUT;
    }
    if (!email.contains("@")) {
      return MensageModel.ERRO_EMAIL_INVALID_INPUT;
    }
    if (email.length < 5) {
      return MensageModel.ERRO_EMAIL_SHORT;
    }
    return null;
  }

  RpeModel? getRpeModel() {
    return _rpeModel;
  }

  getRpeDesktopView() {
    return _rpeDesktopView;
  }

  getRpeMobileInvertView() {
    return _rpeMobileInvertView;
  }

  getRpeMobileView() {
    return _rpeMobileView;
  }

  getRpeView() {
    return _rpeView;
  }
}
