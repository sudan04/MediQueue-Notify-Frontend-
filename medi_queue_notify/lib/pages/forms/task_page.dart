import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/task.dart';
import 'package:medi_queue_notify/utils/lists.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final List<String> residents = ["Pravesh", "Sujan", "Nisil"];
  String? selectedResident;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final List<String> priorities = ["High", "Medium", "Low"];
  String? selectedPriority;

  final List<String> roles = ["Doctor", "Nurse", "Supporting Staff"];
  String? selectedRole;

  final List<String> repeat = [
    "Repeated every weekday",
    "Once in a month",
    "Rarely",
    "Everyday",
  ];
  String? selectedRepeat;

  final List<String> occurancePerDay = ["Once", "More than once"];
  String? selectedOcc;

  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  TimeOfDay? selectedStartTime;

  TimeOfDay? selectedEndTime;

  TextEditingController hourController = TextEditingController();
  TextEditingController minController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Add Task",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //dropdown for resident
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Resident', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedResident,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                        hint: const Text('Select Resident'),
                        items: residents.map((String resident) {
                          return DropdownMenuItem<String>(
                            value: resident,
                            child: Text(resident),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedResident = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.task),
                      labelText: 'Title',
                      hintText: 'Task title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descController,
                    keyboardType: TextInputType.text,
                    maxLines: 2,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.description),
                      labelText: 'Description',
                      hintText: 'Enter description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //dropdown for priority
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Priority', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedPriority,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                        hint: const Text('Select Priority'),
                        items: priorities.map((String priority) {
                          return DropdownMenuItem<String>(
                            value: priority,
                            child: Text(priority),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedPriority = value;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  //dropdown for Role
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Assigned To', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
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
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  //dropdown for task repeat time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How often does this task occur?',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedRepeat,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                        hint: const Text('Select Task Frequency'),
                        items: repeat.map((String repeat) {
                          return DropdownMenuItem<String>(
                            value: repeat,
                            child: Text(repeat),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedRepeat = value;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // start date picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Date', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) {
                            setState(() => _selectedStartDate = picked);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 12),
                              Text(
                                _selectedStartDate != null
                                    ? "${_selectedStartDate!.year}-${_selectedStartDate!.month.toString().padLeft(2, '0')}-${_selectedStartDate!.day.toString().padLeft(2, '0')}"
                                    : "Select Start Date",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // end date picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Date', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) {
                            setState(() => _selectedEndDate = picked);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 12),
                              Text(
                                _selectedEndDate != null
                                    ? "${_selectedEndDate!.year}-${_selectedEndDate!.month.toString().padLeft(2, '0')}-${_selectedEndDate!.day.toString().padLeft(2, '0')}"
                                    : "Select End Date",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How often does this task occur/day"),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedOcc,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                        hint: const Text('Occurrences per day'),
                        items: occurancePerDay.map((String occ) {
                          return DropdownMenuItem<String>(
                            value: occ,
                            child: Text(occ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedOcc = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // start time picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Time', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () async {
                          TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: selectedStartTime ?? TimeOfDay.now(),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedStartTime = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.access_time),
                              const SizedBox(width: 12),
                              Text(
                                selectedStartTime != null
                                    ? selectedStartTime!.format(context)
                                    : "Select Start Time",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  if (selectedOcc != "Once" && selectedOcc != null) ...[
                    // end time picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('End Time', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: selectedEndTime ?? TimeOfDay.now(),
                            );

                            if (picked != null) {
                              setState(() {
                                selectedEndTime = picked;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.access_time),
                                const SizedBox(width: 12),
                                Text(
                                  selectedEndTime != null
                                      ? selectedEndTime!.format(context)
                                      : "Select End Time",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Repeat time picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Repeat Every",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Hour input
                            Expanded(
                              child: TextFormField(
                                controller: hourController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Hours',
                                  hintText: '0',
                                  prefixIcon: const Icon(Icons.timer_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Minute input
                            Expanded(
                              child: TextFormField(
                                controller: minController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Minutes',
                                  hintText: '0',
                                  prefixIcon: const Icon(Icons.timer),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Card(
                            color: Colors.blue.shade50,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Text(
                                "Enter how often the task repeats (e.g. every 2 hours 30 minutes)",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                  ],
                  // buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.person_add_alt_1),
                          label: const Text(
                            'Discard',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor: Colors.black87,
                          ),
                          onPressed: () {
                            _clearForm();
                          },
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.login, color: Colors.white),
                          label: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00AEEF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            handleSubmit();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    hourController.dispose();
    minController.dispose();
    super.dispose();
  }

  void _clearForm() {
    titleController.clear();
    descController.clear();
    hourController.clear();
    minController.clear();

    setState(() {
      selectedResident = null;
      selectedPriority = null;
      selectedRole = null;
      selectedRepeat = null;
      selectedOcc = null;
      _selectedStartDate = null;
      _selectedEndDate = null;
      selectedStartTime = null;
      selectedEndTime = null;
    });
  }

  void handleSubmit() {
    final newTask = TaskModel(
      title: titleController.text.trim(),
      description: descController.text.trim(),
      resident: selectedResident,
      priority: selectedPriority,
      role: selectedRole,
      repeatFrequency: selectedRepeat,
      occurrencePerDay: selectedOcc,
      startDate: _selectedStartDate,
      endDate: _selectedEndDate,
      startTime: selectedStartTime != null
          ? '${selectedStartTime!.hour.toString().padLeft(2, '0')}:${selectedStartTime!.minute.toString().padLeft(2, '0')}'
          : null,
      endTime: selectedEndTime != null
          ? '${selectedEndTime!.hour.toString().padLeft(2, '0')}:${selectedEndTime!.minute.toString().padLeft(2, '0')}'
          : null,
      repeatHour: int.tryParse(hourController.text),
      repeatMinute: int.tryParse(minController.text),
    );

    setState(() {
      Lists.taskList.add(newTask);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task added successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    _clearForm();
  }
}
