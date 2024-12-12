package com.example.set_live_wallpaper
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.database.Cursor
import android.provider.MediaStore
import java.util.ArrayList
class MainActivity : FlutterActivity() {
    private val CHANNEL = "media_library_channel"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getVideosFromStorage") {
                val videoPaths = getVideosFromStorage()
                result.success(videoPaths)
            } else {
                result.notImplemented()
            }
        }
    }
    private fun getVideosFromStorage(): List<String> {
        val videoList = ArrayList<String>()
        val projection = arrayOf(MediaStore.Video.Media.DATA)
        val cursor: Cursor? = contentResolver.query(
            MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            null
        )
        cursor?.use {
            val columnIndex = cursor.getColumnIndexOrThrow(MediaStore.Video.Media.DATA)
            while (cursor.moveToNext()) {
                videoList.add(cursor.getString(columnIndex))
            }
        }
        return videoList
    }
}
