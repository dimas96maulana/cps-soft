part of '../controller.dart';

class HomeGetController extends GetxController implements ControllerLocal{
  HomeGetUtils homeGetUtils = HomeGetUtils();
  
  @override
  RxBool isError = false.obs;
  @override
  RxBool isLoading = true.obs;
  @override
  String message = "";
  late HomeGetModel homeGetModel;
  Future get() async{
    isError.value = false;
    isLoading.value = true;
    message = "";

    var result = await homeGetUtils.get();

    checkController(
      result: result,
      message: (value){
        message = value;
        isError.value = true;
        isLoading.value = false;
      },
      success: (){
        Map<String, dynamic> data ={
          "result": jsonDecode(result.body)
        };
        homeGetModel = HomeGetModel.fromJson(data);
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