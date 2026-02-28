# Mini App de Registro y Perfil de Usuario

## Descripción del proyecto
Aplicación móvil desarrollada en Flutter que permite registrar la información básica de un usuario mediante un formulario validado. Los datos se almacenan localmente y se muestran en una pantalla de perfil interactiva.

## Tecnologías utilizadas
* Flutter (Framework)
* Dart (Lenguaje)
* SQLite (Base de datos local mediante el paquete `sqflite`)
* `flutter_launcher_icons` (Para el ícono personalizado)

## Explicación breve de SQLite
SQLite es un motor de base de datos relacional muy ligero que se integra directamente en la aplicación. No requiere un servidor independiente para funcionar. En este proyecto, se utiliza para guardar los datos del usuario de forma persistente, permitiendo que la información no se pierda aunque la app se cierre por completo.

## Instrucciones de instalación
1. Clona este repositorio en tu máquina local.
2. Asegúrate de tener Flutter SDK instalado.
3. Abre una terminal en la carpeta del proyecto y ejecuta `flutter pub get` para instalar las dependencias.
4. Conecta un emulador o dispositivo físico y ejecuta `flutter run`.

## Captura de pantalla
*(Nota: Aquí puedes subir una captura de pantalla real de tu app funcionando y reemplazar este texto con `![App](ruta_de_la_imagen.png)`)*

## Estructura del proyecto
La arquitectura del proyecto está organizada en la carpeta `lib` de la siguiente manera:
- `/database/`: Configuración y consultas directas a SQLite (`db_helper.dart`).
- `/models/`: Molde de los datos del usuario (`user_model.dart`).
- `/screens/`: Pantallas principales de la app (`register_screen.dart` y `profile_screen.dart`).
- `/widgets/`: Componentes visuales reutilizables (`custom_text_field.dart`).
- `main.dart`: Archivo principal que arranca la aplicación.