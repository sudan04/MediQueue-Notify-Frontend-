import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/welcome_page.dart';
import 'package:medi_queue_notify/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/widgets/custom_password_field.dart';
import 'package:medi_queue_notify/widgets/custom_radio_selector.dart';
import 'package:medi_queue_notify/widgets/custom_text_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ddController = TextEditingController();

  final List<String> genderOptions = ["Male", "Female", "Other"];
  String? selectedGender;

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

                // description field
                CustomTextFormField(
                  controller: ageController,
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
