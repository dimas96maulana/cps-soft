import 'dart:async';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../service/service.dart';

part 'home/home_create_utils.dart';
part 'home/home_get_utils.dart';
part 'city/city_get_utils.dart';


Future checkConnectionPost({required Uri url, required Map<String, dynamic> paramsData})async{
  // ignore: prefer_typing_uninitialized_variables
  var result;
  try{
    result = await http.post(
      url,
      body: paramsData,
    ).timeout(ServiceLocal.durationRto);
  }on TimeoutException{
    result = ServiceLocal.timeoutException;
  }on SocketException{
    result = ServiceLocal.socketException;
  }

  return result;
}

Future checkConnectionGet({required Uri url})async{
  // ignore: prefer_typing_uninitialized_variables
  var result;
  try{
    result = await http.get(
      url,
    ).timeout(ServiceLocal.durationRto);
  }on TimeoutException{
    result = ServiceLocal.timeoutException;
  }on SocketException{
    result = ServiceLocal.socketException;
  }

  return result;
}