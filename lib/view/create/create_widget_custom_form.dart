part of '../view.dart';

Widget createWidgetCustomForm({required String label, EdgeInsetsGeometry? padding, required TextEditingController controller}){
  Widget customForm()=> Expanded(
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: label
      ),
    )
  );
  return Padding(
    padding: padding ?? const EdgeInsets.all(0),
    child: Row(
      children: [
        // customTitle(),
        customForm(),
      ],
    ),
  );
}