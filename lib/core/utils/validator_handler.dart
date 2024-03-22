class ValidatorHandler {
  static String? Function(String?)? emailValidator = (String? txt){
    if(!txt!.contains("@")){
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
}