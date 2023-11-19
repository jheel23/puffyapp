class User {
  String email;
  String token;
  String id;
  String refreshToken;
  String expiresIn;
  User(
      {required this.email,
      required this.token,
      required this.id,
      required this.refreshToken,
      required this.expiresIn});

  factory User.initialState() {
    return User(email: '', token: '', id: '', refreshToken: '', expiresIn: '');
  }
}
