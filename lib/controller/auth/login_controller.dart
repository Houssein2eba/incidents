import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController {
  final RxString phone = ''.obs;
  final RxString password = ''.obs;



  Future<void> login({required String phone, required String password}) async {
         final  response=await http.post(Uri.parse('http://89.0.142.86:8000/api/login'),body: {'phone':phone,'password':password});

         if(response.statusCode==200){
           print("evry thing is ok");
         }
  }

}