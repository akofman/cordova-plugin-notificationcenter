var exec = require('cordova/exec'),
    NotificationCenter = function () {};

/**
 * Monitor all notifications coming from the NSNotificationCenter.
 * Do not use that in production, it's a performance killer.
 *
 * @name debug
 */
 NotificationCenter.prototype.debug = function () {
     exec(function(notification){
             console.log(notification);
         }, null, "NotificationCenter", "debug");
 };

notificationCenter = new NotificationCenter();
module.exports = notificationCenter;
