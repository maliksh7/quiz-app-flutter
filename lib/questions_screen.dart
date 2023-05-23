import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// State  -> The logic and internal state for a [StatefulWidget].
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // storing the selected answer in the list
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      /**
       * setState() -> Calling [setState] notifies the framework that
       * the internal state of this object has changed in a way that
       * might impact the user interface in this subtree, which causes
       * the framework to schedule a [build] for this [State] object.
       */
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // as wide as the parent container allows.
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // widget centered along the main axis
          mainAxisAlignment: MainAxisAlignment.center,
          // widget centered along the cross axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            /**
             * The spread operator (...) is used to insert all the elements
             * of a list into another list.
             */

            /**
             * generates a list of AnswerButton widgets based
             * on the shuffled answers of the current question.
             * These widgets can be rendered in the UI to display
             * the answer choices to the user.
             */
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
