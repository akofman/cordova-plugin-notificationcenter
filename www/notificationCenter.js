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
      },
      null,
      "NotificationCenter",
      "addObserver",
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

notificationCenter = new NotificationCenter();
module.exports = notificationCenter;
