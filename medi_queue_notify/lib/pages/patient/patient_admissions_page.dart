import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/patient/widgets/date_range_picker.dart';
import 'package:medi_queue_notify/widgets/custom_dropdown.dart';
import 'widgets/search_field.dart';
import 'widgets/patient_data_table.dart';

class PatientAdmissionsPage extends StatefulWidget {
  final List patients;

  const PatientAdmissionsPage({super.key, required this.patients});

  @override
  State<PatientAdmissionsPage> createState() => _PatientAdmissionsPageState();
}

class _PatientAdmissionsPageState extends State<PatientAdmissionsPage> {
  TextEditingController searchController = TextEditingController();
  DateTimeRange? selectedRange;
  String selectedType = "All Types";

  final List<String> typeOptions = ["All Types", "Inpatient", "Outpatient"];

  @override
  Widget build(BuildContext context) {
    List filtered = widget.patients.where((p) {
      bool matchesSearch = p.name.toLowerCase().contains(
        searchController.text.toLowerCase(),
      );

      bool matchesType = selectedType == "All Types" || p.type == selectedType;

      bool matchesDate = true;

      if (selectedRange != null) {
        DateTime date = DateTime.parse(p.admissionDate);
        matchesDate =
            date.isAfter(selectedRange!.start) &&
            date.isBefore(selectedRange!.end);
      }

      return matchesSearch && matchesType && matchesDate;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Patient Admissions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            // Custom search field
            SearchField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            // Custom date range picker
            DateRangePickerField(
              range: selectedRange,
              onTap: () async {
                DateTimeRange? picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                if (picked != null) {
                  setState(() {
                    selectedRange = picked;
                  });
                }
              },
            ),

            const SizedBox(height: 12),

            // Custom type filter
            CustomDropdown(
              itemBuilder: (type) => Text(type),
              items: typeOptions,
              value: selectedType,
              labelText: "Patient Type",
              hintText: selectedType,
              onChanged: (value) => setState(() => selectedType = value!),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  handleDiscardFilter();
                });
              },
              child: Text("Discard filters", style: TextStyle(color: Colors.blue),),
            ),
            const SizedBox(height: 15),
            // Custom table widget
            Expanded(child: PatientDataTable(patients: filtered)),
          ],
        ),
      ),
    );
  }

  void handleDiscardFilter() {
    searchController.clear();
    selectedRange = null;
    selectedType = "All Types";
  }
}
