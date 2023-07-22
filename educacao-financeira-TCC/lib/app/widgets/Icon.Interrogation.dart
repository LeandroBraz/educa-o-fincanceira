import 'package:flutter/material.dart';

class IconInterrogation extends StatelessWidget {
  String texto;

  IconInterrogation({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(left: 30),
      child: GestureDetector(
        child: Image.asset('assets/imagens/icon_interrogacao.png'),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    height: 200,
                    // width: 50,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  texto,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: TextButton(
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         BorderRadius.circular(20.0)),
                                  // color: Colors.green,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Expanded(
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
