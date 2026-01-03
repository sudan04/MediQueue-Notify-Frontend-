import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/welcome_page.dart';
import 'package:medi_queue_notify/shared/widgets/custom_date_picker.dart';
import 'package:medi_queue_notify/shared/widgets/custom_dropdown.dart';
import 'package:medi_queue_notify/shared/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/shared/widgets/custom_image_picker.dart';
import 'package:medi_queue_notify/shared/widgets/custom_password_field.dart';
import 'package:medi_queue_notify/shared/widgets/custom_radio_selector.dart';
import 'package:medi_queue_notify/shared/widgets/custom_text_form_field.dart';
import 'package:medi_queue_notify/shared/widgets/custom_time_picker.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? _selectedImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ddController = TextEditingController();

  final List<String> genderOptions = ["Male", "Female", "Other"];
  String? selectedGender;

  final List<String> hospitalOptions = [
    "Hospital A",
    "Hospital B",
    "Hospital C",
  ];
  String? selectedHospital;

  final List<String> branches = ["Branch A", "Branch B", "Branch C"];
  String? selectedBranch;

  final List<String> patientTypes = ["Inpatient", "Outpatient"];
  String? selectedPatient;

  final List<String> specialists = ["Sp A", "Sp B", "Sp C"];
  String? selectedSpcialist;

  final List<String> doctors = ["Doctor A", "Doctor B", "Doctor C"];
  String? selectedDoctor;

  DateTime? selectedDate;

  TimeOfDay? selectedTime;

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            "Create Your Account",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        titleSpacing: 0,
        toolbarHeight: 40,
        centerTitle: true,
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Join MediQueue Notify to streamline your healthcare experience",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                CustomImagePicker(
                  onImagePicked: (file) {
                    setState(() {
                      _selectedImage = file;
                    });
                  },
                ),

                SizedBox(height: 20),

                // Name field
                CustomTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  labelText: "Full Name",
                  hintText: "Enter your Full Name",
                ),

                const SizedBox(height: 20),

                // Gender radio options
                CustomRadioSelector(
                  radioOptions: genderOptions,
                  selectedItem: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  labelText: "Gender",
                ),

                const SizedBox(height: 20),

                // age field
                CustomTextFormField(
                  controller: ageController,
                  labelText: "Age",
                  hintText: "Enter your Age",
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.calendar_today_outlined,
                ),

                SizedBox(height: 20),

                // phone number
                CustomTextFormField(
                  controller: phoneController,
                  labelText: "Phone Number",
                  hintText: "e.g., 9844732345",
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.phone,
                ),

                SizedBox(height: 20),

                CustomPasswordField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Create a secure password",
                ),

                SizedBox(height: 20),
                // hospital dropdown
                CustomDropdown(
                  value: selectedHospital,
                  items: hospitalOptions,
                  itemBuilder: (hospitalName) => Text(hospitalName),
                  onChanged: (value) => setState(() {
                    selectedHospital = value;
                  }),
                  labelText: "Hospital",
                  hintText: "Select Hospital",
                ),

                SizedBox(height: 20),

                // hospital branch dropdown
                CustomDropdown(
                  value: selectedBranch,
                  items: branches,
                  itemBuilder: (branchName) => Text(branchName),
                  onChanged: (value) => setState(() {
                    selectedBranch = value;
                  }),
                  labelText: "Hospital Branch",
                  hintText: "Select Hospital Branch",
                ),

                SizedBox(height: 20),

                // patient type dropdown
                CustomDropdown(
                  value: selectedPatient,
                  items: patientTypes,
                  itemBuilder: (patientType) => Text(patientType),
                  onChanged: (value) => setState(() {
                    selectedPatient = value;
                  }),
                  labelText: "Patient Type",
                  hintText: "Select Patient Type",
                ),

                if (selectedPatient != null &&
                    selectedPatient!.isNotEmpty &&
                    selectedPatient == "Inpatient") ...[
                  SizedBox(height: 20),
                  // doctor specialist dropdown
                  CustomDropdown(
                    value: selectedSpcialist,
                    items: specialists,
                    itemBuilder: (spcs) => Text(spcs),
                    onChanged: (value) => setState(() {
                      selectedSpcialist = value;
                    }),
                    labelText: "What specialist are you looking for",
                    hintText: "Select specialist",
                  ),

                  SizedBox(height: 20),

                  // select doctor dropdown
                  CustomDropdown(
                    value: selectedDoctor,
                    items: doctors,
                    itemBuilder: (doctor) => Text(doctor),
                    onChanged: (value) => setState(() {
                      selectedDoctor = value;
                    }),
                    labelText: "Select Doctor",
                    hintText: "Select Doctor",
                  ),

                  SizedBox(height: 20),

                  CustomDatePicker(
                    labelText: "Appointment date",
                    selectedDate: selectedDate,
                    onDateSelected: (datePicked) {
                      setState(() {
                        selectedDate = datePicked;
                      });
                    },
                  ),

                  SizedBox(height: 20),

                  CustomTimePicker(
                    labelText: "Time",
                    selectedTime: selectedTime,
                    onTimeSelected: (timePicked) {
                      setState(() {
                        selectedTime = timePicked;
                      });
                    },
                  ),
                ],

                SizedBox(height: 20),
                // description field
                CustomTextFormField(
                  controller: ddController,
                  labelText: "Disease Details (Optional)",
                  hintText:
                      "Briefly describe any relevant medical conditions or chronic diseases",
                  keyboardType: TextInputType.multiline,
                  prefixIcon: Icons.description,
                  maxLine: 2,
                ),

                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CustomElevatedButton(
                    icon: Icons.person_add_alt_1,
                    label: "Sign Up",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
