package com.example.women_safety_app

import android.os.Bundle
import android.view.KeyEvent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.women_safety_app/trigger"
    private lateinit var methodChannel: MethodChannel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        methodChannel = MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL)
        // Other initialization code (if needed)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if (keyCode == KeyEvent.KEYCODE_VOLUME_UP || keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
            // Intercept the volume button press and send the event to Flutter via MethodChannel
            flutterEngine?.let {
                methodChannel.invokeMethod("volumeButtonPressed", null)
            }
            return true // return true to consume the event
        }
        return super.onKeyDown(keyCode, event)
    }
}
