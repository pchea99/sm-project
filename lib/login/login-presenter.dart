
abstract class LoginView {
  void onLoginSuccess(String msg);
  void onLoginError(String error);
  void onPositionError(String error);
  void onUserNameError(String error);
  void onPassword(String error);
}

class LoginPresenter {
  LoginView _view;
  LoginPresenter(this._view);

  doLogin(String username, String password, String position) {
    bool isError = false;
    /*if(position == null || position.isEmpty){
      _view.onPositionError("Position is required!");
      isError = true;
    }*/
    if(password == null || password.isEmpty){
      _view.onPassword("Password is required!");
      isError = true;
    }
    if(username == null || username.isEmpty){
      _view.onUserNameError("Username is required!");
      isError = true;
    }

    if (!isError) {
      _view.onLoginSuccess("Login Successful!");
    }
  }
}