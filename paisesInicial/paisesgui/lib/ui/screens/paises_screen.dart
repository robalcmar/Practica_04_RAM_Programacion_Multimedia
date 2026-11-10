import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesScreen extends StatelessWidget {
  PaisesScreen();

  final String nombreContinente = "Europa"; // Nombre del continente para filtrar los países

  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // Proporciona a _creaLlistaPaises la lista de paises de Europa
          child:
              _creaListaPaises(_repository.getPaises(nombreContinente))), 
    );
  }

  Widget _creaListaPaises(List<Pais> paises) {
    // Recibimos la lista de paises
    
    // TO-DO
    // Debemos utilizar un ListView.builder para recorrer la lista de países
    // y generar un widget personalizado de tipo PaisCard, con la imagen y el nombre.
    return ListView.builder(
      itemCount: paises.length,
      itemBuilder: (context, index) {
        final pais = paises[index];
        return PaisCard(
          imagen: pais.imagen ?? "",
          nombre: pais.nombre,
        );
      },
    );
  }
}

class PaisCard extends StatelessWidget {
  // Este widget recibirá dos argumentos con nombre para construirse:
  // la imagen (imagen) y el nombre del país (nombre)
  const PaisCard({
    super.key,
    required this.imagen,
    required this.nombre,
  });

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    // TO-DO
    // Devuelve un widget de tipo Card, con el diseño que desees, pero
    // que muestre la imagen (obtenida de Internet a partir de la url)
    // y el nombre del país.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Primera Pantalla'),
      ),
      body: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [ Image.network(
          imagen,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 150,
        ),
        Positioned(
          left: 30,
          bottom: 30,
          child: Text(
            nombre,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        ],
      ),
    )
    );


  }
}
