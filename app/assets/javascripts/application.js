// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(document).ready(function ($) {
    $('.toggleswitch').toggleSwitch({
        onChangeOn: function () {
            console.log('Toggle Switch was changed to the ON position');
        },
        onChangeOff: function () {
            console.log('Toggle Switch was changed to the OFF position');
        }
    });
});

 var currentdate = 0;
 var image_number = 0;
 function ImageArray (n) {
   this.length = n;
   for (var i =1; i <= n; i++) {
     this[i] = ' '
   }
 }
 image = new ImageArray(9)
 image[0] = '1.jpg'
 image[1] = '2.jpg'
 image[2] = '3.jpg'
 image[3] = '4.jpg'
 image[4] = '5.jpg'
 image[5] = '6.jpg'
 image[6] = '7.jpg'
 image[7] = '8.jpg'
 image[8] = '9.jpg'
 var rand = 60/image.length
 function randomimage() {
  currentdate = new Date()
  image_number = currentdate.getSeconds()
  image_number = Math.floor(image_number/rand)
  return(image[image_number])
 }
 document.write('<div class="fanart" style="background-image: url(assets/' + randomimage() + ');"></div>');
 document.write('<div class="fanart-overlay"></div>')
