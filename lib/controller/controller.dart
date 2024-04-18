import 'dart:convert';

import 'package:get/get.dart';

import '../model/city/city_get_model.dart';
import '../model/home/home_get_model.dart';
import '../service/service.dart';
import '../utils/utils.dart';

part 'city/city_get_controller.dart';
part 'home/home_create_controller.dart';
part 'home/home_get_controller.dart';

abstract class ControllerLocal{
  String message = "";
  RxBool isError = false.obs;
  RxBool isLoading = true.obs;
}

void checkController({required var result, required Function(String) message, required Function success, required Function error}){
  if(result == ServiceLocal.timeoutException){
    message(ServiceLocal.messageTimeout);
  } else if(result == ServiceLocal.socketException){
    message(ServiceLocal.messageSocket);
  } else if(result.statusCode == 200 || result.statusCode == 201){
    success();
  } else{
    error();
  }
}