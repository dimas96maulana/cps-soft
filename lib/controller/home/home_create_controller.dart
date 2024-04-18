part of '../controller.dart';

class HomeCreateController extends GetxController implements ControllerLocal{
  HomeCreateUtils homeCreateUtils = HomeCreateUtils();
  
  @override
  RxBool isError = false.obs;
  @override
  RxBool isLoading = true.obs;
  @override
  String message = "";
  /// paramsData = {"name":"", "address":"", "email":"", "phoneNumber":"", "city":""}
  Future post({required Map<String, dynamic> paramsData}) async{
    isError.value = false;
    isLoading.value = true;
    message = "";

    var result = await homeCreateUtils.post(paramsData: paramsData);

    checkController(
      result: result,
      message: (value){
        message = value;
        isError.value = true;
        isLoading.value = false;
      },
      success: (){
        isError.value = false;
        isLoading.value = false;
      },
      error: (){
        isError.value = true;
        isLoading.value = false;
        message = "Error";
      }
    );
  }

}