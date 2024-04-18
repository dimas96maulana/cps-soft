part of '../view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeGetController homeGetController = Get.put(HomeGetController());
  CityGetController cityGetController = Get.put(CityGetController());

  RxBool isFilterName = false.obs;
  RxList dataListFilterName = [].obs;

  void initData(){
    homeGetController.get();
    cityGetController.get();
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar()=> AppBar(
      title: const Text("List Data"),
      backgroundColor: CustomColors.blue,
    );

    Widget body(){
      Widget formFilterName()=> homeWidgetFormFilterName(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.h,
          bottom: 5.h,
        ),
        onChanged: (value){
          if(value == ""){
            isFilterName.value = false;
          } else{
            isFilterName.value = true;
            dataListFilterName.value = homeGetController.homeGetModel.result.where((element) => element.name.toUpperCase().contains(value.toUpperCase())).toList();
          }
        },
      );

      Widget dataEndpoint()=> Expanded(
        child: homeWidgetBody(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
        )
      );

      Widget dataFilterName()=> Expanded(
        child: homeWidgetBodyFilterName(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          data: dataListFilterName
        )
      );

      Widget customBody()=> Obx(()=>(isFilterName.value == true)
        ? dataFilterName()
        : dataEndpoint());

      return Column(
        children: [
          formFilterName(),
          customBody(),
        ],
      );
    }

    Widget floatingActionButton()=> FloatingActionButton(
      backgroundColor: CustomColors.blue,
      child: Icon(
        Icons.create,
        color: CustomColors.white,
      ),
      onPressed: (){
        // FocusManager.instance.primaryFocus?.unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Create(),
          )
        ).then((value){
          initData();
        });
      }
    );

    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: floatingActionButton()
    );
  }
}