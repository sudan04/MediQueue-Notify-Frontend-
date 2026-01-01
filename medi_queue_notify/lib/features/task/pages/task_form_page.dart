import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/demo/staff.dart';
import 'package:medi_queue_notify/Model/demo/task.dart';
import 'package:medi_queue_notify/features/task/pages/task_validator.dart';
import 'package:medi_queue_notify/features/task/widgets/task_repeat_interval.dart';
import 'package:medi_queue_notify/core/utils/lists.dart';
import 'package:medi_queue_notify/shared/widgets/custom_date_picker.dart';
import 'package:medi_queue_notify/shared/widgets/custom_dropdown.dart';
import 'package:medi_queue_notify/shared/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/shared/widgets/custom_outline_button.dart';
import 'package:medi_queue_notify/shared/widgets/custom_text_form_field.dart';
import 'package:medi_queue_notify/shared/widgets/custom_time_picker.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskState();
}

class _TaskState extends State<TaskPage> {
  final List<Staff> residents = Lists.allStaff;
  Staff? selectedResident;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final List<String> priorities = [
    "High Priority",
    "Medium Priority",
    "Low Priority",
  ];
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

  static List<String> statuses = [
    "Pending",
    "Overdue",
    "In Progres",
    "Completed",
  ];
  String? selectedStatus;

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
                  //dropdown for Resident
                  CustomDropdown<Staff>(
                    validator: TaskValidator.validateResident,
                    value: selectedResident,
                    items: residents,
                    itemBuilder: (resident) => Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(resident.imageUrl!),
                        ),
                        SizedBox(width: 8),
                        Text(resident.name!),
                      ],
                    ),

                    onChanged: (value) => setState(() {
                      selectedResident = value;
                    }),
                    labelText: "Patient",
                    hintText: "Select Patient",
                  ),

                  const SizedBox(height: 20),

                  //title field
                  CustomTextFormField(
                    controller: titleController,
                    labelText: "Title",
                    hintText: "Task title",
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 20),

                  //description field
                  CustomTextFormField(
                    maxLine: 2,
                    controller: descController,
                    labelText: "Description",
                    hintText: "Enter description",
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 20),

                  //dropdown for Priority
                  CustomDropdown(
                    validator: TaskValidator.validatePriority,
                    value: selectedPriority,
                    items: priorities,
                    itemBuilder: (priority) => Text(priority),
                    onChanged: (value) => setState(() {
                      selectedPriority = value;
                    }),
                    labelText: "Priority",
                    hintText: "Select Priority",
                  ),

                  const SizedBox(height: 20),

                  //dropdown for Role
                  CustomDropdown(
                    value: selectedRole,
                    items: roles,
                    itemBuilder: (role) => Text(role),
                    onChanged: (value) => setState(() {
                      selectedRole = value;
                    }),
                    labelText: "Assigened To",
                    hintText: "Select Role",
                    validator: TaskValidator.validateRole,
                  ),
                  const SizedBox(height: 20),

                  //dropdown for status
                  CustomDropdown(
                    value: selectedStatus,
                    items: statuses,
                    itemBuilder: (status) => Text(status),
                    onChanged: (value) => setState(() {
                      selectedStatus = value;
                    }),
                    labelText: "Status",
                    hintText: "Select Status",
                  ),

                  const SizedBox(height: 20),

                  //dropdown for task repeatFrequency
                  CustomDropdown(
                    value: selectedRepeat,
                    items: repeat,
                    itemBuilder: (repeat) => Text(repeat),
                    onChanged: (value) => setState(() {
                      selectedRepeat = value;
                    }),
                    labelText: "How often does this task occur?",
                    hintText: "Select Task Frequency",
                  ),
                  SizedBox(height: 20),

                  // start date picker
                  CustomDatePicker(
                    labelText: "Start Date",
                    selectedDate: _selectedStartDate,
                    onDateSelected: (picked) => setState(() {
                      _selectedStartDate = picked;
                    }),
                  ),

                  SizedBox(height: 20),

                  // end date picker
                  CustomDatePicker(
                    labelText: "End Date",
                    selectedDate: _selectedEndDate,
                    onDateSelected: (picked) => setState(() {
                      _selectedEndDate = picked;
                    }),
                  ),

                  SizedBox(height: 20),
                  // dropdown for occurance/day
                  CustomDropdown(
                    value: selectedOcc,
                    items: occurancePerDay,
                    labelText: "How often does this task occur/day?",
                    hintText: "Occurrences per day",
                    itemBuilder: (occ) => Text(occ),
                    onChanged: (value) => setState(() {
                      selectedOcc = value;
                    }),
                  ),

                  SizedBox(height: 20),
                  // start time picker
                  CustomTimePicker(
                    labelText: "Start Time",
                    selectedTime: selectedStartTime,
                    onTimeSelected: (picked) => setState(() {
                      selectedStartTime = picked;
                    }),
                  ),

                  SizedBox(height: 20),

                  if (selectedOcc == "More than once") ...[
                    // end time picker
                    CustomTimePicker(
                      labelText: "End Time",
                      selectedTime: selectedEndTime,
                      onTimeSelected: (picked) => setState(() {
                        selectedEndTime = picked;
                      }),
                    ),

                    const SizedBox(height: 20),

                    // Repeat time picker
                    TaskRepeatInterval(
                      hourController: hourController,
                      minuteController: minController,
                    ),

                    SizedBox(height: 20),
                  ],
                  // buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomOutlineButton(
                          icon: Icons.person_add_alt_1,
                          label: 'Discard',
                          onPressed: _clearForm,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: CustomElevatedButton(
                          icon: Icons.login,
                          label: 'Submit',
                          onPressed: handleSubmit,
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

    Navigator.pop(context, newTask);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task added successfully!'),
        backgroundColor: Colors.green,
      ),
    );
    _clearForm();
  }
}
