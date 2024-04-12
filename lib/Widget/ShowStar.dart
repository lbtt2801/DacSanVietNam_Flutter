import 'package:flutter/material.dart';

// Hiện số sao
Row starNumber(double numberSao) {
  return Row(
      children: List.generate(5, // Số sao bạn muốn hiển thị
          (index) {
    if (index <= numberSao.toInt() - 1) {
      return const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 35,
        weight: 15,
      );
    } else {
      if (numberSao % 1 >= 0.5 && index == numberSao.toInt()) {
        return const Icon(
          Icons.star_half,
          color: Colors.yellow,
          size: 35,
          weight: 15,
        );
      }
      return const Icon(
        Icons.star_border,
        color: Colors.yellow,
        size: 35,
        weight: 15,
      );
    }
  }));
}
