
import 'package:fluttertoast/fluttertoast.dart';

import '../colors/colors.dart';

widgetFluttertoast({required String title})=> Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: CustomColors.blue,
    textColor: CustomColors.white,
    fontSize: 16.0
);