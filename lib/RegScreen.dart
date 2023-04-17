import 'package:flutter/material.dart';
import 'package:pet_care/main.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  String getRoute() => "RegScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(40, 60, 20, 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Register\nwith\nPetCura",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 37),
                        ),
                        Image.asset("assets/Dog Sit.png"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Your Name :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    TextInput("Enter your name"),
                    SizedBox(height: 15),
                    Text(
                      "Phone Number :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    TextInput("Enter phone number"),
                    SizedBox(height: 15),
                    Text(
                      "Pet's Name :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    TextInput("Enter your pet's name"),
                    SizedBox(height: 15),
                    Text(
                      "Pet's Breed :",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    TextInput("Enter your pet's breed"),
                  ],
                ),
                SizedBox(height: 70),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    MaterialButton(
                      // style: ElevatedButton.styleFrom(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(16.0),
                      //   ),
                      // ),
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      color: Color.fromARGB(255, 189, 189, 189),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, HomePage().getRoute());
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // Image.asset("assets/Rabbit_peeking.png"),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Container TextInput(String hint) {
    // TextInput();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
