import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

// Latihan 4: Refactoring ke ChangeNotifier
class UserProvider extends ChangeNotifier {
  User _user = User(name: '', email: '');
  bool _isLoading = true;
  bool _isDarkMode = false;
  int _visitCount = 0;

  User get user => _user;
  bool get isLoading => _isLoading;
  bool get isDarkMode => _isDarkMode;
  int get visitCount => _visitCount;

  UserProvider() {
    _loadInitialData();
  }

  // Memuat data awal dari SharedPreferences
  Future<void> _loadInitialData() async {
    final prefs = await SharedPreferences.getInstance();

    // Latihan 1: Load Dark Mode
    _isDarkMode = prefs.getBool('is_dark_mode') ?? false;

    // Latihan 2: Increment & Load Counter Kunjungan
    _visitCount = (prefs.getInt('visit_count') ?? 0) + 1;
    await prefs.setInt('visit_count', _visitCount);

    // Latihan 3: Load Data User & Favorites
    final name = prefs.getString('user_name') ?? '';
    final email = prefs.getString('user_email') ?? '';
    final isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    final favorites = prefs.getStringList('favorites') ?? [];

    _user = User(
      name: name,
      email: email,
      isLoggedIn: isLoggedIn,
      favorites: favorites,
    );

    _isLoading = false;
    notifyListeners();
  }

  // Latihan 1: Toggle & Simpan Dark Mode
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark_mode', _isDarkMode);
  }

  // Update Data User
  Future<void> updateUser(User newUser) async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', newUser.name);
    await prefs.setString('user_email', newUser.email);
    await prefs.setBool('is_logged_in', newUser.isLoggedIn);
    await prefs.setStringList('favorites', newUser.favorites);

    _user = newUser;
    _isLoading = false;
    notifyListeners();
  }

  // Latihan 3: Tambah Item Favorit
  Future<void> addFavorite(String item) async {
    if (item.trim().isEmpty) return;
    final updatedList = List<String>.from(_user.favorites)..add(item.trim());
    await updateUser(_user.copyWith(favorites: updatedList));
  }

  // Latihan 3: Hapus Item Favorit
  Future<void> removeFavorite(String item) async {
    final updatedList = List<String>.from(_user.favorites)..remove(item);
    await updateUser(_user.copyWith(favorites: updatedList));
  }

  // Logout User
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_name');
    await prefs.setBool('is_logged_in', false);

    _user = _user.copyWith(name: '', isLoggedIn: false);
    _isLoading = false;
    notifyListeners();
  }
}