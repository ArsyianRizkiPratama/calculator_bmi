import 'package:flutter/material.dart';

//ini adalah pembentukan global variabel
//const menunjukan nilai program di bawah tidak akan berubah /constan
// ignore: use_full_hex_values_for_flutter_colors
const Color primaryColor = Color(0xff00a0e21);
TextStyle labelTextStyle =
    const TextStyle(fontSize: 18, color: Colors.white //Color(0xff8d8e98),
        );

TextStyle numberTextStyle = const TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const String underweightSevere = "Underweight (Severe thinness)";
const String underweightModerate = "Underweight (Moderate thinness)";
const String underweightMild = "Underweight (Mild thinness)";
const String normal = "Normal";
const String overweight = "Overweight";
const String obeseI = "Obese (Class I)";
const String obeseII = "Obese (Class II)";
const String obeseIII = "Obese (Class III)";
