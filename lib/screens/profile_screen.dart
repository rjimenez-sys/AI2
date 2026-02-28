import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../database/db_helper.dart';

class ProfileScreen extends StatelessWidget {
  // Aquí recibimos el parámetro enviado desde la pantalla anterior
  final String nombreUsuario;

  const ProfileScreen({Key? key, required this.nombreUsuario})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil de Usuario')),
      body: FutureBuilder<User?>(
        // Aquí cumplimos el requisito de consultar el último usuario registrado de SQLite
        future: DbHelper().getLastUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No hay usuarios registrados.'));
          }

          final user = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '¡Hola, $nombreUsuario!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Cumpliendo el requisito de Card y CircleAvatar con un buen diseño visual
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          user.nombre,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.correo,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Divider(height: 30, thickness: 1),
                        Text(
                          'Biografía',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(user.biografia, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
