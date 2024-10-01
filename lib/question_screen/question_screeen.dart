import 'package:flutter/material.dart';
import 'package:quiz/view/dummy_db.dart';

class QuestionScreeen extends StatefulWidget {
  const QuestionScreeen({super.key});

  @override
  State<QuestionScreeen> createState() => _QuestionScreeenState();
}

class _QuestionScreeenState extends State<QuestionScreeen> {
  int questionindex = 0;
  int? selectedAnswerindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Text(
            "${questionindex + 1} / ${DummyDb.questionList.length}",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    DummyDb.questionList[questionindex]["question"],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Column(
              children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  selectedAnswerindex = index;
                  setState(() {});
                  print(selectedAnswerindex);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selectedAnswerindex == index
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DummyDb.questionList[questionindex]["options"][index],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (questionindex < DummyDb.questionList.length - 1) {
                      questionindex++;
                      setState(() {});
                    } else {
                      // navigate to result screen
                    }
                  },
                  child: Text("Next"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
