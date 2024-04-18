part of '../utils.dart';

class CityGetUtils{
  Future get() async{
    Uri url = Uri.parse("https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/city");

    return checkConnectionGet(
      url: url
    );
  }
}