import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount =
      Account(name: "Joao", balance: 200, isAuthenticated: true);

  // Simulando uma comunicação externa.
  Random rng = Random();
  int randomNumber = rng.nextInt(10);

  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }

  print(myAccount.runtimeType);

  // print( myAccount != null ? myAccount.balance : "Conta Nula");
  print(myAccount.balance);
  print(myAccount.createdAt?.day);
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: false));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 700);

    // Observando resultado
    if (result) {
      print("Transação concluída com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idSender}' do remetente é inválido.");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idReceiver}' do destinatário é inválido.");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário remetende com ID '${e.idSender}' não está autenticado.");
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
    print(
        "O usuário destinatário com ID '${e.idReceiver}' não está autenticado.");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print(
        "O usuário remetende com ID '${e.idSender}' tentou enviar ${e.amount} sendo que sua conta possui saldo de ${e.senderBalance}.");
  } on Exception {
    print("Algo deu errado.");
  }
}
