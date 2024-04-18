part of '../view.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    HomeCreateController homeCreateController = Get.put(HomeCreateController());
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerAddress = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPhoneNumber = TextEditingController();
    TextEditingController controllerCity = TextEditingController();

    PreferredSizeWidget appBar()=> AppBar(
      title: const Text("Create Data"),
      backgroundColor: CustomColors.blue,
    );

    Widget body()=> Column(
      children: [
        createWidgetCustomForm(
          controller: controllerName,
          label: "Name",
          padding: EdgeInsets.only(
            top: 10.h,
            left: 20.w,
            right: 20.w,
            bottom: 10.h,         
          ),
        ),
        createWidgetCustomForm(
          controller: controllerAddress,
          label: "Address",
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,         
          ),
        ),
        createWidgetCustomForm(
          controller: controllerEmail,
          label: "Email",
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,         
          ),
        ),
        createWidgetCustomForm(
          controller: controllerPhoneNumber,
          label: "PhoneNumber",
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,         
          ),
        ),
        createWidgetCustomForm(
          controller: controllerCity,
          label: "City",
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,         
          ),
        ),
      ],
    );

    Widget floatingActionButton()=> FloatingActionButton(
      backgroundColor: CustomColors.blue,
      child: Icon(
        Icons.add,
        color: CustomColors.white,
      ),
      onPressed: (){
        FocusManager.instance.primaryFocus?.unfocus();
        if(controllerName.text == ""){
          widgetFluttertoast(title: "Name empty");
        } else if(controllerAddress.text == ""){
          widgetFluttertoast(title: "Address empty");
        } else if(controllerEmail.text == ""){
          widgetFluttertoast(title: "Email empty");
        } else if(controllerPhoneNumber.text == ""){
          widgetFluttertoast(title: "PhoneNumber empty");
        } else if(controllerCity.text == ""){
          widgetFluttertoast(title: "city empty");
        } else{
          showDialog(
            context: context,
            builder: (context) => const PopScope(
              canPop: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );

          Map<String, dynamic> paramsData = {
            "name": controllerName.text,
            "address": controllerAddress.text,
            "email": controllerEmail.text,
            "phoneNumber": controllerPhoneNumber.text,
            "city": controllerCity.text
          };
          homeCreateController.post(paramsData: paramsData).then((value){
            Navigator.pop(context);
            if(homeCreateController.isError.value == true){
              widgetFluttertoast(title: homeCreateController.message);
            }else{
              Navigator.pop(context);
            }
          });
        }
      },
    );

    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: floatingActionButton(),
    );
  }
}