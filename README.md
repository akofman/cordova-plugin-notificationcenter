# cordova-plugin-notificationcenter

[![NPM](https://nodei.co/npm/cordova-plugin-notificationcenter.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/cordova-plugin-notificationcenter/)

[Cordova plugin](https://www.npmjs.com/package/cordova-plugin-notificationcenter)
> Bridge between iOS [NSNotificationCenter](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSNotificationCenter_Class/) and JavaScript.

> There are tons of native notifications broadcasted by various components from the iOS SDK.
Sometimes it can be useful to observe them from the JavaScript side.

> :warning: This plugin does not handle pushNotifications or localNotifications. This is not the purpose.  

## Usage

Add specific observers :
```js
cordova.plugins.notificationCenter.addObserver('NSManagingContextDidSaveChangesNotification',function(){
  console.log('NSManagingContextDidSaveChangesNotification has been sent');
});

cordova.plugins.notificationCenter.addObserver('UIDeviceOrientationDidChangeNotification',function(){
  console.log('UIDeviceOrientationDidChangeNotification has been sent');
});
```
Remove a specific observer :

```js
cordova.plugins.notificationCenter.removeObserver('NSManagingContextDidSaveChangesNotification');
```

Remove all the added observers :
```js
cordova.plugins.notificationCenter.removeAllObservers();
```

Enter the debug mode in order to observe all native notifications ( :warning: do not use this in production ! It's a performance killer ) :
```js
cordova.plugins.notificationCenter.startDebug();
```

## License

MIT © [Alexis Kofman](http://twitter.com/alexiskofman)
