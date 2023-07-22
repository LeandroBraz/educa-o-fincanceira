
import 'package:app_educacao_financeira/app/view/InfoPages.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_educacao_financeira/app/view/login_view.dart';
import 'package:app_educacao_financeira/app/routes/app_routes.dart';


class AppPages {
  static final routes = [
    GetPage(name: AppRouter.LOGIN, page: () => LoginPage()),
    // binding: LoginBinding()),
    GetPage(name: AppRouter.HOME, page: () => LoginPage()),
      // GetPage(
      //   name: AppRouter.INFOPAGES,
      //   page: () => InfoPages(),
      // ),
      // GetPage(
      //   name: AppRouter.METASPAGE,
      //   page: () => MetasPage(),
      // ),
      // GetPage(
      //   name: AppRouter.PRODUTOPAGE,
      //   page: () => ProdutoPage(),
      // ),
      // GetPage(
      //   name: AppRouter.PROPRAGANDAPAGE,
      //   page: () => PropagandaPage(),
      // ),
      // GetPage(
      //   name: AppRouter.FINANCASPAGE,
      //   page: () => FinancasPage(),
      // ),
      // GetPage(
      //   name: AppRouter.MARKETPLACEPAGE,
      //   page: () => MarketplacePage(),
      // ),
  ];
}