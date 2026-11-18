import 'package:flutter/material.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../services/api_service.dart';

/// Pengelola dependensi aplikasi dengan pola Singleton untuk [ApiService].
class DependencyInjector {
  DependencyInjector._internal() {
    apiService = ApiService();
    userRepository = UserRepositoryImpl(apiService: apiService);
    postRepository = PostRepositoryImpl(apiService: apiService);
  }

  static final DependencyInjector instance = DependencyInjector._internal();

  late final ApiService apiService;
  late final UserRepository userRepository;
  late final PostRepository postRepository;
}

/// [InheritedWidget] untuk menyuntikkan repository ke seluruh widget tree.
class DependencyProvider extends InheritedWidget {
  final UserRepository userRepository;
  final PostRepository postRepository;

  const DependencyProvider({
    super.key,
    required this.userRepository,
    required this.postRepository,
    required super.child,
  });

  /// Mengambil instance [DependencyProvider] terdekat dari [context].
  static DependencyProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DependencyProvider>();
  }

  @override
  bool updateShouldNotify(DependencyProvider oldWidget) {
    return userRepository != oldWidget.userRepository ||
        postRepository != oldWidget.postRepository;
  }
}