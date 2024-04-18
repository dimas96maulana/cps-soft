part of '../view.dart';

Widget homeWidgetFormFilterName({EdgeInsetsGeometry? padding, required Function(String value) onChanged}){

  return Padding(
    padding: padding ?? const EdgeInsets.all(0),
    child: TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            width: 0.1
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r)
        ),
      ),
    ),
  );
}