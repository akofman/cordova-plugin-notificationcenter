import Foundation;

@objc(NotificationCenterPlugin) class NotificationCenterPlugin : CDVPlugin {
  func addObserver(command: CDVInvokedUrlCommand) {
    let notificationCenter = NSNotificationCenter.defaultCenter();
    let filter = command.arguments[0] as! String;

    if(filter == "all"){
      notificationCenter.addObserverForName(nil, object: nil, queue: nil) { notification in
          self.didReceiveNotification(notification, command: command);
      };
    }
    else{
      notificationCenter.addObserverForName(filter, object: nil, queue: nil) { notification in
          self.didReceiveNotification(notification, command: command);
      };
    }
  }

  private func didReceiveNotification (notification: NSNotification, command: CDVInvokedUrlCommand) {
    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: notification.name);
    pluginResult.setKeepCallbackAsBool(true);
    commandDelegate.sendPluginResult(pluginResult, callbackId:command.callbackId);
  }
}
