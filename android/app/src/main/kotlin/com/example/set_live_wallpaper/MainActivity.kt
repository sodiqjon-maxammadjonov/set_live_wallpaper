import android.os.Environment
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity: FlutterActivity() {
    private val CHANNEL = "media_library_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getImagesFromStorage") {
                val imagePaths = fetchImagesFromStorage()
                result.success(imagePaths)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun fetchImagesFromStorage(): List<String> {
        val imagePaths = mutableListOf<String>()
        val externalStorageDir = Environment.getExternalStorageDirectory().path + "/Pictures"

        val directory = File(externalStorageDir)
        if (directory.exists()) {
            val files = directory.listFiles { file ->
                file.extension.equals("jpg", ignoreCase = true) ||
                        file.extension.equals("jpeg", ignoreCase = true) ||
                        file.extension.equals("png", ignoreCase = true)
            }
            files?.forEach { file -> imagePaths.add(file.absolutePath) }
        }

        return imagePaths
    }
}
