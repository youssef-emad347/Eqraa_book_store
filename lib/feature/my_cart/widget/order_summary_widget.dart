import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatelessWidget {
  final double itemTotal;
  final double discount;
  final double grandTotal;

  const OrderSummaryWidget({
    super.key,
    required this.itemTotal,
    required this.discount,
    required this.grandTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSummaryRow("Item Total", "\$${itemTotal.toStringAsFixed(2)}"),
        const SizedBox(height: 10),
        _buildSummaryRow("Discount", "\$${discount.toStringAsFixed(2)}", isDiscount: true),
        const Divider(height: 30),
        _buildSummaryRow(
          "Grand Total",
          "\$${grandTotal.toStringAsFixed(2)}",
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isDiscount = false, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 15,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 15,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}
