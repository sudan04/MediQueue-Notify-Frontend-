import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/patient/widgets/add_medicine_form.dart';
import 'package:medi_queue_notify/pages/patient/widgets/medicine_schedule_table.dart';
import 'package:medi_queue_notify/utils/lists.dart';
import 'package:medi_queue_notify/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/widgets/custom_outline_button.dart';
import 'package:medi_queue_notify/widgets/custom_radio_selector.dart';
import 'package:medi_queue_notify/widgets/custom_text_form_field.dart';

class EditPatientDetails extends StatefulWidget {
  const EditPatientDetails({super.key});

  @override
  State<EditPatientDetails> createState() => _EditPatientDetailsState();
}

class _EditPatientDetailsState extends State<EditPatientDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ddController = TextEditingController();
  final TextEditingController mediNoteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedGender;

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                "Edit patient Details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                "Update patient information and doctor notes",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Patient Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  //  name field
                  CustomTextFormField(
                    controller: nameController,
                    labelText: "Full Name",
                    hintText: "Patient Full Name",
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 20),
                  // gender
                  CustomRadioSelector(
                    selectedItem: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    radioOptions: ["Male", "Female", "Other"],
                    labelText: "Gender",
                  ),
                  SizedBox(height: 20),
                  // Age
                  CustomTextFormField(
                    controller: ageController,
                    labelText: "Age",
                    hintText: "Enter patient's age",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  // phone
                  CustomTextFormField(
                    controller: phoneController,
                    labelText: "Enter phone number",
                    hintText: "e.g., 9834756697",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  // disease details
                  CustomTextFormField(
                    maxLine: 3,
                    controller: ddController,
                    labelText: "Disease Details",
                    hintText: "Enter patients disease details",
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 16),

                  // doctor's notes
                  Text(
                    "Doctor's Notes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  SizedBox(height: 8),
                  Text(
                    "Required Medicine and Consumption Schedule",
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 8),
                  // medicine table
                  MedicineScheduleTable(medicines: Lists.medicines),

                  // add medicine button
                  Center(
                    child: ElevatedButton(
                      onPressed: _showAddMedicineForm,
                      child: Text("Add Medicine"),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Medication notes
                  CustomTextFormField(
                    controller: mediNoteController,
                    labelText: "Medication Notes",
                    hintText: "Write Medication Note",
                    keyboardType: TextInputType.text,
                    maxLine: 2,
                  ),

                SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CustomElevatedButton(
                    icon: Icons.save,
                    label: "Save Changes",
                    onPressed: (){}
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // method for creating AddCertificate form
  void _showAddMedicineForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddMedicineForm(
        onAdd: (med) {
          setState(() {
            Lists.medicines.add(med);
          });
        },
      ),
    );
  }
}
