import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Clave global para identificar y validar el formulario
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para capturar el texto de los inputs
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Método para validar y procesar el inicio de sesión
  void _validarYIniciarSesion() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Credenciales de prueba simuladas
      if (email == "roberto@yahoo.com" && password == "1234") {
        // TODO: Navegar a la pantalla principal de continentes
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Inicio de sesión exitoso!')),
        );
      } else {
        // Mostrar AlertDialog si las credenciales fallan
        _mostrarAlertaError();
      }
    }
  }

  // Diálogo de alerta con opciones solicitadas
  void _mostrarAlertaError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos incorrectos'),
          content: const Text('El correo o la contraseña introducidos no son válidos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cierra la alerta
              child: const Text('Volver'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _emailController.text = 'roberto@yahoo.com';
                  _passwordController.text = '1234';
                });
                Navigator.of(context).pop();
              },
              child: const Text('Rellenar usuario'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  
                  // Campo de Correo Electrónico
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce tu correo';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Introduce un formato de correo válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo de Contraseña
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce tu contraseña';
                      }
                      if (value.length < 4) {
                        return 'Debe tener al menos 4 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Botón de Inicio de Sesión
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _validarYIniciarSesion,
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}