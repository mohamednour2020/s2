class AppValidator{

 static appValidator({required String input,required ValidationType type}){
    if(type==ValidationType.email){
      if(input==""){
        return "this field is required";
      }
      else if(!regExpEmail.hasMatch(input)){
        return "invalid email";
      }
      else {
        return null;
      }
    }
   else if(type==ValidationType.phoneNumber){
      if(input==""){
        return "this field is required";
      }
      else if(input.length<11){
        return "must be 11 digits";
      }else if(input.length>11){
        return "invalid phone number";
      }
      else {
        return null;
      }
    }
   else if(type==ValidationType.password){
      if(input==""){
        return "this field is required";
      }
      else if(input.length<8){
        return "password must be 8 chars";
      }
      else {
        return null;
      }
    }
  }

}
RegExp regExpEmail =  RegExp(
  r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))+$',
  caseSensitive: false,
  multiLine: false,
);
enum ValidationType{email,phoneNumber,password}