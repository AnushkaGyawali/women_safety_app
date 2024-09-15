//contact_form.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For local storage
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firebase Firestore

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _contactController = TextEditingController();
  List<String> _trustedContacts = []; // To display local contacts

  @override
  void initState() {
    super.initState();
    _loadSavedContacts();
  }

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  // Load contacts from SharedPreferences
  Future<void> _loadSavedContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contacts = prefs.getStringList('trusted_contacts') ?? [];
    setState(() {
      _trustedContacts = contacts;
    });
  }

  // Save the contact locally using SharedPreferences
  Future<void> _saveContactLocally(String contact) async {
    final prefs = await SharedPreferences.getInstance();
    _trustedContacts.add(contact); // Add new contact to list
    await prefs.setStringList('trusted_contacts', _trustedContacts);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact saved locally!')),
    );
    _loadSavedContacts(); // Refresh the contacts list in the UI
  }

  // Save the contact in Firebase Firestore
  Future<void> _saveContactToFirebase(String contact) async {
    CollectionReference contacts = FirebaseFirestore.instance.collection('trusted_contacts');
    await contacts.add({'phone': contact});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact saved to Firebase!')),
    );
  }

  // Validate phone number (basic example, you can extend this)
  bool _isValidPhoneNumber(String contact) {
    final RegExp regex = RegExp(r'^\+?[0-9]{10,15}$');
    return regex.hasMatch(contact);
  }

  // Save the contact both locally and to Firebase
  void _saveContact() {
    String contact = _contactController.text.trim();

    if (_isValidPhoneNumber(contact)) {
      // Save contact locally and to Firebase
      _saveContactLocally(contact);
      _saveContactToFirebase(contact);

      _contactController.clear(); // Clear the text field after saving
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid contact number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _contactController,
            decoration: const InputDecoration(
              labelText: 'Enter trusted contact number',
              hintText: 'e.g., +9779812345678',
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saveContact,
            child: const Text('Save Contact'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Saved Contacts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _trustedContacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_trustedContacts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
