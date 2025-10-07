import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_app/features/settings/provider/theme_provider.dart';

/// 🧱 SplashPage - Clean versiyon (tema & state ayrıştırılmış)
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Splash Screen'),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌗 Icon
              Icon(
                themeMode == ThemeMode.dark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,
                size: 90,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 24),

              // 🧾 Text
              Text(
                "Current Theme: ${themeMode.name.toUpperCase()}",
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // ☀️ Light Mode
              ElevatedButton.icon(
                onPressed: () =>
                    ref.read(themeModeProvider.notifier).setLightMode(),
                icon: const Icon(Icons.wb_sunny_outlined),
                label: const Text("Light Mode"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  minimumSize: const Size(200, 48),
                ),
              ),
              const SizedBox(height: 12),

              // 🌙 Dark Mode
              ElevatedButton.icon(
                onPressed: () =>
                    ref.read(themeModeProvider.notifier).setDarkMode(),
                icon: const Icon(Icons.nightlight_round),
                label: const Text("Dark Mode"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.onSecondary,
                  minimumSize: const Size(200, 48),
                ),
              ),
              const SizedBox(height: 12),

              // 🌓 System Mode
              OutlinedButton.icon(
                onPressed: () =>
                    ref.read(themeModeProvider.notifier).setSystemMode(),
                icon: const Icon(Icons.settings_brightness_outlined),
                label: const Text("System Default"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  side: BorderSide(color: colorScheme.primary, width: 1.5),
                  minimumSize: const Size(200, 48),
                ),
              ),

              const SizedBox(height: 40),
              Text(
                "Switching theme persists between app restarts.",
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
