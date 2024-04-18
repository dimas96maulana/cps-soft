part of '../view.dart';

Widget homeWidgetBody({EdgeInsets? padding}){
  HomeGetController homeGetController = Get.find();
      
  Widget customCard({required int index}){
    Widget titleDescription({required String title, required String description}){
      Widget customTitle()=> Container(
        decoration: null,
        width: 90.w,
        child: Text(
          title,
          style: CustomFont.poppins12SemiBold(color: CustomColors.black),
        )
      );
      Widget customDescription()=> Text(
        description,
        style: CustomFont.poppins12Regular(color: CustomColors.black),
      );
      return Row(
        children: [
          customTitle(),
          const Text(": "),
          customDescription(),
        ],
      );
    }

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleDescription(
              title: "name",
              description: homeGetController.homeGetModel.result[index].name,
            ),
            titleDescription(
              title: "address",
              description: homeGetController.homeGetModel.result[index].address,
            ),
            titleDescription(
              title: "email",
              description: homeGetController.homeGetModel.result[index].email,
            ),
            titleDescription(
              title: "phoneNumber",
              description: homeGetController.homeGetModel.result[index].phoneNumber,
            ),
            titleDescription(
              title: "city",
              description: homeGetController.homeGetModel.result[index].city,
            ),
          ],
        ),
      ),
    );
  }

  return Obx(()=>(homeGetController.isLoading.value == false && homeGetController.isError.value == false)
    ? ListView.builder(
      padding: padding ?? const EdgeInsets.all(0),
      itemCount: homeGetController.homeGetModel.result.length,
      itemBuilder: (context, index) => customCard(index: index),
    )
    : const Center(
      child: CircularProgressIndicator(),
    ));
}