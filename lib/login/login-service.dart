import 'dart:async';

import 'package:sm_app/model_dto/user.dart';
import 'package:sm_app/network-service/network.dart';

class LoginService{
  static Future getUserLogin(String userNo){
    var completer = new Completer<User>();
    NetworkService.db.reference().child(NetworkService.userDB)
        .child(userNo).once().then((snaphot) {
          User user = User.fromJson(snaphot.value);
          completer.complete(user);
    }).catchError((err) {
      completer.completeError(err);
    });

    return completer.future;
  }
}