import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);

  final double bmi;

  //
  String determineBmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue >= 16.0 && bmiValue < 17.0) {
      category = underweightModerate;
    } else if (bmiValue >= 17.0 && bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue >= 18.5 && bmiValue < 25.0) {
      category = normal;
    } else if (bmiValue >= 25.0 && bmiValue < 30.0) {
      category = overweight;
    } else if (bmiValue >= 30.0 && bmiValue < 35.0) {
      category = obeseI;
    } else if (bmiValue >= 35.0 && bmiValue < 40.0) {
      category = obeseII;
    } else if (bmiValue >= 40.0) {
      category = obeseIII;
    }

    return category;
  }

  String getHealRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (Healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood preasure, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood preasure, diabetes mellitus.";
        break;
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDesc = getHealRiskDescription(bmiCategory);

    return Scaffold(
      appBar: AppBar(
        //Pembuatan AppBar
        title: Text("Hasil Hitung BMI"), //Judul dari Halaman Result
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          child: Center(
            child: Text(
              "Hasil Perhitungan",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    textAlign: TextAlign
                        .center, // untuk mengatur tulisan hasil di tengah
                    determineBmiCategory(bmi),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${bmi.toStringAsFixed(1)}", //ini berguna untuk menentukan mau berapa angka dai belakang koma.
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    bmiDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
            // widget untuk perpindahan atau sebagai button
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80, //Untuk mengatur ketinggian 100px dari bawah screen
              color: Color.fromARGB(255, 13, 102, 175),
              child: Center(
                  child: Text(
                "Hitung Ulang",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )), //"Center" berguna untuk membuat teks ada di tengah
            )),
      ]),
    );
  }
}
