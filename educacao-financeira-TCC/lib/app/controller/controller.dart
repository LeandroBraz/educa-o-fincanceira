import 'package:app_educacao_financeira/app/model/Produto.model.dart';
import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/routes/app_routes.dart';
import 'package:app_educacao_financeira/app/view/CanaisPropaganda.view.dart';
import 'package:app_educacao_financeira/app/view/Financas.view.dart';
import 'package:app_educacao_financeira/app/view/Marketplace.view.dart';
import 'package:app_educacao_financeira/app/view/Metas.view.dart';
import 'package:app_educacao_financeira/app/view/quiz.dart';
import 'package:app_educacao_financeira/app/view/ResultadoQuiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:rflutter_alert/rflutter_alert.dart;

 final TextEditingController nickeditingController = TextEditingController();
 final TextEditingController qtdcontroller = TextEditingController();
 final TextEditingController nomeProdutoController = TextEditingController();
 final TextEditingController precoProdutoController = TextEditingController();
 final user = Usuario().obs;
 //final listProdutos = List<Produto>().obs;



void login() {
   user.value.nome = nickeditingController.text;
   user.value.saldo = 1500;
   print(user.value.nome);
   print(user.value.saldo);

   Get.toNamed(AppRouter.INFOPAGES, arguments: user);
 }



class Controller extends GetxController {
  MetasView metasView = MetasView();
  CanaisPropag canaisPropag = CanaisPropag();
  MarketplaceView marketplaceView = MarketplaceView();
  FinancasView financasView = FinancasView();
 // Quiz quizView =  const Quiz(user!);

  List<Produto> produto = [];

  // static final Controller instance = Controller._();
  //
  // Controller._();

  criarProduto() {
    print('Eu');
    // produto.add(Produto(
    //     nome: produtoView.nomeController.text,
    //     preco: double.parse(produtoView.precoController.text),
    //     quantidade: int.parse(produtoView.quantidadeController.text),
    //     categoria: Categoria(nome: produtoView.categoria)));
    // print(produto.toList());

  }

    void navagationDrawer(int index) {
      switch (index) {
        case 1:
          Get.toNamed(AppRouter.METASPAGE, arguments: user);
          break;
        case 2:
          Get.toNamed(AppRouter.PRODUTOPAGE, arguments: user);
          break;
        // case 3:
        //   Get.toNamed(AppRouter.QUIZ, arguments: user);
        //   break;
        case 4:
          Get.toNamed(AppRouter.PROPRAGANDAPAGE, arguments: user);
          break;

        case 5:
          Get.toNamed(AppRouter.FINANCASPAGE, arguments: user);
          break;

        case 6:
          Get.toNamed(AppRouter.MARKETPLACEPAGE, arguments: user);
          break;

        case 7:
          break;

        case 8:
          break;
        default:
      }
    }
  }


    infoPular() {
      Get.toNamed(AppRouter.HOME, arguments: user);
      print(user.value.nome);
    }

