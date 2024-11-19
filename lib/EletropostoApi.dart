import 'dart:convert';
import 'package:appgs/Eletroposto.dart';
import 'package:http/http.dart' as http;

class EletropostoApi {
  final String apiUrl = 'https://eletropostos.azurewebsites.net/api/eletroposto';

  Future<List<Eletroposto>> fetchEletropostos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Eletroposto.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}
