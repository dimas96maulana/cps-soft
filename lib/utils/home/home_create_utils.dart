
part of '../utils.dart';

class HomeCreateUtils{

  /// paramsData = {"name":"", "address":"", "email":"", "phoneNumber":"", "city":""}
  Future post({required Map<String, dynamic> paramsData}) async{
    Uri url = Uri.parse("https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user");

    return checkConnectionPost(
      url: url,
      paramsData: paramsData,
    );
  }
}