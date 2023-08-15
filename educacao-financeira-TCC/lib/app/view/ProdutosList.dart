// import 'dart:convert';

// import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
// import 'package:app_educacao_financeira/app/model/dadosCompra.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import '../DAO/SCRIPT_IN_METAS_BASE.dart';
// import '../DAO/api.dao.dart';
// import '../model/objetoGenerico.dart';
// import 'package:http/http.dart' as http;
// import '../DAO/localStorage.dart';

// class ProdList extends StatefulWidget {
//   const ProdList({super.key});

//   @override
//   State<ProdList> createState() => _ProdListState();
// }

// class _ProdListState extends State<ProdList> {
//   final List<String> _listitem = [
//     'assets/imagens/icon_instagram.png',
//     'assets/imagens/icon_twitter.png',
//     'assets/imagens/icon_facebook.png',
//     'assets/imagens/icon_youtube.png',
//   ];

//   bool isCardEnabled = true;

//   List<ObjetoGenerico> _listNomesItens = [];

//   final List<String> _listExpl = [
//     'Aumenta 20% as chances de venda.',
//     'Diminui 15% as chances de venda.',
//     'Aumenta 25% as chances de venda.',
//     'Aumenta 5% as chances de venda.',
//   ];
//   bool _dadosCarregados = false;
//   String? nomeDoCanalParaCompra;
//   List<DadosCompra> dadosCompras = [];

//   @override
//   void initState() {
//     getDadosCompra();
//     super.initState();
//     loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_dadosCarregados) {
//       return Expanded(
//         flex: 5,
//         child: Container(
//           color: Colors.purple[50],
//           child: GridView.builder(
//             padding: const EdgeInsets.all(100),
//             itemCount: 4,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 70,
//               mainAxisSpacing: 20,
//             ),
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   if (_listNomesItens[index].ativo!) {
//                     print("Pressionou ${_listNomesItens[index]}");
//                   }
//                 },
//                 child: Card(
//                   color: _listNomesItens[index].ativo!
//                       ? Colors.grey
//                       : Colors.green[
//                           200], // Define a cor com base no estado 'ativo'
//                   elevation: 50.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 20,
//                             margin: EdgeInsets.only(bottom: 5, right: 5),
//                             child: GestureDetector(
//                               child: Image.asset(
//                                   'assets/imagens/icon_interrogacao.png'),
//                               onTap: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return Dialog(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(30.0),
//                                         ),
//                                         child: Container(
//                                           height: 300,
//                                           width: 300,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(15.0),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       _listExpl[index],
//                                                       style: TextStyle(
//                                                           fontSize: 15.0,
//                                                           color: Colors.black),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Container(
//                                                       child: TextButton(
//                                                           // shape:
//                                                           //     RoundedRectangleBorder(
//                                                           //         borderRadius:
//                                                           //             BorderRadius
//                                                           //                 .circular(
//                                                           //                     20.0)),
//                                                           // color: Colors.green,
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);
//                                                           },
//                                                           child: Text(
//                                                             "Ok",
//                                                             style: TextStyle(
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontSize: 15),
//                                                           )),
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 70,
//                             height: 70,
//                             child: Image.asset(_listitem[index]),
//                             margin: EdgeInsets.only(bottom: 5, top: 1),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             child: Text(_listNomesItens[index].nome!),
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               width: 30,
//                               height: 30,
//                               child: GestureDetector(
//                                 child: Image.asset(
//                                     'assets/imagens/icon_carrinho_compras.png'),
//                                 //     margin: EdgeInsets.only(bottom: 20),
//                                 onTap: () {
//                                   //captura o nome do canal ao clicar
//                                   nomeDoCanalParaCompra =
//                                       _listNomesItens[index].nome;
//                                   if (!_listNomesItens[index].ativo!) {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return Dialog(
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(50.0),
//                                             ),
//                                             child: Container(
//                                               height: 200,
//                                               width: 50,
//                                               child: Padding(
//                                                 padding: EdgeInsets.all(20.0),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Expanded(
//                                                           child: Container(
//                                                             child: Text(
//                                                               "Deseja comprar esse item?",
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontSize:
//                                                                       15.0),
//                                                             ),
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         Container(
//                                                           child: TextButton(
//                                                               // shape: RoundedRectangleBorder(
//                                                               //     borderRadius:
//                                                               //         BorderRadius
//                                                               //             .circular(
//                                                               //                 20.0)),
//                                                               // color: Colors.red,
//                                                               onPressed: () {
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               child: Text(
//                                                                 "Não",
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         15),
//                                                               )),
//                                                         ),
//                                                         Container(
//                                                           child: TextButton(
//                                                               // shape: RoundedRectangleBorder(
//                                                               //     borderRadius:
//                                                               //         BorderRadius
//                                                               //             .circular(
//                                                               //                 20.0)),
//                                                               // color: Colors.green,
//                                                               onPressed: () {
//                                                                 calcularImpactoAnuncio(
//                                                                     nomeDoCanalParaCompra!);
//                                                                 atualizacaoDosCampos(
//                                                                     _listNomesItens[
//                                                                             index]
//                                                                         .preco!,
//                                                                     nomeDoCanalParaCompra!);
//                                                                 Navigator.pop(
//                                                                     context);
//                                                                 setState(() {
//                                                                   _listNomesItens[
//                                                                               index]
//                                                                           .ativo =
//                                                                       true; // Desabilitar o card aqui
//                                                                 });
//                                                               },
//                                                               child: Text(
//                                                                 "Sim",
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         15),
//                                                               )),
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         });
//                                   } else {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return Dialog(
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(50.0),
//                                             ),
//                                             child: Container(
//                                               height: 200,
//                                               width: 50,
//                                               child: Padding(
//                                                 padding: EdgeInsets.all(20.0),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Expanded(
//                                                           child: Container(
//                                                             child: Text(
//                                                               "item comprado",
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontSize:
//                                                                       15.0),
//                                                             ),
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         Container(
//                                                           child: TextButton(
//                                                               // shape: RoundedRectangleBorder(
//                                                               //     borderRadius:
//                                                               //         BorderRadius
//                                                               //             .circular(
//                                                               //                 20.0)),
//                                                               // color: Colors.red,
//                                                               onPressed: () {
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               child: Text(
//                                                                 "Ok",
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         15),
//                                                               )),
//                                                         ),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         });
//                                   }
//                                 },
//                               )),
//                           Container(
//                               child: Text(
//                                 "RS: ${_listNomesItens[index].preco!.toStringAsFixed(2)}",
//                                 style: TextStyle(),
//                               ),
//                               margin: EdgeInsets.only(left: 10))
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       );
//     } else {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   }

