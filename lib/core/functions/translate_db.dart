
import 'package:incidents/core/services/services.dart';
import 'package:get/get.dart';

translateDb(columnar,columnfr) {

  Myservice storage =Get.find();

  if(storage.sharedPreferences.getString("lang") == 'ar'){
    return columnar;
  }else{
    return columnfr;
  }

}