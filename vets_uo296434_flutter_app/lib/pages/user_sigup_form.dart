import 'package:flutter/material.dart';
import 'package:vets_uo296434_flutter_app/src/user.dart';

// Create a Form widget.
class UserSignUpForm extends StatefulWidget {
  const UserSignUpForm({super.key});

  @override
  UserSignUpFormState createState() => UserSignUpFormState();
}

class UserSignUpFormState extends State<UserSignUpForm> {
  
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _surname = "";
  String _email = "";
  String _phone = "";


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Registro de usuarios"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Introduce tu nombre',
                  border: OutlineInputBorder(),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por Favor digite el nombre';
                  }
                  return null;
                },
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  hintText: 'Introduce tus apellidos',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite los apellidos';
                  }
                  return null;
                },
                onSaved: (value) {
                  _surname = value ?? '';
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Introduce tu email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite el email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Telefóno',
                  hintText: 'Introduce tu email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'por favor digite el telefono ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value ?? '';
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      User user = User(_name, _surname, _email, _phone);
                      Navigator.pop(context, user);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
