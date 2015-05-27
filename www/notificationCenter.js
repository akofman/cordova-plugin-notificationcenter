var exec = require('cordova/exec'),
    NotificationCenter = function () {};

/**
 * Start monitoring all notifications coming from the NSNotificationCenter.
 * Do not use that in production, it's a performance killer.
 *
 * @name startDebug
 */
 NotificationCenter.prototype.startDebug = function () {
  exec(function(notification){
        console.log(notification);
      },
      null,
      "NotificationCenter",
      "addObserver",
      ["all"]);
 };

 /**
  * Stop monitoring all notifications coming from the NSNotificationCenter.
  *
  * @name removeAllObservers
  */
  NotificationCenter.prototype.removeAllObservers = function () {
   exec(null,
       null,
       "NotificationCenter",
       "removeObserver",
       ["all"]);
  };

/**
 * Observe a given notification coming from the NSNotificationCenter.
 *
 * @name addObserver
 * @param {String} notification
 * @param {Function} success callback
 * @param {Function} error callback
 */
NotificationCenter.prototype.addObserver = function (notification, success, error) {
  if (!Array.isArray(notification)) {
   notification = [notification];
  }
  return exec(success, error, "NotificationCenter", "addObserver", notification);
};

/**
 * Stop observing a given notification coming from the NSNotificationCenter.
 *
 * @name removeObserver
 * @param {String} notification
 * @param {Function} success callback
 * @param {Function} error callback
 */
NotificationCenter.prototype.removeObserver = function (notification, success, error) {
  if (!Array.isArray(notification)) {
   notification = [notification];
  }
  return exec(success, error, "NotificationCenter", "removeObserver", notification);
};

notificationCenter = new NotificationCenter();
module.exports = notificationCenter;
