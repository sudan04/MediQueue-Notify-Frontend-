import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/medicine.dart';
import 'package:medi_queue_notify/widgets/custom_text_form_field.dart';

import '../../../Model/certificate.dart';

class AddMedicineForm extends StatefulWidget {
  final void Function(Medicine) onAdd;

  const AddMedicineForm({super.key, required this.onAdd});

  @override
  State<AddMedicineForm> createState() => _AddMedicineFormState();
}

class _AddMedicineFormState extends State<AddMedicineForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sController = TextEditingController();

  String? schedule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Add Medicine",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              // Medicine name
              CustomTextFormField(
                labelText: "Medicine Name",
                hintText: "Enter Medicine Name",
                keyboardType: TextInputType.text,
                controller: _nameController,

                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter name' : null,
              ),

              const SizedBox(height: 16),

              // Medicine name
              CustomTextFormField(
                labelText: "Schedule",
                hintText: "Enter use schedule",
                keyboardType: TextInputType.text,
                controller: _sController,

                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter schedule' : null,
              ),

              SizedBox(height: 8),
              // Add button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final med = Medicine(
                        name: _nameController.text,
                        schedule: _sController.text,
                      );
                      widget.onAdd(med);
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.add_circle),
                  label: const Text("Add Medicine"),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
