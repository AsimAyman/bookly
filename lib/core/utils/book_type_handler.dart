enum BookType{
general,
 educational
}
class BookTypeHandler {
 static List<String> bookTypes = ['General','Educational'];
 static String getStringFromEnum(BookType bookType) {
  switch (bookType) {
   case BookType.general:
    return 'General';
   case BookType.educational:
    return 'Educational';

  }
 }
}