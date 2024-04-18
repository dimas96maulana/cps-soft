part of '../controller.dart';

class CityGetController extends GetxController implements ControllerLocal{
  CityGetUtils cityGetUtils = CityGetUtils();

  @override
  RxBool isError = false.obs;
  @override
  RxBool isLoading = true.obs;
  @override
  String message = "";
  late CityGetModel cityGetModel;
  Future get() async{
    isError.value = false;
    isLoading.value = true;
    message = "";

    var result = await cityGetUtils.get();
    
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
        cityGetModel = CityGetModel.fromJson(data);
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