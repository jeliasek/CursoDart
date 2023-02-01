import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  String? input;

  print('Olá! Neste programa você descobrirá seu IMC (Índice de Massa Corporal). \n');
  print('Qual é o seu nome?');
  String? nome = stdin.readLineSync();

  print('Qual a sua idade?');
  input = stdin.readLineSync();
  int idade = (input != null ? int.parse(input) : 0);

  print('Qual a sua altura?');
  input = stdin.readLineSync();
  double altura = (input != null ? double.parse(input) : 0);

  print('Qual o seu peso?');
  input = stdin.readLineSync();
  double? peso = (input != null ? double.parse(input) : 0);

  print('Analisando seus dados...');

  num imc = (peso / pow(altura, 2)).round();

  String situacao = "";

  if (imc < 17) {
    situacao = 'Muito abaixo do peso';
  } else if (imc >= 17 && imc <= 18.49) {
    situacao = 'Abaixo do peso';
  } else if (imc >= 18.50 && imc <= 24.99) {
    situacao = 'Peso normal';
  } else if (imc >= 25 && imc <= 29.99) {
    situacao = 'Acima do peso';
  } else if (imc >= 30 && imc <= 34.99) {
    situacao = 'Obesidade I';
  } else if (imc >= 35 && imc <= 39.99) {
    situacao = 'Obseidade II (Severa)';
  } else if (imc > 40) {
    situacao = 'Obsesidade III (Mórbida)';
  }

  print('Prezado $nome! \n'
        'Conforme os dados que você nos enviou (Idade: $idade, Peso: $peso, Altura: $altura) o seu resultado é: \n'
        'IMC: $imc. Sua situação atual é: $situacao');

  

  
}
