// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:marketplace/src/models/local_storage_model.dart';
import 'package:marketplace/src/models/mensage_model.dart';
import 'package:marketplace/src/models/rpc_model.dart';
import 'package:marketplace/src/views/pages/recover_password_code/rpc_desktop_view.dart';
import 'package:marketplace/src/views/pages/recover_password_code/rpc_mobileInvert_view.dart';
import 'package:marketplace/src/views/pages/recover_password_code/rpc_mobile_view.dart';
import 'package:marketplace/src/views/pages/recover_password_code/rpc_view.dart';
import 'package:flutter/material.dart';

class RpcController {
  RpcModel? _rpcModel;
  RpcMobileView? _rpcMobileView;
  RpcMobileInvertView? _rpcMobileInvertView;
  RpcDesktopView? _rpcDesktopView;
  RpcView? _rpcView;
  static String token = '';
  final formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  ValueNotifier loading = ValueNotifier<bool>(false);

  RpcController() {
    _rpcMobileView = RpcMobileView(controller: this);
    _rpcModel = RpcModel();
    _rpcMobileInvertView = RpcMobileInvertView(controller: this);
    _rpcDesktopView = RpcDesktopView(controller: this);
    _rpcView = RpcView(controller: this);
  }

  saveData() {
    //Salva os dados de entrada no cache
    LocalStorageModel.saveValue('code', _rpcModel?.getCode());
  }

  retrievelInputs() {
    if (LocalStorageModel.getValue('code') != null) {
      codeController.text = LocalStorageModel.getValue('code')!;
    }
  }

  sendCode(BuildContext context) {
    if (formKey.currentState!.validate()) {
      loading.value = !loading.value;
      Map<String, dynamic> mapToken = json.decode(token);
      if (_rpcModel?.getCode() == mapToken['token']) {
        codeController.text = '';
        token = '';
        loading.value = !loading.value;
        Navigator.pushNamed(context, "/recoverpasswordnew");
      } else {
        loading.value = !loading.value;
        MensageModel.showSnackBar(
          context: context,
          textDescription: MensageModel.TOKEN_INVALID,
          colorText: Colors.white,
          colorBackgroundNormal: const Color.fromARGB(255, 209, 125, 0),
          functionAction: () {},
        );
      }
    }
  }

  validateCode(String? code) {
    if (code == null) {
      return MensageModel.ERRO_CODE_INPUT;
    }
    if (code.isEmpty) {
      return MensageModel.ERRO_CODE_INPUT;
    }
    if (code.length < 8) {
      return MensageModel.ERRO_CODE_SHORT;
    }
    return null;
  }

  RpcModel? getRpcModel() {
    return _rpcModel;
  }

  RpcMobileView? getRpcMobileView() {
    return _rpcMobileView;
  }

  RpcMobileInvertView? getRpcMobileInvertView() {
    return _rpcMobileInvertView;
  }

  RpcDesktopView? getRpcDesktopView() {
    return _rpcDesktopView;
  }

  getRpcView() {
    return _rpcView;
  }
}
