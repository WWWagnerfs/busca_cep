class CepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String? unidade; // Pode ser nulo ou vazio, então String?
  final String bairro;
  final String localidade; // Cidade
  final String uf; // Sigla do estado
  final String estado; // Nome completo do estado (adicionado pois é comum, mas não estava no seu exemplo com esse nome exato)
  final String? regiao; // Região do país (adicionado pois é comum)
  final String ibge;
  final String? gia; // Pode ser nulo ou vazio
  final String ddd;
  final String? siafi; // Pode ser nulo ou vazio

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    this.regiao,
    required this.ibge,
    this.gia,
    required this.ddd,
    this.siafi,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'] as String,
      logradouro: json['logradouro'] as String,
      complemento: json['complemento'] as String,
      unidade: json['unidade'] as String?,
      bairro: json['bairro'] as String,
      localidade: json['localidade'] as String,
      uf: json['uf'] as String,
      estado: json['estado'] as String, // Se você adicionar 'estado' ao JSON da API
      regiao: json['regiao'] as String?, // Se você adicionar 'regiao' ao JSON da API
      ibge: json['ibge'] as String,
      gia: json['gia'] as String?,
      ddd: json['ddd'] as String,
      siafi: json['siafi'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'unidade': unidade,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
      'regiao': regiao,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }
}
