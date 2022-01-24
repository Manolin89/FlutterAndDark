import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double sepndingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingPctOfTotal, this.sepndingAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Column(
        children: <Widget>[
          Container(
            height: constrain.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${sepndingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constrain.maxHeight * 0.05,
          ),
          Container(
            height: constrain.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromARGB(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constrain.maxHeight * 0.15,
          ),
          Container(
            height: constrain.maxHeight * 0.05,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
