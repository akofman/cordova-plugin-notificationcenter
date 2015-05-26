# cordova-plugin-notificationcenter

[Cordova plugin](https://www.npmjs.com/package/cordova-plugin-notificationcenter)
> Bridge between iOS NSNotificationCenter and JavaScript.

> There are tons of notifications that get posted by various components in the iOS SDK.
Sometimes it can be useful to observe these native notifications in JavaScript.

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
