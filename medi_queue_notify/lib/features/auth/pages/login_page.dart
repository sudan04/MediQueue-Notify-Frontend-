import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_queue_notify/features/auth/bloc/auth_bloc.dart';
import 'package:medi_queue_notify/features/auth/pages/signup_page.dart';
import 'package:medi_queue_notify/features/dashboard/pages/home_page.dart';
import 'package:medi_queue_notify/pages/welcome_page.dart';
import 'package:medi_queue_notify/core/utils/validators.dart';
import 'package:medi_queue_notify/shared/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/shared/widgets/custom_outline_button.dart';
import 'package:medi_queue_notify/shared/widgets/custom_password_field.dart';
import 'package:medi_queue_notify/shared/widgets/custom_radio_selector.dart';
import 'package:medi_queue_notify/shared/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final Map<String, String> types = {
    "Super Admin": "SUPER_ADMIN",
    "Users": "USERS",
    "Patient": "PATIENTS",
  };
  String? _selectedType;

  bool isLoading = false;
  bool isPasswordVisible = false;

  // credentials for demo
  final String validPhone = '9800000000';
  final String validPassword = 'password123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset('assets/images/medique_logo.jpg', height: 150),
                    const SizedBox(height: 16),

                    // App Title
                    const Text(
                      'MediQueue Notify',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 20,
                      endIndent: 20,
                    ),

                    const SizedBox(height: 20),
                    CustomRadioSelector(
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value;
                        });
                      },
                      selectedItem: _selectedType,
                      radioOptions: types.keys.toList(),
                      labelText: "Type",
                    ),
                    SizedBox(height: 20),

                    // Phone Number field
                    CustomTextFormField(
                      prefixIcon: Icons.phone,
                      controller: phoneController,
                      labelText: "Phone Number",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      validator: Validators.validatePhone,
                    ),

                    const SizedBox(height: 20),

                    // Password field
                    CustomPasswordField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                    const SizedBox(height: 40),

                    // Log In button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthFailure) {
                            print(state.errMsg);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login failed")),
                            );
                          }

                          if (state is AuthSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.response.message),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomePage(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator.adaptive(
                                  strokeWidth: 3,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            );
                          }

                          return CustomElevatedButton(
                            icon: Icons.login,
                            label: "Log In",
                            onPressed: () {
                              final ph = phoneController.text.trim();
                              final pass = passwordController.text.trim();
                              final type = types[_selectedType];
                              context.read<AuthBloc>().add(
                                LoginRequested(
                                  ph: ph,
                                  password: pass,
                                  type: type!.toLowerCase(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Sign Up button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: CustomOutlineButton(
                        icon: Icons.person_add_alt_1,
                        label: "Sign Up",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        ),
                        borderColor: Colors.lightGreen,
                        textColor: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fix errors')));
      return;
    }
  }
}
