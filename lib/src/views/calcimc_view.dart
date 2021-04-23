import 'package:conversor_imc_flutter/src/views/components/espacamento_h.dart';
import 'package:conversor_imc_flutter/src/views/components/espacamento_w.dart';
import 'package:conversor_imc_flutter/src/views/components/titulo2.dart';
import 'package:flutter/material.dart';

class CalcIMC extends StatefulWidget {
  @override
  _CalcIMCState createState() => _CalcIMCState();
}

class _CalcIMCState extends State<CalcIMC> {
  double peso = 0;
  double altura = 0;
  double calcular = 0;
  String calculoImc = "";
  var resultado = TextEditingController();
  String resultadoText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                EspacamentoH(h: 20),
                Image.asset(
                  'assets/images/icon_imc.png',
                  width: 200,
                  height: 200,
                ),

                Titulo2(txt: "Calculadora IMC:"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Peso:
                    Expanded(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Peso'),
                          onChanged: (value) {
                            peso = double.tryParse(value) ?? 0.00;
                            // Fazer as verificações:
                          },
                        )),
                    // Container de espaçamento:
                    EspacamentoW(w: 10),
                    // Altura
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Altura'),
                        onChanged: (value) {
                          altura = double.tryParse(value) ?? 0.00;
                          // Fazer as verificações:
                        },
                      ),
                    ),
                  ],
                ),
                // Container de espaçamento:
                EspacamentoH(h: 20),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          var imc;
                          imc = peso / (altura * altura);
                          if (imc < 16) {
                            calculoImc = 'Magreza severa';
                          } else if (imc < 17) {
                            calculoImc = 'Magreza moderada';
                          } else if (imc < 18.5) {
                            calculoImc = 'Magreza leve';
                          } else if (imc < 25) {
                            calculoImc = 'Magreza normal';
                          } else if (imc < 30) {
                            calculoImc = 'Sobrepeso';
                          } else if (imc < 35) {
                            calculoImc = ' Obsesidade grau 1';
                          } else if (imc < 40) {
                            calculoImc = ' Obsesidade grau 2';
                          }
                          setState(() {
                            resultadoText = imc.toStringAsFixed(2);
                          });
                        },
                        child: Text("CALCULAR"))),

                Titulo2(
                  txt: "Resultado:  $resultadoText $calculoImc",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
