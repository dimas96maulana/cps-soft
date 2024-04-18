part of '../view.dart';

Widget homeWidgetBodyFilterName({EdgeInsets? padding, required List data}){
      
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
              description: data[index].name,
            ),
            titleDescription(
              title: "address",
              description: data[index].address,
            ),
            titleDescription(
              title: "email",
              description: data[index].email,
            ),
            titleDescription(
              title: "phoneNumber",
              description: data[index].phoneNumber,
            ),
            titleDescription(
              title: "city",
              description: data[index].city,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: prefer_is_empty
  return (data.length == 0)
    ? Center(
        child: Text(
          "Nama Tidak Ditemukan",
          style: CustomFont.poppins12Regular(color: CustomColors.black),
        ),
      )
    : ListView.builder(
      padding: padding ?? const EdgeInsets.all(0),
      itemCount: data.length,
      itemBuilder: (context, index) => customCard(index: index),
    );
}