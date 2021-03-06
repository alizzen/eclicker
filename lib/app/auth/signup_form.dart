import 'package:eclicker_flutter/services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    try {
      print(_emailFieldController.text);
      print(_passwordFieldController.text);
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signUp(
        email: _emailFieldController.text,
        password: _passwordFieldController.text
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildEmailField(),
          SizedBox(height: 8.0),
          _buildPasswordField(),
          _buildSignUpButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailField(){
    return TextFormField(
      controller: _emailFieldController,
      validator: (value){
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Email"
      ),
    );
  }

  Widget _buildPasswordField(){
    return TextFormField(
      controller: _passwordFieldController,
      validator: (value){
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Password"
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RaisedButton(
        onPressed: (){
          if(_formKey.currentState.validate()){
            _signUp(context);
          }
        },
        child: Text('Sign up')
      ),
    );
  }
}

