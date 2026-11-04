
import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class InfoPaisGeneral extends StatelessWidget {
  InfoPaisGeneral({super.key});

    // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {

    // Recogemos el país del repositorio
    Pais pais = _repository.infoPais();
    
    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Imagen, nombre, capital y descripción, de forma similar a como se muestra en el enunciado
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                pais.imagen ?? "",
                width: double.infinity,
              height: 180,
              fit: BoxFit.cover
              ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                child: Text(
                  pais.nombre,
                  style: TextStyle(
                    fontSize: 19,
                  )
                ),
              ),

            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                child: Text(
                  "Capital: ${pais.capital ?? ""}",
                  style: TextStyle(
                    fontSize: 13,
                  )
                ),
              ),

            Container(
              margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Text(
                pais.descripcion ?? "",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 9,
                )
              ),
            ),
          ],
        ),
      ),
      ) 
    );

    // Podéis utilizar los widgets y contenedores que consideréis oportunos (Containers, SingleChildScrollView, Columns, etc)
    // Debéis tener en cuenta no sobrepasar los límites y dibujar fuera del espacio disponible
    // Para comprobar que no os salís, podéis probar a girar el dispositivo (si lo estáis haciendo sobre Android)
  }
}
