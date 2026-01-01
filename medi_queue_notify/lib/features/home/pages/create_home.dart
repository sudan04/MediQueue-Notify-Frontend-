import 'package:flutter/material.dart';
import 'package:medi_queue_notify/shared/widgets/custom_elevated_button.dart';
import 'package:medi_queue_notify/shared/widgets/custom_text_form_field.dart';

class CreateHomePage extends StatefulWidget {
  const CreateHomePage({super.key});

  @override
  State<CreateHomePage> createState() => _CreateHomePageState();
}

class _CreateHomePageState extends State<CreateHomePage> {
  final TextEditingController homeNameController = TextEditingController();

  List<TextEditingController> floorControllers = [TextEditingController()];

  void addFloor() {
    setState(() {
      floorControllers.add(TextEditingController());
    });
  }

  void removeFloor(int index) {
    setState(() {
      floorControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            "Create Home",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              const Text(
                "Name *",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),

              CustomTextFormField(
                controller: homeNameController,
                hintText: "Enter home name",
                keyboardType: TextInputType.text,
                labelText: '',
              ),

              const SizedBox(height: 20),

              // Floors Label
              const Text(
                "Floors",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              // Table Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "NAME",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "ACTION",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              // Dynamic Rows
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: floorControllers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        // Text Field
                        Expanded(
                          flex: 3,
                          child: CustomTextFormField(
                            controller: floorControllers[index],
                            labelText: '',
                            hintText: 'Enter Name',
                            keyboardType: TextInputType.text,
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Delete Button
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () => removeFloor(index),
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              //  Add Floor Button
              ElevatedButton.icon(
                onPressed: addFloor,
                icon: const Icon(Icons.add),
                label: const Text("Add Floor"),
              ),

              const SizedBox(height: 30),

              //  Submit Button
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  icon: Icons.done,
                  label: "Submit",
                  onPressed: () {
                    Navigator.pop(context, homeNameController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
