import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const SimpsonsApp());
}

class SimpsonsApp extends StatelessWidget {
  const SimpsonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpsonsScreen(),
    );
  }
}

class SimpsonsScreen extends StatelessWidget {
  const SimpsonsScreen({super.key});

  static final AudioPlayer _player = AudioPlayer();

  // Random generator
  static final Random _random = Random();

  static Future<void> _playSound(String fileName) async {
    await _player.stop();

    final playPH = _random.nextDouble() < 0.3;
    final soundToPlay = playPH ? "PH.mp3" : fileName;

    await _player.play(AssetSource("sounds/$soundToPlay"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/msnbc/Components/Photos/060228/060228_simpsons_hmed_4p.jpg",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSoundButton("Homer", "homer.mp3"),
              const SizedBox(height: 20),
              _buildSoundButton("Flanders - Homer", "flanders.mp3"),
              const SizedBox(height: 20),
              _buildSoundButton("Maggie", "maggie.mp3"),
              const SizedBox(height: 20),
              _buildSoundButton("Bart", "bart.mp3"),
              const SizedBox(height: 20),
              _buildSoundButton("Nelson", "nelson.mp3"),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildSoundButton(String title, String soundFile) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 8, offset: Offset(1, 1)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          onPressed: () {
            _playSound(soundFile);
          },
          child: const Text("Play Sound"),
        ),
      ],
    );
  }
}
