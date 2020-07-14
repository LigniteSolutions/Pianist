package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.appleeducate.appreview.AppReviewPlugin;
import io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin;
import io.flutter.plugins.firebase.core.FirebaseCorePlugin;
import com.appleeducate.fluttermidi.FlutterMidiPlugin;
import io.flutter.plugins.packageinfo.PackageInfoPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;
import flutter.plugins.vibrate.VibratePlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AppReviewPlugin.registerWith(registry.registrarFor("com.appleeducate.appreview.AppReviewPlugin"));
    FirebaseAdMobPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin"));
    FirebaseCorePlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebase.core.FirebaseCorePlugin"));
    FlutterMidiPlugin.registerWith(registry.registrarFor("com.appleeducate.fluttermidi.FlutterMidiPlugin"));
    PackageInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.packageinfo.PackageInfoPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
    VibratePlugin.registerWith(registry.registrarFor("flutter.plugins.vibrate.VibratePlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
