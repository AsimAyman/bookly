enum BookCondition {
  usedLikeNew,
  usedGood,
  usedAcceptable,
}

class BookConditionHandler {
  static List<String> allBookConditions = [
    getStringFromEnum(BookCondition.usedLikeNew),
    getStringFromEnum(BookCondition.usedGood),
    getStringFromEnum(BookCondition.usedAcceptable),

  ];
  static String getStringFromEnum(BookCondition condition) {
    switch (condition) {
      case BookCondition.usedLikeNew:
        return 'Used Like New';
      case BookCondition.usedGood:
        return 'Used Good';
      case BookCondition.usedAcceptable:
        return 'Used Acceptable';
    }
  }
}
