void main() {
  String nome = 'Laranja';
  double peso = 98;
  String cor = 'Verde e Amarela';
  String sabor = 'Doce e Cítrica';
  int diaDesdeColheita = 21;
  int diasParaFicarMadura = 20;
  bool isMadura = funcIsMadura(diaDesdeColheita, diasParaFicarMadura);

  Legumes mandioca = Legumes("Macaxeira", 1500, "Marrom", true);
  Fruta banana = Fruta("Banana", 75, "Amarela", "Doce", 12);
  Nozes macadamia = Nozes("Macadmia", 2, "Branco Amarelado", "Doce", 20, 35);
  Citricas limao = Citricas("Limão", 50, "Verde", "Azedo", 5, 9);

  mandioca.printAlimento();
  banana.printAlimento();
  macadamia.printAlimento();
  limao.printAlimento();

  mandioca.cozinhar();
  limao.fazerSuco();

}

toString(String nome, double peso, int diasDesdeColheita,
    int diasParaFicarMadura, bool isMadura) {
  print(
      'A $nome pesa $peso gramas! Ela foi colhida há $diasDesdeColheita dias e precisa de $diasParaFicarMadura para amadurecer, logo, a $nome ${funcIsMaduraString(isMadura)} está madura');
}

String funcIsMaduraString(bool isMadura) {
  if (isMadura) {
    return '';
  } else {
    return 'não';
  }
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  print("A $nome é $cor.");
}

bool funcIsMadura(int diasDesdeColheita, int diasParaFicarMadura) {
  return (diasDesdeColheita >= diasParaFicarMadura ? true : false);
}

class Fruta extends Alimento implements Bolo {

  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(super.nome, super.peso, super.cor, this.sabor, this.diasDesdeColheita, {this.isMadura});

  // Fruta.novoConstrutor({required this.nome, required this.peso, required this.cor, required this.sabor, required this.diaDesdeColheita});

  void estaMadura(int diasParaFicarMadura){
    isMadura = diasDesdeColheita >= diasParaFicarMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaFicarMadura dias para poder comer. Ela está madura? $isMadura");
  }
  
  void fazerSuco() {
    print('Você fez um ótimo suco de $nome');
  }
  
  @override
  void assar() {
    // TODO: implement assar
  }
  
  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }
  
  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é $cor');
  }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecizaCozinhar;

  Legumes(super.nome, super.peso, super.cor, this.isPrecizaCozinhar);

  void cozinhar() {
    if(isPrecizaCozinhar) {
      print('Ponrto! O $nome está cozinhando!');
    } else {
      print('Nem precisa cozinhar!');
    }
  }
  
  @override
  void assar() {
    // TODO: implement assar
  }
  
  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }
  
  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }

}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(super.nome, super.peso, super.cor, super.sabor, super.diasDesdeColheita, this.nivelAzedo);

  void existeRefri(bool existe) {
    if(existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não Existe refri de $nome');
    }
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;
  Nozes(super.nome, super.peso, super.cor, super.sabor, super.diasDesdeColheita, this.porcentagemOleoNatural);

}

abstract class Bolo {

  void separarIngredientes();
  void fazerMassa();
  void assar();
}