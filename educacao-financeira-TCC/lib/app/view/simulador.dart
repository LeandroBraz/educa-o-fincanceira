import 'package:flutter/material.dart';
import 'dart:math';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  TextEditingController _percentageController = TextEditingController();
  TextEditingController _increaseController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  String _simulationResult = '';
  bool _isSimulationDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulação de Venda'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _percentageController,
              enabled: !_isSimulationDone,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Porcentagem de venda (20-60%)'),
            ),
            TextField(
              controller: _increaseController,
              enabled: !_isSimulationDone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Aumento da porcentagem'),
            ),
            TextField(
              controller: _priceController,
              enabled: !_isSimulationDone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço de compra'),
            ),
            TextField(
              controller: _quantityController,
              enabled: !_isSimulationDone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade de produtos'),
            ),
            ElevatedButton(
              onPressed: _isSimulationDone ? null : _simulate,
              child: Text('Simular'),
            ),
            SizedBox(height: 16.0),
            Text(
              _simulationResult,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void _simulate() {
    double minPercentage = 20;
    double maxPercentage = 60;
    double increase = double.tryParse(_increaseController.text) ?? 0;
    double price = double.tryParse(_priceController.text) ?? 0;
    int quantity = int.tryParse(_quantityController.text) ?? 0;

    Random random = Random();
    double randomPercentage = minPercentage +
        random.nextInt(maxPercentage.toInt() - minPercentage.toInt() + 1);

    double simulatedPercentage = randomPercentage + increase;

    double totalCost = price * quantity;
    double sellingPrice = price * 1.5;
    double totalRevenue = sellingPrice * (simulatedPercentage / 100) * quantity;
    double profit = totalRevenue - totalCost;

    int quantitySold = (quantity * simulatedPercentage / 100).toInt();
    int remainingQuantity = quantity - quantitySold;

    setState(() {
      _isSimulationDone = true;
      _simulationResult = 'Valor gasto: R\$ ${totalCost.toStringAsFixed(2)}\n'
          'Quantidade de produtos vendidos: $quantitySold\n'
          'Valor total das vendas arrecadados: R\$ ${totalRevenue.toStringAsFixed(2)}\n'
          'Lucro: R\$ ${profit.toStringAsFixed(2)}';

      // Update the remaining quantity in the input field
      _quantityController.text = remainingQuantity.toString();
    });
  }
}
