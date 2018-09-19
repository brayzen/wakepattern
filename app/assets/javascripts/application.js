// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//  require ./channels
//= require cable
//= require ratings

// Update all timestamps fo clients local time
window.localStamp = function(stamp) {
    function paddedNumString(num) {
      return num < 10 ? "0" + num.toString(): num.toString();
    }
  
    var date = new Date(stamp.replace(' ', 'T').replace(' UTC', 'Z'));
    var month = paddedNumString(date.getMonth() + 1);
    var day = paddedNumString(date.getDate());
    var year = date.getFullYear();
    var hour = paddedNumString(date.getHours());
    var min = paddedNumString(date.getMinutes());
    var sec = paddedNumString(date.getSeconds());
    var localStamp = month + "/" + day + "/" + year + " " + hour + ":" + min + ":" + sec;
    return localStamp;
};

document.addEventListener("DOMContentLoaded", function() {
  var stamps = document.getElementsByClassName('stamp');
  Array.prototype.map.call(stamps, function(stamp) {
    stamp.innerHTML = localStamp(stamp.innerHTML);
  });
});
