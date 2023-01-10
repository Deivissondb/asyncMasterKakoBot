// ignore_for_file: non_constant_identifier_names

import 'dart:async';

void main() async {
  Stream myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print('Counting: $i');
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('The stream is finished');
  }

  var BotStream = myStream(1).asBroadcastStream();

  StreamSubscription mySubscriber = BotStream.listen((event) {
    if (event.isEven) {
      print('this number is even!');
    }
  }, onError: (e) {
    print('An error happend $e');
  }, onDone: () {
    print('The subscriber is gone');
  });
  BotStream.map((event) => 'Subscriber 2 watching: $event').listen(print);

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause();
  print('Stream paused');
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume();
  print('Stream resumed');
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel();
  print('Stream canceled');

  print('The main is finished');
}
