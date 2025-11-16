import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final File? imageFile; // local file image (for new image)
  final String? imageUrl; // network image (for existing staff)
  final ValueChanged<File?> onImagePicked;

  const CustomImagePicker({
    super.key,
    this.imageFile,
    this.imageUrl,
    required this.onImagePicked,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.imageFile;
  }

  Future<void> _pickImageSource() async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pick(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);

    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
      widget.onImagePicked(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = 60.0;

    return Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!)
              : (widget.imageUrl != null
                        ? NetworkImage(widget.imageUrl!)
                        : null)
                    as ImageProvider?,
          child: _selectedImage == null && widget.imageUrl == null
              ? const Icon(Icons.person, size: 60)
              : null,
        ),
        const SizedBox(height: 16),
        TextButton.icon(
          onPressed: _pickImageSource,
          icon: const Icon(Icons.upload_file),
          label: const Text("Upload Image"),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: Colors.black26),
          ),
        ),
      ],
    );
  }
}
