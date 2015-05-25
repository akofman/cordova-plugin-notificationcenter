import Foundation

@objc(NotificationCenterPlugin) class NotificationCenterPlugin : CDVPlugin {
  func debug(command: CDVInvokedUrlCommand) {
    let notificationCenter = NSNotificationCenter.defaultCenter();
    notificationCenter.addObserverForName(nil, object: nil, queue: nil) { notification in
        self.didReceiveNotification(notification, command: command);
    };
  }

  func didReceiveNotification (notification: NSNotification, command: CDVInvokedUrlCommand) {
    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: notification.name);
    pluginResult.setKeepCallbackAsBool(true);
    commandDelegate.sendPluginResult(pluginResult, callbackId:command.callbackId);
  }

}
