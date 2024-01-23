import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:melancholy/pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PixelAdventure game = PixelAdventure();

  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(
    GameWidget(
      game: kDebugMode ? PixelAdventure() : game,
    ),
  );
}
