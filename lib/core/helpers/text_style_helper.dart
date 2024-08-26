import 'package:alarm_app/core/helpers/color_helper.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyleHelper{
  static const TextStyle font16whiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font16disableMedium = TextStyle(
    color: AppColorHelper.disableColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font18whiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font18disableMedium = TextStyle(
    color: AppColorHelper.disableColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font36WhiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );


  static const TextStyle font36disableMedium = TextStyle(
    color: AppColorHelper.disableColor,
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font24BlackMedium = TextStyle(
    color: AppColorHelper.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );


}