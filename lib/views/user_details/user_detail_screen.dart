import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/services/user_session.dart';
import 'package:rocki_poin_app/views/user_details/model/provider/user_provider.dart';
import 'package:uuid/uuid.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});
  static const routeName = "userdetails";

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  File? _image;
  String userId = '';

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void generateUserId() {
    var uuid = Uuid();
    userId = uuid.v4();
    saveUserSession();
  }

  void saveUserSession() async {
    await UserSession.saveUserId(userId);
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate() && _image != null) {
      final name = _nameController.text;
      final username = _usernameController.text;
      final email = _emailController.text;
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      await userProvider.saveUserData(
          name: name,
          username: username,
          email: email,
          imageFile: _image!,
          context: context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data saved successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all the fields and select an image')),
      );
    }
  }

  @override
  void initState() {
    generateUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? const Icon(Icons.add_a_photo, size: 50)
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveUserData,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
