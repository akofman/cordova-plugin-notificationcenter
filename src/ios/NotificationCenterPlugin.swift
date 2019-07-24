import Foundation;

@objc(NotificationCenterPlugin) class NotificationCenterPlugin : CDVPlugin {
    var allNotificationsObserver: AnyObject? = nil;
    var addedObservers = [String: AnyObject]();

    func addObserver(command: CDVInvokedUrlCommand) {
        let notificationCenter = NotificationCenter.default;
        let notificationName = command.arguments[0] as! String;

        if(notificationName == "all" && allNotificationsObserver == nil){
			allNotificationsObserver = notificationCenter.addObserver(forName: nil, object: nil, queue: nil) { notification in
				self.didReceiveNotification(notification: notification as NSNotification, command: command);
            };
        }

        if(notificationName != "all"){
			let observer = notificationCenter.addObserver(forName: NSNotification.Name(rawValue: notificationName), object: nil, queue: nil) { notification in
				self.didReceiveNotification(notification: notification as NSNotification, command: command);
            };

            addedObservers[notificationName] = observer;
        }
    }

    func removeObserver(command: CDVInvokedUrlCommand) {
        let notificationCenter = NotificationCenter.default;
        let notificationName = command.arguments[0] as! String;

        if(notificationName == "all"){
            if(allNotificationsObserver != nil){
                notificationCenter.removeObserver(allNotificationsObserver!);
                allNotificationsObserver = nil;
            }

            if(addedObservers.count != 0){
                for(_,observer) in addedObservers{
					NotificationCenter.default.removeObserver(observer);
                }

                addedObservers.removeAll();
            }
        }

        if(notificationName != "all"){
            if(addedObservers[notificationName] != nil){
				notificationCenter.removeObserver(addedObservers[notificationName]!, name: NSNotification.Name(rawValue: notificationName), object: nil);
                addedObservers[notificationName] = nil;
            }
        }
    }

    private func didReceiveNotification (notification: NSNotification, command: CDVInvokedUrlCommand) {
		let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: notification.name.rawValue);
		pluginResult!.setKeepCallbackAs(true);
		commandDelegate!.send(pluginResult, callbackId:command.callbackId);
    }
}
