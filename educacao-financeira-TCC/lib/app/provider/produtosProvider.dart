// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_educacao_financeira/app/view/Home.view.dart';
import 'package:flutter/material.dart';

import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';
// import 'package:mobile/model/segsat/Notificacao.dart';
// import 'package:mobile/service/notification_service.dart';
// import 'package:mobile/shared/top_notification.dart';
// import 'package:mobile/utils/app_pallets.dart';
// import 'package:overlay_support/overlay_support.dart';

class ProdutosProvider with ChangeNotifier {
  //o contador é inicializado

  int _counter = 0;

  Future<void> changeStatus(BuildContext context) async {
    Usuario user = await buscarDadosUsuario();
    notifyListeners();
  }

  //método para diminuir o valor do contador
  subtract() {
    // só vai até zero, a redução
    if (counter > 0) _counter--;

    //o notifyListener serve para informar aos Consumers da mudança do valor (um listener)
    notifyListeners();
  }

  //método para adicionar o valor do contador
  add() {
    _counter++;

    notifyListeners();
  }

  //getter para obter o valor do contador
  int get counter => _counter;
}
