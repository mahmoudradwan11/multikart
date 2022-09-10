import 'package:flutter/material.dart';
import 'package:multikart/shared/styles/colors.dart';

Widget builtDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    color: Colors.grey,
    height: 1.0,
    width: double.infinity,
  ),
);


Widget textField({
  required TextEditingController controller,
  required TextInputType keyboard,
  required var valid,
  required String label,
  required IconData prefix,
  //IconData? suffix,
  bool show = true,
  var tap,
  var onchange,
  var onSubmit,
  var suffix,
  var suffixPress,
  var labelStyle,
}) =>
    TextFormField(
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: defaultColor),
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(icon: Icon(suffix), onPressed: suffixPress)
            : null,
      ),
      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      obscureText: show,
      onTap: tap,
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
);

Widget defButton({
  double width = double.infinity,
  double heigth = 40.0,
  // Color background = ,
  bool isUpper = true,
  required var function,
  required String text,
}) =>
    Container(
      height: heigth,
      width: width,
      decoration: BoxDecoration(
        color: defaultColor,
        //borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget textButton({
  required String text,
  required var function,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
