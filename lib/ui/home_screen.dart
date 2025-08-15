import 'package:busca_cep/models/cep_model.dart';
import 'package:busca_cep/repositories/cep_repository.dart';
import 'package:busca_cep/ui/widgets/address_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = CepRepository(client: http.Client());

  final cepController = TextEditingController();
  final cepFormater = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  String? errorMessage;
  CepModel? cepModel;
  bool isLoading = false;

  Future<void> buscarCep() async {
    //Muda o foco - cursor
    FocusScope.of(context).unfocus();
    setState(() {
      errorMessage = null;
      cepModel = null;
      isLoading = true;
    });
    final cep = cepController.text.trim();

    if (cep.isEmpty) {
      setState(() {
        errorMessage = 'Digite um cep válido!';
        isLoading = false;
      });
    }
    try {
      final addressModel = await repository.consultarCep(cep);
      setState(() {
        errorMessage = null;
        cepModel = addressModel;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Erro ao buscar endereço';
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
        leading: const Icon(Icons.location_city),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //spacing: 24, não funciona nessa versão
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.1),
                    theme.colorScheme.secondary.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                //spacing: 4, no lugar do sizedBox para criar um espaço entre os campos.não funciona nessa versão
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                  Text(
                    'Busque por qualquer CEP',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Digite o CEP e descubra o endereço completo',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              maxLength: 9,
              inputFormatters: [cepFormater],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on_rounded),
                labelText: 'CEP',
                hintText: 'Digite o CEP (ex: 01310-100)',
                counterText: '',
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isLoading
                  ? Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                            Text(
                              'Buscando CEP',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: buscarCep,
                      icon: const Icon(Icons.search_rounded),
                      label: const Text('Buscar CEP'),
                    ),
            ),
            const SizedBox(
              height: 24,
            ),
            Visibility(
              visible: errorMessage != null,
              child: Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.error.withOpacity(0.3),
                    )),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: theme.colorScheme.error,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      errorMessage ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Visibility(
              visible: cepModel != null,
              child: AnimatedOpacity(
                opacity: cepModel != null ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: AddressWidget(
                  cepModel: cepModel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
