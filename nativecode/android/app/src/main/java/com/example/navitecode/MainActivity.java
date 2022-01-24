import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.common.MethodChannel;
import io.flutter.plugins.common.MethodChannel.MethodCallHandler;
import io.flutter.plugins.common.MethodCall;
import io.flutter.plugins.common,MethodChannel.Result;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.ERSION_CODES;
import android.os.Bundle;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate (Bundle savedInstanceState ) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel (getFlutterView(), "course.flutter.dev/battery").setMethod(
            new MethodCallHandler() {
                @Override
                public void onMethodCall(MethodCall call, Result result) {
                    if(call.method.equals("getBateryLevel")) {
                        int batteryLevel = getBateryLevel();
                        if (batteryLevel != -1){
                            result.success(batteryLevel);
                        } else {
                            result.error("UNAVAILABLE", "Could not fetch attery level", null);
                        }
                    } else {
                        result.notImplemented();
                    }
                }
            }
        );
    }

    private int getBattreryLevel() {
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).registerService(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getExtra(BatteryManager.EXTTRA_lEVEL. -1) * 100) / intent.getExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }
}