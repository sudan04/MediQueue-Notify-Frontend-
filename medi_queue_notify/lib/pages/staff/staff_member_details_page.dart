import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medi_queue_notify/Model/staff.dart';
import 'package:medi_queue_notify/pages/staff/widgets/certificate_data_table.dart';
import 'package:medi_queue_notify/pages/staff/widgets/add_certificate_form.dart';
import 'package:medi_queue_notify/widgets/custom_dropdown.dart';
import 'package:medi_queue_notify/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/widgets/custom_image_picker.dart';
import 'package:medi_queue_notify/widgets/custom_text_form_field.dart';

import '../../Model/certificate.dart';

class StaffMemberDetailsPage extends StatefulWidget {
  const StaffMemberDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<StaffMemberDetailsPage> createState() => _StaffMemberDetailsPageState();
}

class _StaffMemberDetailsPageState extends State<StaffMemberDetailsPage> {
  File? _selectedImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // options for specialist area
  List<String> doctorSpcs = [
    "Surgery",
    "Pediatrics",
    "Neurology",
    "Radiology",
    "Psychiatry",
  ];
  List<String> nurseSpcs = [
    "General Nursing",
    "Critical Care",
    "Surgical",
    "Emergency",
    "Oncology",
  ];
  List<String> staffSpcs = [
    "Laboratory Technician",
    "Radiology Technician",
    "Medical",
    "Dietitian",
    "Administrative Staff",
  ];

  String? selectedSpc;

  // options for role
  List<String> roles = ["Doctor", "Nurse", "Supporting Staff"];

  String? selectedRole;

  // options for shift
  List<String> shifts = ["Morning", "Day", "Evening", "Night"];

  String? selectedShift;

  List<Certificate> certificates = [
    Certificate(
      name: "CPR Certification",
      issueDate: DateTime(2023, 1, 15),
      status: "Active",
    ),
    Certificate(
      name: "Advanced Life Support",
      issueDate: DateTime(2022, 5, 20),
      status: "Expired",
    ),
    Certificate(
      name: "Infection Control",
      issueDate: DateTime(2023, 3, 10),
      status: "Active",
    ),
  ];

  // Form controllers
  final TextEditingController certNameController = TextEditingController();
  DateTime? selectedDate;
  String? selectedStatus;

  // method for creating AddCertificate form
  void _showAddCertificateForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddCertificateForm(
        onAdd: (newCert) {
          setState(() {
            certificates.add(newCert);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff Member Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImagePicker(
                      onImagePicked: (file) {
                        setState(() {
                          _selectedImage = file;
                        });
                      },
                    ),

                    SizedBox(height: 20),

                    // name field
                    CustomTextFormField(
                      prefixIcon: Icons.person,
                      controller: nameController,
                      labelText: 'Full Name',
                      hintText: 'Enter full name',
                      keyboardType: TextInputType.name,
                    ),

                    const SizedBox(height: 20),

                    // phone field
                    CustomTextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.phone,
                      labelText: 'Phone Number',
                      hintText: 'e.g., 9844756596',
                    ),

                    const SizedBox(height: 20),

                    //email field
                    CustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.email,
                      labelText: 'Email',
                      hintText: 'janedoe@example.com',
                    ),

                    SizedBox(height: 20),

                    CustomDropdown(
                      value: selectedShift,
                      items: shifts,
                      itemBuilder: (item) => Text(item),
                      onChanged: (value) {
                        setState(() {
                          selectedShift = value;
                        });
                      },
                      labelText: "Shift",
                      hintText: "Select Shift",
                    ),

                    SizedBox(height: 20),
                    // role dropdown
                    CustomDropdown(
                      value: selectedRole,
                      items: roles,
                      itemBuilder: (item) => Text(item),
                      onChanged: (value) => selectedRole = value,
                      labelText: "Role",
                      hintText: "Select Role",
                    ),

                    SizedBox(height: 20),

                    // dropdown for specialist area
                    CustomDropdown(
                      value: selectedSpc,
                      items: getSpc(selectedRole),
                      itemBuilder: (item) => Text(item),
                      onChanged: (value) => selectedSpc = value,
                      labelText: "Specialist Area",
                      hintText: "Select Specialist Area",
                    ),

                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Certificate History',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // certificate data table
                        CertificateDataTable(certificates: certificates),
                        const SizedBox(height: 12),
                      ],
                    ),
                    // add certificate button
                    Center(
                      child: ElevatedButton(
                        onPressed: _showAddCertificateForm,
                        child: Text("Add Certificate"),
                      ),
                    ),

                    SizedBox(height: 20),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        icon: Icons.save,
                        label: "Save Staff Details",
                        onPressed: () {
                          final Staff staff = Staff(
                            name: nameController.text,
                            role: selectedRole,
                            shift: selectedShift,
                            status: selectedStatus,
                            imageUrl: _selectedImage.toString(),
                          );
                          Navigator.pop(context, staff);
                        },
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

  List<String> getSpc(String? role) {
    if (role == "Doctor") {
      return doctorSpcs;
    } else if (role == "Nurse") {
      return nurseSpcs;
    } else if (role == "Supporting Staff") {
      return staffSpcs;
    }
    return List.empty();
  }
}
