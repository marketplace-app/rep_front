// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class MensageModel {
  static String ERRO_PASSWORD_INVALID =
      'Senha incorreta, por favor tente novamente!';
  static String ERRO_USER_INVALID =
      'Usuário não encontrado, por favor tente novamente!';
  static String ERRO_EMAIL_INVALID =
      'E-mail não encontrado, por favor tente novamente!';
  static String ERRO_CODE_INVALID =
      'Código incorreto, por favor tente novamente!';
  static String ERRO_PASSWORD_REPLY =
      'Por favor, crie uma senha diferente da comum';
  static String ERRO_USER_INPUT = 'Usuário com o campo vazio';
  static String ERRO_PASSWORD_INPUT = 'Senha não pode ser vazia';
  static String ERRO_CODE_INPUT = 'Este campo não pode ficar em branco';
  static String ERRO_CODE_SHORT = 'Este código é muito curto';
  static String ERRO_EMAIL_INPUT = 'Por favor, preencha um e-mail';
  static String ERRO_EMAIL_INVALID_INPUT =
      'Por favor, preencha um e-mail válido';
  static String ERRO_EMAIL_SHORT = 'E-mail muito curto';
  static String ERRO_PASSWORD_EMPTY_INPUT = 'Esse campo não pode ficar vazio!';
  static String ERROR_PASSWORD_UP_INPUT =
      "Essa senha não é igual a senha acima";
  static String ERROR_PASSWORD_DOWN_INPUT =
      "Essa senha não é igual a senha abaixo";
  static String TOKEN_INVALID = 'Este código é inválido';
  
  static showSnackBar(
      {required BuildContext context,
      required String textDescription,
      String? textLabel,
      required Color colorText,
      required Color colorBackgroundNormal,
      Color? colorBackgroundError,
      Color? colorTextLabel,
      required void Function() functionAction,
      bool isError = false}) {
    SnackBar snackBar = SnackBar(
      backgroundColor: (isError) ? colorBackgroundError : colorBackgroundNormal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: (textLabel == null) ? '' : textLabel,
        textColor: colorTextLabel,
        onPressed: functionAction,
      ),
      content: Text(
        textDescription,
        style: TextStyle(
          color: colorText,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
