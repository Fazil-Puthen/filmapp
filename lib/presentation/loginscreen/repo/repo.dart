import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> logincheck(String name,String pass)async{
  print('called the login function');
   const FlutterSecureStorage storage=FlutterSecureStorage();
   String? username= await storage.read(key: 'username');
   String? password= await storage.read(key: 'password');
   
   print('got the username $username');
   print('got the pass $password');
   print('the given username $name, $pass');
   if(username==name  && password==pass){
    return true;
   }
   else{
    return false;
   }
}