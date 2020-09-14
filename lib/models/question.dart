class QuestionsModel{
  int _answer;
  List<String> _options;
  String _text;

  QuestionsModel.fromJson(Map<String, dynamic> parsedJson){
    _answer = parsedJson['answer'];
    _options = parsedJson['options'];
    _text = parsedJson['text'];
  }

  int get answer => _answer;
  List<String> get options => _options;
  String get text => _text;
}