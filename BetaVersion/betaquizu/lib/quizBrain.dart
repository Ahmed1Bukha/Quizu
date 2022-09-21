class quizBrain {
  quizBrain(this.listOfQuestions);

  final listOfQuestions;

  String getMainQuestion(int indexNumber) {
    return listOfQuestions[indexNumber]["Question"];
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

  bool verifyAnswer(String key, int indexNumber) {
    if (key == listOfQuestions[indexNumber]["answer"]) {
      return true;
    } else {
      return false;
    }
    ; 
  }
}
