import 'package:busca_cep/models/cep_model.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final CepModel? cepModel;
  const AddressWidget({super.key, this.cepModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cepModel == null) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ])),
          child: Column(
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'CEP Encontrado',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Informações do Endereço',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _InfoCard(
          icon: Icons.location_on_rounded,
          title: 'CEP',
          subTitle: cepModel!.cep,
          color: theme.colorScheme.primary,
        ),
        _InfoCard(
          icon: Icons.streetview_rounded,
          title: 'Logradouro',
          subTitle: cepModel!.logradouro,
          color: theme.colorScheme.secondary,
        ),
        _InfoCard(
          icon: Icons.home_rounded,
          title: 'Bairro',
          subTitle: cepModel!.bairro,
          color: theme.colorScheme.tertiary,
        ),
        _InfoCard(
          icon: Icons.location_city_rounded,
          title: 'Cidade',
          subTitle: cepModel!.localidade,
          color: Colors.green,
        ),
        _InfoCard(
          icon: Icons.info_rounded,
          title: 'Estado',
          subTitle: cepModel!.estado,
          color: Colors.orange,
        ),
        if(cepModel!.complemento.isNotEmpty)
        _InfoCard(
          icon: Icons.home_rounded,
          title: 'Complemento',
          subTitle: cepModel!.complemento,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  subTitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
