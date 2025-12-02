import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medi_queue_notify/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/widgets/custom_image_picker.dart';
import 'package:medi_queue_notify/widgets/custom_text_form_field.dart';

class CreateTenant extends StatefulWidget {
  const CreateTenant({super.key});

  @override
  State<CreateTenant> createState() => _CreateTenantState();
}

class _CreateTenantState extends State<CreateTenant> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tenantNameController = TextEditingController();
  TextEditingController tenantEmailController = TextEditingController();
  TextEditingController tenantWebsiteController = TextEditingController();
  TextEditingController tenantContactController = TextEditingController();

  TextEditingController adminNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPhoneController = TextEditingController();
  TextEditingController adminUsernameController = TextEditingController();

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Tenant Creation",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 228, 243, 242),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: SizedBox(
                          child: Text(
                            "This page facilities the creation of new tenants and ensure their successful integration into the system",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(221, 131, 119, 119),
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
        
                    SizedBox(height: 20),
                    // tenant name
                    CustomTextFormField(
                      controller: tenantNameController,
                      labelText: "Enter Name",
                      hintText: "Enter name of tenant",
                      keyboardType: TextInputType.text,
                    ),
        
                    SizedBox(height: 20),
        
                    // Email field
                    CustomTextFormField(
                      controller: tenantEmailController,
                      labelText: "Enter Email",
                      hintText: "Enter email of tenant",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
        
                    //website field
                    CustomTextFormField(
                      controller: tenantWebsiteController,
                      labelText: "Enter Website",
                      hintText: "Enter website of tenant",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
        
                    //contact field
                    CustomTextFormField(
                      controller: tenantNameController,
                      labelText: "Enter Contact",
                      hintText: "Enter contact of tenant",
                      keyboardType: TextInputType.phone,
                    ),
        
                    SizedBox(height: 20),
                    // tenant logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tenant Logo",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
        
                    SizedBox(height: 10),
        
                    // logo picker
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImagePicker(
                              isLogo: true,
                              onImagePicked: (file) {
                                setState(() {
                                  _selectedImage = file;
                                });
                              },
                            ),
        
                            const SizedBox(width: 20),
        
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Upload tenant logo",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "JPEG, PNG format, up to 10MB",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(height: 30),
                    // tenant admin info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Text(
                          "Tenant Admin Info",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
        
                        Text(
                          "General information for tenant admin",
                          style: TextStyle(color: Colors.grey),
                        ),
        
                        SizedBox(height: 20),
        
                        // admin full name field
                        CustomTextFormField(
                          controller: adminNameController,
                          labelText: "Full Name",
                          hintText: "Enter admin's full name",
                          keyboardType: TextInputType.text,
                        ),
        
                        SizedBox(height: 20),
                        // admin email field
                        CustomTextFormField(
                          controller: adminEmailController,
                          labelText: "Email Address",
                          hintText: "abc@gmail.com",
                          keyboardType: TextInputType.emailAddress,
                        ),
        
                        SizedBox(height: 20),
        
                        // admin username field
                        CustomTextFormField(
                          controller: adminUsernameController,
                          labelText: "Username",
                          hintText: "Enter admin's username",
                          keyboardType: TextInputType.text,
                        ),
        
                        SizedBox(height: 20),
                        // admin phone field
                        CustomTextFormField(
                          controller: adminEmailController,
                          labelText: "Phone Number",
                          hintText: "Phone Number",
                          keyboardType: TextInputType.emailAddress,
                        ),
        
                        SizedBox(height: 20),
                      ],
                    ),
        
                    // submit button
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        label: "Submit",
                        onPressed: () {},
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
}
