void main() {


  List<Map<String, dynamic>> students = [
    {"name": "Akash", "scores": [33, 55, 48]},
    {"name": "Mamun", "scores": [35, 85, 65]},
    {"name": "Jasim", "scores": [70, 95, 72]},
  ];

  Map<String, double> studentAverages = {};

  for (var student in students) {
    String name = student['name'];
    List<int> scores = List<int>.from(student['scores']);
    double average = scores.reduce((a, b) => a + b) / scores.length;
    studentAverages[name] = double.parse(average.toStringAsFixed(2));
  }

  var sortedEntries = studentAverages.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  Map<String, double> sortedMap = {
    for (var entry in sortedEntries) entry.key: entry.value
  };
  print(sortedMap);
}
