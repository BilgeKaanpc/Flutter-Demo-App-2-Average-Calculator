class Lesson{
  final String name;
  final double wordValue;
  final double creditValue;

  Lesson({required this.name, required this.wordValue, required this.creditValue});
  @override
  String toString() {
    return "$name $wordValue $creditValue";
  }
}