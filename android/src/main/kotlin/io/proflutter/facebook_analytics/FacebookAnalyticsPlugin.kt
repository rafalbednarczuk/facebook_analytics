package io.proflutter.facebook_analytics

import android.app.Activity
import android.os.Bundle
import com.facebook.appevents.AppEventsLogger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FacebookAnalyticsPlugin(private val context: Activity, private val methodChannel: MethodChannel, private val logger: AppEventsLogger = AppEventsLogger.newLogger(context)) : MethodCallHandler {
    init {
        this.methodChannel.setMethodCallHandler(this)
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "facebook_analytics")
            channel.setMethodCallHandler(FacebookAnalyticsPlugin(registrar.activity(), channel))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when {
            call.method == "logEvent" -> {
                val parameterBundle = createBundleFromMap(call.argument("parameters") as Map<String, Any>?)
                logger.logEvent(call.argument("name"), parameterBundle)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun createBundleFromMap(map: Map<String, Any>?): Bundle? {
        if (map == null) {
            return null
        }

        val bundle = Bundle()
        for ((key, value) in map) {
            if (value is String) {
                bundle.putString(key, value)
            } else if (value is Int) {
                bundle.putInt(key, value)
            } else if (value is Long) {
                bundle.putLong(key, value)
            } else if (value is Double) {
                bundle.putDouble(key, value)
            } else if (value is Boolean) {
                bundle.putBoolean(key, value)
            } else {
                throw IllegalArgumentException(
                        "Unsupported value type: " + value.javaClass.canonicalName!!)
            }
        }
        return bundle
    }
}
