import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

class SignInForm extends StatelessWidget {
   SignInForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            decoration: const InputDecoration(hintText: 'Username'),
            textInputAction: TextInputAction.next,
            onSaved: (username) {
              // Save it
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onSaved: (passaword) {
                // Save it
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => const MessagesScreen(),
                    builder: (context) => const ChatsScreen(),
                  ),
                );
              }
            },
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
