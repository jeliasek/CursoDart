
import 'ETransport.dart';
import 'viagem.dart';

void main(List<String> arguments) {
 Viagem newViagem = Viagem(locomocao: ETransporte.aviao);
 print(newViagem.getTotalLocaisVisitados);
 newViagem.visitar("Ibirama");
 print(newViagem.getTotalLocaisVisitados);
 newViagem.setTotalLocaisVisitados = 20;
 print(newViagem.getTotalLocaisVisitados);
}
