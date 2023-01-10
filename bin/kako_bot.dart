// ignore_for_file: non_constant_identifier_names, unused_local_variable, dead_code

import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_timing.dart';

void main() async {
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';
  var myStream = BotClock().TheBotStream(1, 10);
  var Subscriber = myStream.listen((event) {
    print('                      O Robo está ativo a: $event segundos');
  }, onDone: () {
    print('O robô está finalizando, faça a ultima pergunta');
    a = false;
  });

  print('-- Iniciando o KakoBOT, aguarde..--');
  await BotClock().clock(2);
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else {
      await BotClock().clock(2);
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}
