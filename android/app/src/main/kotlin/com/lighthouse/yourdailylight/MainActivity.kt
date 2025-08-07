package com.lighthouse.yourdailylight

import com.ryanheise.audioservice.AudioServiceActivity
import android.os.Bundle
import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache

class MainActivity : AudioServiceActivity() {

    // Optional: If you're caching a FlutterEngine (e.g., for background execution)
    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return FlutterEngineCache.getInstance().get("my_engine_id")
    }

    // Optional: if you need onCreate for anything specific
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Custom native initialization if needed
    }
}
