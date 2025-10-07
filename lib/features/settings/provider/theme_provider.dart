import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/prefs_service.dart';

/// 🔹 Provider tanımı — artık NotifierProvider kullanıyoruz
final themeModeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

/// 🌗 Tema yönetimi için modern Riverpod 3.x yapısı
class ThemeNotifier extends Notifier<ThemeMode> {
  /// İlk değer (build metodu başlangıç state)
  @override
  ThemeMode build() {
    // Uygulama açıldığında kaydedilen temayı yükle
    _loadSavedTheme();
    return ThemeMode.system; // fallback
  }

  /// 🌞 Light moda geç
  Future<void> setLightMode() async {
    state = ThemeMode.light;
    await PrefsService.write("theme_mode", "light");
  }

  /// 🌚 Dark moda geç
  Future<void> setDarkMode() async {
    state = ThemeMode.dark;
    await PrefsService.write("theme_mode", "dark");
  }

  /// 🌓 Sistem temasını takip et
  Future<void> setSystemMode() async {
    state = ThemeMode.system;
    await PrefsService.write("theme_mode", "system");
  }

  /// 💾 Kayıtlı temayı oku
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
