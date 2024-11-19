import 'package:appgs/EletropostoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class EletropostoScreen extends StatefulWidget {
  @override
  _EletropostoScreenState createState() => _EletropostoScreenState();
}

class _EletropostoScreenState extends State<EletropostoScreen> {
  @override
  void initState() {
    super.initState();
    _loadDataWithDelay();
  }

  void _loadDataWithDelay() async {
    final provider = Provider.of<EletropostoProvider>(context, listen: false);

    await Future.delayed(Duration(seconds: 5));
    await provider.fetchEletropostos();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EletropostoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Eletropostos Próximos')),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.eletropostos.length,
              itemBuilder: (context, index) {
                final eletroposto = provider.eletropostos[index];
                return ListTile(
                  title: Text(eletroposto.nome),
                  subtitle: Text(
                      '${eletroposto.informacoes}\n${eletroposto.endereco}\n${eletroposto.telefone}\nConectores: ${eletroposto.conectores.join(', ')}'),
                );
              },
            ),
    );
  }
}
