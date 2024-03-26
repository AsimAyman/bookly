
enum Grade{
  thePrimaryGrades,
  theMiddleGrade,
  highGrade,
}

class GradeHandler{
  static List<String> allGrade = [
    getStringFromEnum(Grade.thePrimaryGrades),
    getStringFromEnum(Grade.theMiddleGrade),
    getStringFromEnum(Grade.highGrade),
  ];
  static String getStringFromEnum(Grade grade) {
    switch (grade) {
      case Grade.thePrimaryGrades:
        return 'General';
      case Grade.theMiddleGrade:
        return 'Educational';
      case Grade.highGrade:
        return 'High grade';
    }}
}