

import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/my_weather_info.dart';

class InfoPaisDetalle extends StatelessWidget {
  InfoPaisDetalle({
    super.key,
  });

      // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    Pais pais = _repository.infoPais();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              const MyWeatherInfo(),
              const SizedBox(height: 25),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    // Población
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Población:'
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${pais.poblacion}'
                          ),
                        ),
                      ],
                    ),

                    // Latitud
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Latitud:'
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${pais.latitud}'
                          ),
                        ),
                      ],
                    ),

                    // Longitud
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Longitud:'
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${pais.longitud}'
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Población (num. de habitantes), latitud y longitud.
    // Podéis combinar Column y Row para mostrar la información tabulada
    /*return Row(
      children: [
        Column(
          children: [
            Text('Población: ${pais.poblacion}'),
            Text('Latitud: ${pais.latitud}'),
            Text('Longitud: ${pais.longitud}'),
          ],
        ),
      ],
    );*/


    // Antes de la información, deberemos mostrar la información sobre el tiempo en el país,
    // mediante el widtget personalizado MyWeatherInfo(), que se os proporciona ya implementado
    //return const Placeholder();
  }
}
