import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../database/db_helper.dart';
import '../widgets/custom_text_field.dart';
import 'profile_screen.dart'; // Marcará un error rojo temporalmente, ¡es normal!

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Requisito: Validaciones con Form y GlobalKey
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _correo = '';
  String _biografia = '';

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Requisito: Guardar los datos del formulario en SQLite
      User newUser = User(
        nombre: _nombre,
        correo: _correo,
        biografia: _biografia,
      );
      await DbHelper().insertUser(newUser);

      // Requisito: Manejo de navegación entre pantallas y Envío de parámetros
      Navigator.push(
        context,
        MaterialPageRoute(
          // Pasamos el nombre como parámetro a la siguiente pantalla
          builder: (context) => ProfileScreen(nombreUsuario: _nombre),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                label: 'Nombre',
                icon: Icons.person,
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese su nombre' : null,
                onSaved: (value) => _nombre = value!,
              ),
              CustomTextField(
                label: 'Correo Electrónico',
                icon: Icons.email,
                validator: (value) =>
                    !value!.contains('@') ? 'Ingrese un correo válido' : null,
                onSaved: (value) => _correo = value!,
              ),
              CustomTextField(
                label: 'Biografía',
                icon: Icons.description,
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese una breve biografía' : null,
                onSaved: (value) => _biografia = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Registrar y Ver Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
