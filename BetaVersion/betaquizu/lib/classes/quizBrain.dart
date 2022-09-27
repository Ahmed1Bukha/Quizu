class QuizBrain {
  QuizBrain(this.listOfQuestions);

  final listOfQuestions;

  String getMainQuestion(int indexNumber) {
    if (indexNumber >= 30) {
      return " ";
    } else {
      return listOfQuestions[indexNumber]["Question"];
    }
  }

  Map getAllOptions(int indexNumber) {
    final Map<String, String> options = {
      "a": listOfQuestions[indexNumber]["a"],
      "b": listOfQuestions[indexNumber]["b"],
      "c": listOfQuestions[indexNumber]["c"],
      "d": listOfQuestions[indexNumber]["d"],
    };

    return options;
  }

  bool verifyAnswer(String symbol, int indexNumber) {
    if (symbol == listOfQuestions[indexNumber]["correct"]) {
      return true;
    } else {
      return false;
    }
  }

  int returnLength() {
    return listOfQuestions.length;
  }
}
