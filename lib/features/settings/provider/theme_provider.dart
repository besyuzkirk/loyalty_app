import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/prefs_service.dart';

/// 🔹 Provider tanımı — artık NotifierProvider kullanıyoruz
final themeModeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    _loadSavedTheme();
    return ThemeMode.system; // fallback
  }

  Future<void> setLightMode() async {
    state = ThemeMode.light;
    await PrefsService.write("theme_mode", "light");
  }

  Future<void> setDarkMode() async {
    state = ThemeMode.dark;
    await PrefsService.write("theme_mode", "dark");
  }

  Future<void> setSystemMode() async {
    state = ThemeMode.system;
    await PrefsService.write("theme_mode", "system");
  }

  Future<void> _loadSavedTheme() async {
    final saved = await PrefsService.read("theme_mode");
    switch (saved) {
      case "light":
        state = ThemeMode.light;
        break;
      case "dark":
        state = ThemeMode.dark;
        break;
      case "system":
      default:
        state = ThemeMode.system;
        break;
    }
  }
}
