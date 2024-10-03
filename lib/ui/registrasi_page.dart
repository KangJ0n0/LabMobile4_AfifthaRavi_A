import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi Jono"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _namaTextField(),
                _emailTextField(),
                _passwordTextField(),
                _passwordKonfirmasiTextField(),
                _buttonRegistrasi(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaTextField() {
    return TextFormField(
      controller: _namaTextboxController,
      decoration: const InputDecoration(labelText: "Nama"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nama tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: _emailTextboxController,
      decoration: const InputDecoration(labelText: "Email"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordTextboxController,
      decoration: const InputDecoration(labelText: "Password"),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password tidak boleh kosong";
        }
        return null;
      },
    );
  }

  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Konfirmasi Password"),
      obscureText: true,
      validator: (value) {
        if (value != _passwordTextboxController.text) {
          return "Konfirmasi Password tidak sama";
        }
        return null;
      },
    );
  }

  Widget _buttonRegistrasi() {
    return ElevatedButton(
      child: const Text("Registrasi Jono"),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          setState(() {
            _isLoading = false;
          });
        }
      },
    );
  }
}
