import 'ETransport.dart';

class Viagem {
  static String codigoTrabalho = "ABC123";
  double dinheiro = 0;
  ETransporte locomocao;
  Set<String> registrosVisitados = <String>{};
  Map<String, dynamic> registrarPrecos = {};

  int _totalLocaisVisitados = 0 ;

  Viagem({required this.locomocao});

  printCodigo() {
    print(codigoTrabalho);
  }

  void escolherMeioTransporte(ETransporte locomocao) {
  String? locomocaoTexto;

  switch (locomocao) {
    case ETransporte.andando:
      locomocaoTexto = "ANDANDO";    
      break;
    case ETransporte.carro:
      locomocaoTexto = "de CARRO";    
      break;
    case ETransporte.aviao:
      locomocaoTexto = "de AVIÃO";    
      break;
    case ETransporte.bike:
      locomocaoTexto = "de BIKE";    
      break;
    case ETransporte.patins:
      locomocaoTexto = "de PATINS";    
      break;
    case ETransporte.skate:
      locomocaoTexto = "de SKATE";    
      break;
    case ETransporte.trem:
      locomocaoTexto = "de TREM";    
      break;
    case ETransporte.onibus:
      locomocaoTexto = "de BUSÃO";    
      break;
    default:
      locomocaoTexto = "";
      break;
  }

  print("Vou $locomocaoTexto para a aventura!");
  
}

  void visitar(String localVisita) {
    registrosVisitados.add(localVisita);
    _totalLocaisVisitados += 1;
  }

  void registrarPrecoVisita(String local, dynamic preco) {
    registrarPrecos[local] = preco;
  }

  int get getTotalLocaisVisitados {
    return this._totalLocaisVisitados;
  }

  void set setTotalLocaisVisitados(int total) {
    if(total <= 10) {
      _totalLocaisVisitados = total;    
    } else {
      print("Não é possível");
    }
    
  }
}
