import 'QuestionClass.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _ques = [
    Question(
        question:
            'The \'19\' in Covid-19 stands for the year 2019 in which the virus starts spreading?',
        answer: true),
    Question(
        question:
            'As of now staying at home is the best way to be saved from Corona Virus ?',
        answer: true),
    Question(
        question: 'Corona Virus was first diagnosed in Macau?', answer: false),
    Question(
        question: 'Corona Virus was first diagnosed in Macau?', answer: false),
    Question(
        question: 'Corona Virus was first diagnosed in Macau?', answer: false),
    Question(
        question: 'Corona Virus was first diagnosed in Macau?', answer: false),
    Question(
        question: 'Corona Virus was first diagnosed in Macau?', answer: false),
    Question(
        question: 'Corona Virus was first diagnosed in Macau?', answer: false),
  ];

  void increQuestion() {
    if (_questionNumber < _ques.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
      print('quiz ends');
    }
  }

  bool endFile() {
    if (_questionNumber == _ques.length - 1)
      return true;
    else
      return false;
  }

  String returnQuestion() {
    return (_ques[_questionNumber].question);
  }

  bool returnAnswer() {
    return (_ques[_questionNumber].answer);
  }
}
