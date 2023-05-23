import 'package:flutter/material.dart';

import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  /**
   * Map is a data structure that stores a collection
   * of key-value pairs, where each key is unique.
   */ ///

  // final List<Map<String, String>>  is Type Inference
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          /**
           * The map() method creates a new list with the results
           */

          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
