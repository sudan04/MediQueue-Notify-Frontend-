import 'package:flutter/material.dart';
import 'package:medi_queue_notify/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/widgets/custom_text_form_field.dart';

class PatientHandover extends StatefulWidget {
  const PatientHandover({super.key});

  @override
  State<PatientHandover> createState() => _PatientHandoverState();
}

class _PatientHandoverState extends State<PatientHandover> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController criNotesController = TextEditingController();
  TextEditingController medUpdtadeController = TextEditingController();
  TextEditingController actItemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Patient Handover",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.description)),
          IconButton(onPressed: () {}, icon: Icon(Icons.link)),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Patient Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.person),
                      ],
                    ),
                    SizedBox(height: 20),

                    // patient id
                    CustomTextFormField(
                      controller: idController,
                      labelText: "Patient ID",
                      hintText: "Unique identifier for the patient.",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    //patient name
                    CustomTextFormField(
                      controller: nameController,
                      labelText: "Patient Name",
                      hintText: "Full name of the patient.",
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Critical Notes & Updates",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.description_outlined),
                      ],
                    ),

                    SizedBox(height: 20),

                    // critical notes
                    CustomTextFormField(
                      controller: criNotesController,
                      labelText: "Critical Notes",
                      hintText:
                          "Urgent information requiring immediate attention.",
                      keyboardType: TextInputType.text,
                      maxLine: 2,
                    ),

                    SizedBox(height: 20),

                    //medication updates
                    CustomTextFormField(
                      controller: medUpdtadeController,
                      labelText: "Medication Updates",
                      hintText:
                          "Any changes or additions to medication regimen.",
                      keyboardType: TextInputType.text,
                      maxLine: 2,
                    ),

                    SizedBox(height: 20),

                    //action items
                    CustomTextFormField(
                      controller: medUpdtadeController,
                      labelText: "Action Items",
                      hintText:
                          "Tasks or follow-up actions for the incomming staff.",
                      keyboardType: TextInputType.text,
                      maxLine: 2,
                    ),

                    SizedBox(height: 40),
                    //save button
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        icon: Icons.save,
                        label: "Save Handover",
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
