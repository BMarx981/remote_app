package com.example.remote_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import com.connectsdk.device.ConnectableDevice
import com.connectsdk.discovery.DiscoveryManager
import com.connectsdk.service.capability.VolumeControl
import com.connectsdk.service.capability.MediaControl

class MainActivity: FlutterActivity() {
    private val CHANNEL = "connectsdk/flutter"
    private var device: ConnectableDevice? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "turnOn" -> {
                    device?.powerControl?.powerOn(result::success)
                }
                "turnOff" -> {
                    device?.powerControl?.powerOff(result::success)
                }
                "increaseVolume" -> {
                    device?.volumeControl?.volumeUp(result::success)
                }
                "decreaseVolume" -> {
                    device?.volumeControl?.volumeDown(result::success)
                }
                "changeChannel" -> {
                    val channel = call.argument<Int>("channel")
                    
                }
                else -> result.notImplemented()
            }
        }
    }
}
