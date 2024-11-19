import 'package:appgs/Eletroposto.dart';
import 'package:appgs/EletropostoApi.dart';
import 'package:flutter/material.dart';

class EletropostoProvider extends ChangeNotifier {
  final EletropostoApi api = EletropostoApi();
  List<Eletroposto> eletropostos = [];
  bool isLoading = false;

  Future<void> fetchEletropostos() async {
    isLoading = true;
    notifyListeners();

    try {
      eletropostos = await api.fetchEletropostos();
    } catch (e) {
      print('Erro ao buscar eletropostos: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
