import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class LocalizationProvider {
  Locale _locale = const Locale('en'); // Default locale

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (locale.languageCode == 'en' || locale.languageCode == 'id') {
      _locale = locale;
    } else {
      throw Exception('Unsupported locale');
    }
  }

  void toggleLocale() {
    if (_locale.languageCode == 'en') {
      _locale = const Locale('id');
    } else {
      _locale = const Locale('en');
    }
  }
}

void main() {
  group('LocalizationProvider Tests', () {
    test('toggleLocale toggles from en to id', () {
      final provider = LocalizationProvider();
      provider.setLocale(const Locale('en'));
      provider.toggleLocale();
      expect(provider.locale, const Locale('id'));
    });

    test('toggleLocale toggles from id to en', () {
      final provider = LocalizationProvider();
      provider.setLocale(const Locale('id'));
      provider.toggleLocale();
      expect(provider.locale, const Locale('en'));
    });

    // Hypothetical test cases for invalid locale, assuming extended functionality
    test('setLocale throws exception for unsupported locale', () {
      final provider = LocalizationProvider();
      expect(() => provider.setLocale(const Locale('fr')), throwsException);
    });

    test('setLocale with invalid locale does not change current locale', () {
      final provider = LocalizationProvider();
      provider.setLocale(const Locale('en')); // Set to a valid locale first
      try {
        provider.setLocale(const Locale('fr')); // Attempt to set an invalid locale
      } catch (_) {
        // Ignoring exception for this test case
      }
      expect(provider.locale, const Locale('en')); // Locale should remain unchanged
    });

    test('toggleLocale after attempting to set an invalid locale', () {
      final provider = LocalizationProvider();
      provider.setLocale(const Locale('en')); // Set to a valid locale first
      try {
        provider.setLocale(const Locale('fr')); // Attempt to set an invalid locale
      } catch (_) {
        // Ignoring exception for this test case
      }
      provider.toggleLocale(); // Should still toggle to the next valid locale
      expect(provider.locale, const Locale('id'));
    });
  });
}