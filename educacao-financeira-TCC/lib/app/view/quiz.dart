import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:app_educacao_financeira/app/view/ResultadoQuiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Usuario.model.dart';

class Quiz extends StatefulWidget {
  const Quiz(this.user, {Key? key}) : super(key: key);
  final Usuario user;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    List quiz = [
      {
        "pergunta": "Qual é o resultado do trabalho?",
        "resposta": ["Consumo", "Capital", "Produção", "Força"],
        "alternativa_correta": 3,
      },
      {
        "pergunta": "O que são fatores de produção?",
        "resposta": [
          "Terra, capital e força",
          "Terra, capital e consumo",
          "Terra, capital e trabalho",
          "Terra, trabalho e consumo"
        ],
        "alternativa_correta": 3,
      },
      {
        "pergunta": "Qual é o ato de comprar de forma exagerada?",
        "resposta": ["Economia", "Consumismo", "Socialismo", "Educação"],
        "alternativa_correta": 2,
      },
      {
        "pergunta": "Qual é o conceito relacionado à abundância?",
        "resposta": ["Poupar", "Crédito", "Economia", "Riqueza"],
        "alternativa_correta": 4,
      },
      {
        "pergunta": "Qual a remuneração cobrada pelo empréstimo de dinheiro?",
        "resposta": ["Juros", "Crédito", "Poupança", "Riqueza"],
        "alternativa_correta": 1,
      },
      {
        "pergunta": "Tudo que recebemos ou ganhamos é chamado de?",
        "resposta": ["Despesa", "Receita", "Riqueza", "Poupança"],
        "alternativa_correta": 2,
      },
      {
        "pergunta": "Tudo o que se gasta ou perde é chamado de?",
        "resposta": ["Despesa", "Receita", "Juros", "Fluxo de Caixa"],
        "alternativa_correta": 1,
      },
      {
        "pergunta": "O que é lucro?",
        "resposta": [
          "Receitas maiores que as despesas",
          "Receitas iguais que as despesas.",
          "Receitas menores que despesas",
          "Nenhuma das Alternativas"
        ],
        "alternativa_correta": 1,
      },
      {
        "pergunta": "O que é prejuízo?",
        "resposta": [
          "Receitas maiores que as despesas",
          "Receitas iguais que as despesas.",
          "Receitas menores que despesas",
          "Nenhuma das Alternativas"
        ],
        "alternativa_correta": 3,
      },
      {
        "pergunta": "O que é o fluxo de caixa?",
        "resposta": [
          "Entradas ",
          "recursos e a disponibilidade de capital",
          "Saídas ",
          "Todas opções"
        ],
        "alternativa_correta": 4,
      },
    ];

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]["alternativa_correta"] == respostaNumero) {
          print("acertou");
          acertos++;
        } else {
          print("errou");
          erros++;
        }
        print("acertos : $acertos erros totais: $erros");

        if (perguntaNumero == 10) {
          print("terminou o quiz");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Resultado(acertos, widget.user)));
        } else {
          perguntaNumero++;
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.green[800],

        leading: Container(),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       setState(() {});
        //     },
        //     icon: const Icon(Icons.refresh),
        //   ),
        // ],
        title: const Text('Responda ao quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Pergunta $perguntaNumero de 10 ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                quiz[perguntaNumero - 1]["pergunta"],
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[300]),
                  ),
                  onPressed: () {
                    print("pressionado 1");
                    respondeu(1);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["resposta"][0],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[300]),
                  ),
                  onPressed: () {
                    print("pressionado 2");
                    respondeu(2);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["resposta"][1],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[300]),
                  ),
                  onPressed: () {
                    print("pressionado 3");
                    respondeu(3);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["resposta"][2],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[300]),
                  ),
                  onPressed: () {
                    print("pressionado 4");
                    respondeu(4);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]["resposta"][3],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
