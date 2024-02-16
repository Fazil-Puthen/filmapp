import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> addnewuser(
  String name,
  String password,
  String phone,
  String mail,
 String profession)async{

    const  FlutterSecureStorage storage=FlutterSecureStorage();
    String? savedname= await storage.read(key: 'username');
    String? savedpass=await storage.read(key: 'password');
    if(savedname==name && savedpass==password){
      return false;
    }

    await storage.write(key: 'username', value: name);
    await storage.write(key: 'password', value: password);
    await storage.write(key: 'phonenumber', value: phone);
    await storage.write(key: 'email', value:mail);
    await storage.write(key: 'profession', value: profession);
    return true;
}