import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puffyapp/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends StateNotifier<User> {
  AuthNotifier() : super(User.initialState());

  Future<void> setExpiryDate() async {
    final prefs = await SharedPreferences.getInstance();
    final expiryDate =
        DateTime.now().add(Duration(seconds: int.parse(state.expiresIn)));
    prefs.setString('expiryDate', expiryDate.toIso8601String());
  }

//
//
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('expiryDate')) {
      return false;
    }
    final expiryDate = DateTime.parse(prefs.getString('expiryDate')!);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    state = User(
      id: prefs.getString('id')!,
      email: prefs.getString('email')!,
      token: prefs.getString('token')!,
      refreshToken: prefs.getString('refreshToken')!,
      expiresIn: prefs.getString('expiresIn')!,
    );
    return true;
  }

  set id(String id) {
    state = User(
        id: id,
        email: state.email,
        token: state.token,
        refreshToken: state.refreshToken,
        expiresIn: state.expiresIn);
  }

  set email(String email) {
    state = User(
        id: state.id,
        email: email,
        token: state.token,
        refreshToken: state.refreshToken,
        expiresIn: state.expiresIn);
  }

  set refreshToken(String refreshToken) {
    state = User(
        id: state.id,
        email: state.email,
        token: state.token,
        refreshToken: refreshToken,
        expiresIn: state.expiresIn);
  }

  set expiresIn(String expiresIn) {
    state = User(
        id: state.id,
        email: state.email,
        token: state.token,
        refreshToken: state.refreshToken,
        expiresIn: expiresIn);
  }

  set token(String token) {
    state = User(
        id: state.id,
        email: state.email,
        token: token,
        refreshToken: state.refreshToken,
        expiresIn: state.expiresIn);
  }
  // set token {
  //   if (state.expiresIn != '' && state.token != '') {
  //     final expiryDate =
  //         DateTime.now().add(Duration(seconds: int.parse(state.expiresIn)));
  //     if (expiryDate.isBefore(DateTime.now())) {
  //       return '';
  //     }
  //     return state.token;
  //   }
  //   return '';
  // }

  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCVxvgIQ0lw_HmhBd0TaRYk68LJC7cKIZE';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      state = User(
        id: responseData['localId'],
        email: responseData['email'],
        token: responseData['idToken'],
        refreshToken: responseData['refreshToken'],
        expiresIn: responseData['expiresIn'],
      );
    }
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, User>((ref) => AuthNotifier());
