import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose(){
    _passwordController.dispose();
    super.dispose();
  }
  String? _validateName(String? value){
    if(value==null||value.isEmpty){
      return "Please enter your full name";
    }
    else if (value.length<3){
      return "Name must be at least 3 characters long";
    }
    return null;
  }
  String? _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
  String? _validatePhone(String? value) {
    final phoneRegex = RegExp(r'^\d{10}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Enter a 10-digit phone number';
    }
    return null;
  }
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      return 'Password must contain letters and numbers';
    }
    return null;
  }
  String? _validateConfirmPassword(String? value){
    if(value==null|| value .isEmpty){
      return "Please enter a password";

    }
    else if (value!=_passwordController.text){
      return "Passwords do not match";
    }
    return null;
  }
  void _submitForm(){
    if(_formKey.currentState?.validate()==true){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("Form submitted successfully")));
    }
  }
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(title: Center(child: Text('Registration Form',style: TextStyle(color: Color(0xFF000000)),))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,
          child: ListView(

            children: [
              TextFormField(
                decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    fillColor: Color(0xFFe3ebf5),

                    hintText: "Full name",

                    hintStyle:
                    TextStyle(color: Color(0xFF003a7e), fontSize: 14),

                    border: OutlineInputBorder(borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15))),
                validator: _validateName,
              ),

              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    fillColor: Color(0xFFe3ebf5),

                    hintText: "Email",

                    hintStyle:
                    TextStyle(color: Color(0xFF003a7e), fontSize: 14),

                    border: OutlineInputBorder(borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15))),
                validator: _validateEmail,

                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    fillColor: Color(0xFFe3ebf5),
                    hintText: "Phone Number",
                    hintStyle:TextStyle(color: Color(0xFF003a7e),fontSize: 14) ,
                    border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
                      ),
                validator: _validatePhone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  filled: true,
                  fillColor: Color(0xFFe3ebf5),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Color(0xFF003a7e),fontSize: 14),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15))
                ),
                obscureText: true,
                validator: _validatePassword,
                controller: _passwordController,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  filled: true,
                  fillColor: Color(0xFFe3ebf5),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Color(0xFF003a7e),fontSize: 14),
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15))
                ),
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              SizedBox(height: 40.0),
              SizedBox(height: 50,width: 80,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
