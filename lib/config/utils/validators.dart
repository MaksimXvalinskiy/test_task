class Validators{

  static bool isEmailValid(email) =>
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);


  static bool isNameValid(name){
    if(name.length > 0 && name.length < 36){
      for(int i = 0; i < name.length; i++){
        if(name[i] != " "){
          return true;
        }
      }
      return false;
    }else return false;
  }

  static bool isTextValid(text){
    if(text.length > 0 && text.length < 250){
      for(int i = 0; i < text.length; i++){
        if(text[i] != " "){
          return true;
        }
      }
      return false;
    }else return false;
  }
}