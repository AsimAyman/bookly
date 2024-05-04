class ValidatorHandler {
  static String? Function(String?)? emailValidator = (String? txt){
    if(!txt!.contains("@") || !txt.contains(".")){
      return "You should enter valid email";
    }else if (txt.trim().contains(" ")){
      return "Email should not have spaces";
    }else if (txt.isEmpty){
      return "Email is Required";
    }else{
      return null;
    }
  };


  static String? Function(String?)? passwordValidator = (String? txt){
    if(txt!.length < 6){
      return "Password should be more than 6 chars";
    }else if (txt.contains(" ")){
      return "Password should not have spaces";
    }else if (txt.isEmpty) {
      return "Password is Required";
    }else{
      return null;
    }
  };

  static String? Function(String?)? phoneValidator = (String? txt){
    if(txt!.isEmpty){
      return "This Field is Required";
    }else if(txt.length != 11){
      return "You Have to Enter Valid Phone Number";
    }else{
      return null;
    }
  };
  static String? Function(String?)? cityValidator = (String? txt){
    if(txt!.isEmpty){
      return "This Field is Required";
    }else if(txt.length > 16){
      return "City Should be Less than 16 char";
    }else{
      return null;
    }
  };

  static String? Function(String?)? otherValidator = (String? txt){
    if(txt!.isEmpty){
      return "This Field is Required";
    }else if (txt.contains(" ")){
      return "Can't Enter Spaces between text in this field";
    }else{
      return null;
    }
  };
  static String? Function(String?)? titleValidator = (String? txt) {
    if (txt == null || txt.isEmpty) {
      return "This Field is Required";
    } else if (txt.trim().isEmpty) {
      return "Can't Enter Spaces between text in this field";
    } else if (txt.length < 4) {
      return "Title must be at least 4 characters long";
    } else if (txt.length > 100) {
      return "Title must not exceed 100 characters";}
    else {
  return null;
  }
};
  static String? Function(String?)? descriptionValidator = (String? description) {
    if (description == null || description.isEmpty) {
      return "Description is required";
    } else if (description.length < 20) {
      return "Description must be at least 20 characters long";
    } else if (description.length > 500) {
      return "Description must not exceed 500 characters";
    } else {
      return null;
    }
  };

  static String? Function(String?)? priceValidator = (String? price) {
    if (price == null || price.isEmpty) {
      return "Price is required";
    }

    // Remove leading and trailing whitespace
    price = price.trim();

    // Check if the price can be parsed as a double
    if (double.tryParse(price) == null) {
      return "Invalid price format";
    }

    // Check if the price is greater than or equal to zero
    double parsedPrice = double.parse(price);
    if (parsedPrice < 5) {
      return "Price cannot be Less than 5";
    }

    // Additional checks specific to your application can be added here

    return null;
  };

  static String? Function(String?)? nameValidator = (String? txt){
    if(txt!.isEmpty){
      return "This Field is Required";
    }else if (txt.length < 3){
      return "Enter longer name please";
    }else{
      return null;
    }
  };

}