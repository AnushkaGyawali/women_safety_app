// siren_screen.dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SirenScreen extends StatefulWidget {
  const SirenScreen({Key? key}) : super(key: key);

  @override
  _SirenScreenState createState() => _SirenScreenState();
}

class _SirenScreenState extends State<SirenScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the audio player when not needed
    super.dispose();
  }

  void _toggleSiren() async {
    if (_isPlaying) {
      await _audioPlayer.stop(); // Stop the siren sound
    } else {
      await _audioPlayer.play(AssetSource('siren.mp3')); // Play the siren sound
    }
    setState(() {
      _isPlaying = !_isPlaying; // Toggle the playing state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siren'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleSiren,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          child: Text(
            _isPlaying ? 'Stop Siren' : 'Play Siren',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