//   void calcularImpactoAnuncio(String nomeAnuncio) async {
//     Usuario u = await buscarDadosUsuario();
//     int custoAnuncio = 0;

//     switch (nomeAnuncio) {
//       case 'Instagram':
//         custoAnuncio = 250;
//         break;
//       case 'Twitter':
//         custoAnuncio = 150;
//         break;
//       case 'Facebook':
//         custoAnuncio = 300;
//         break;
//       case 'Youtube':
//         custoAnuncio = 100;
//         break;
//       default:
//         break;
//     }

//     if (custoAnuncio > 0 && u.saldo! >= custoAnuncio) {
//       u.saldo = u.saldo! - custoAnuncio;
//       print(
//           "Anúncio $nomeAnuncio foi comprado por $custoAnuncio coins. ${u.saldo}");
//       // aplicar o impacto do anúncio
//     } else {
//       print("Saldo insuficiente para comprar o anúncio $nomeAnuncio.");
//     }
//   }

//   //Metodo GET de  de dadosCompra
//   Future<DadosCompra> getDadosCompra() async {
//     Usuario u = await buscarDadosUsuario();
//     print(u.uuid);
//     String url =
//         "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/dadosCompra/${u.uuid}/";

//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as Map<String, dynamic>;
//       final dadosCompra = DadosCompra.fromJson(json);
//       return dadosCompra;
//     } else {
//       throw Exception('Failed to load dados compra');
//     }
//   }

//   Future<void> loadData() async {
//     try {
//       DadosCompra dadosCompra = await getDadosCompra();
//       if (dadosCompra != null) {
//         setState(() {
//           _listNomesItens.add(ObjetoGenerico(
//               nome: 'Instagram',
//               preco: 250,
//               ativo: dadosCompra.canal_instagram));
//           _listNomesItens.add(ObjetoGenerico(
//               nome: 'Twitter', preco: 150, ativo: dadosCompra.canal_twitter));
//           _listNomesItens.add(ObjetoGenerico(
//               nome: 'Facebook', preco: 300, ativo: dadosCompra.canal_facebook));
//           _listNomesItens.add(ObjetoGenerico(
//               nome: 'Youtube', preco: 100, ativo: dadosCompra.canal_youtube));
//           _dadosCarregados = true;
//         });
//       }
//     } catch (error) {
//       print('erro ao add objt na lista de canais ');
//     }
//   }
// }

// Future<void> atualizacaoDosCampos(int valorSaldo, String nomeCampo) async {
//   try {
//     Usuario user = await buscarDadosUsuario();
//     if (user == null) {
//       return;
//     }
//     print(nomeCampo);

//     var novoSaldo = user.saldo! - valorSaldo;
//     var campo = converteCampo(nomeCampo);
//     await atualizaCompra(user.uuid, true, campo);
//     await atualizarDadosUsuario(novoSaldo);
//     await upadateValor(user.uuid, novoSaldo);
//     print('Saldo atualizado com sucesso!');
//   } catch (e) {
//     print('Ocorreu um erro: $e');
//   }
// }

// converteCampo(String campo) {
//   switch (campo) {
//     case 'Instagram':
//       return 'canal_instagram';
//     case 'Twitter':
//       return 'canal_twitter';
//     case 'Facebook':
//       return 'canal_facebook';
//     case 'Youtube':
//       return 'canal_youtube';
//     default:
//       return '';
//   }
// }
