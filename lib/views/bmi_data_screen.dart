import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  //untuk mengatur slider dibawah merupakan pembuatan variabel
  int height = 100;

  int weight = 50;
  int age = 20;

  String? gender;
  //fungsi perhitungan
  double calculateBmi() {
    //konfersi ke meter
    double heightInMeter = height / 100;

    // (heightInMeter * heightInMeter) = pow(height, 2)
    final bmi = weight / (heightInMeter * heightInMeter);

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("BMI Calculator"), // Title Appbar-nya
      ), //Bagian App Barnya

      // Bagian Struktur Badan halaman data screen
      body: Column(
        children: [
          //Program di bawah adalah container yang berisi Gender
          Expanded(
              child: Row(
            children: [
              //Program di bawah merupakan bagian Expanded unruk male
              Expanded(
                //Column di pake karena nanti setiap gander punya logo dan text female or male
                child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "male") ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.male,
                      title: 'Male',
                    ),
                  ),
                ), //untuk membuat margin Box decorationnya biar gak terlalu mepet
              ),

              //Program dibawah adalah bagian "Expanded" untuk female.
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "female") ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.female,
                      title: 'Female',
                    ),
                  ),
                ),
              ),
            ],
          )),

          //Bagian Pengatur tinggi orang dengan slider
          Expanded(
              child: BmiCard(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HEIGHT",
                style: labelTextStyle.copyWith(
                  //mengambil style yang sama namun ingin mengatur parameter yang berbeda
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .end, //untuk membuat tulisan cm ada di bawah bukan tengah
                children: [
                  Text(
                    "$height", //$ merupakan interpolasi, karena height merupakan variabel double, jadi tidak bisa di taruh disana dan harus dalam bentuk string
                    style: numberTextStyle,
                  ),
                  Text(
                    "cm",
                    style: labelTextStyle,
                  ),
                ],
              ),
              Slider(
                value: height
                    .toDouble(), //disini height awalnya adalah integer, namun disini dia harus double, jadi di konversi ke double
                min: 80,
                max: 200,
                activeColor: Colors.blue, // warna garis birunya
                thumbColor: Colors.lightBlue,
                onChanged: (value) {
                  height = value
                      .toInt(); //karena sebelumnya value merupakan double dan kita ingin dia adalah integer saat di tampilkan, maka value di kembalikan ke dalam integer
                  setState(
                      () {}); //setState berguna untuk membuat slider dapat di geser
                },
              )
            ],
          ))),

          //Bagian Weight dan AGe
          Expanded(
              child: Row(children: [
            //pembuatan bagian Weight
            Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    Text(
                      "$weight",
                      style: numberTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: (() {
                            weight = weight + 1; //bisa juga wight += 1;
                            setState(() {});
                          }),
                          elevation: 0,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          fillColor: const Color(
                              0xff212747), //mengatur warna lingkaran
                          constraints: const BoxConstraints.tightFor(
                            //mengatur besar lingkaran
                            width: 56,
                            height: 56,
                          ),
                        ),

                        //memberikan jarak antara lingkaran
                        const SizedBox(
                          width: 10,
                        ),

                        RawMaterialButton(
                          onPressed: (() {
                            weight = weight - 1; //bisa juga wight -= 1;
                            setState(() {});
                          }),
                          elevation: 0,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          fillColor: const Color(
                              0xff212747), //mengatur warna lingkaran
                          constraints: const BoxConstraints.tightFor(
                            //mengatur besar lingkaran
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Bagian Age
            Expanded(
                child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AGE",
                    style: labelTextStyle,
                  ),
                  Text(
                    "$age",
                    style: numberTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: (() {
                          age = age + 1; //bisa juga age += 1;
                          setState(() {});
                        }),
                        elevation: 0,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(),
                        fillColor:
                            const Color(0xff212747), //mengatur warna lingkaran
                        constraints: const BoxConstraints.tightFor(
                          //mengatur besar lingkaran
                          width: 56,
                          height: 56,
                        ),
                      ),

                      //memberikan jarak antara lingkaran
                      const SizedBox(
                        width: 10,
                      ),

                      RawMaterialButton(
                        onPressed: (() {
                          age = age - 1; //bisa juga age -= 1;
                          setState(() {});
                        }),
                        elevation: 0,
                        // ignore: sort_child_properties_last
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(),
                        fillColor:
                            const Color(0xff212747), //mengatur warna lingkaran
                        constraints: const BoxConstraints.tightFor(
                          //mengatur besar lingkaran
                          width: 56,
                          height: 56,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ])),
          GestureDetector(
              // widget untuk perpindahan atau sebagai button
              onTap: () {
                print(calculateBmi());
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return BmiResultScreen(
                        bmi: calculateBmi(),
                      ); // halaman yang dituju ketika button di tekan
                    }),
                  ),
                );
              },
              child: Container(
                height: 80, //Untuk mengatur ketinggian 100px dari bawah screen
                color: Color.fromARGB(255, 13, 102, 175),
                child: Center(
                    child: Text(
                  "Hitung BMI",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )), //"Center" berguna untuk membuat teks ada di tengah
              )),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff272A4E),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor! //memaksa kalo dia tidak null
              ),
        ),
        margin: EdgeInsets.all(
            15), //untuk membuat margin Box decorationnya biar gak terlalu mepet
        child: child);
  }
}

//Bagian widget yang di buat
class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

//Membuat input
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      //Column di pake karena nanti setiap gander punya logo dan text female or male
      mainAxisAlignment: MainAxisAlignment.center, //Mengatur posisi di tengah
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ), //Icon
        const SizedBox(
          height: 15,
        ),
        Text(title, style: labelTextStyle), //Text
      ],
    );
  }
}
