import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medi_queue_notify/widgets/add_certificate_form.dart';

import '../../Model/certificate.dart';

class StaffMemberDetailsPage extends StatefulWidget {
  const StaffMemberDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<StaffMemberDetailsPage> createState() => _StaffMemberDetailsPageState();
}

class _StaffMemberDetailsPageState extends State<StaffMemberDetailsPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

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

  // Opens a dialog to pick source
  void pickImageSource() async {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

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
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : null,
                      child: _selectedImage == null
                          ? const Icon(Icons.person, size: 60)
                          : null,
                    ),
                    const SizedBox(height: 16),

                    TextButton.icon(
                      onPressed: pickImageSource,
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Upload Image"),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.black26),
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Full Name',
                        hintText: 'Enter full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: 'Phone Number',
                        hintText: 'e.g., 9844756596',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'janedoe@example.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shift',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        //dropdown for Shift
                        DropdownButtonFormField<String>(
                          value: selectedShift,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                          hint: const Text('Select Shift'),
                          items: roles.map((String shift) {
                            return DropdownMenuItem<String>(
                              value: shift,
                              child: Text(shift),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedShift = value;
                            });
                          },
                        ),

                        SizedBox(height: 20),
                        const Text(
                          'Role',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        //dropdown for role
                        DropdownButtonFormField<String>(
                          value: selectedRole,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                          hint: const Text('Select Role'),
                          items: roles.map((String role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedRole = value;
                              selectedSpc = null;
                            });
                          },
                        ),

                        SizedBox(height: 20),
                        const Text(
                          'Specialist Area',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // dropdown for specialist area
                        DropdownButtonFormField<String>(
                          value: selectedSpc,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                          hint: const Text('Select Specialist Area'),
                          items: getSpc(selectedRole)!.map((String spec) {
                            return DropdownMenuItem<String>(
                              value: spec,
                              child: Text(spec),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedSpc = value;
                            });
                          },
                        ),

                        SizedBox(height: 30),
                        const Text(
                          'Certificate History',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Certificate Name')),
                              DataColumn(label: Text('Issue Date')),
                              DataColumn(label: Text('Status')),
                            ],
                            rows: certificates
                                .map(
                                  (c) => DataRow(
                                    cells: [
                                      DataCell(Text(c.name)),
                                      DataCell(
                                        Text(
                                          "${c.issueDate.year}-${c.issueDate.month.toString().padLeft(2, '0')}-${c.issueDate.day.toString().padLeft(2, '0')}",
                                        ),
                                      ),
                                      DataCell(
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: c.status == "Active"
                                                ? Colors.blue
                                                : c.status == "Expired"
                                                ? Colors.red
                                                : Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Text(
                                            c.status,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
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
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Save Staff Details',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00AEEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
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

  List<String>? getSpc(String? role) {
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
