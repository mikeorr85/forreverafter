(function ($, window) {
  window.Forreverafter = window.Forreverafter || {}

  Forreverafter.Photos = {
    init: function() {
      Forreverafter.Photos.initGallery();
    },
    initGallery: function() {
      $('ul.first').bsPhotoGallery({
        "classes" : "col-lg-2 col-md-4 col-sm-3 col-xs-4 col-xxs-12",
        "hasModal" : true
      });
    }
  }

  window.Forreverafter = Forreverafter;
  $(document).ready( Forreverafter.Photos.init );
  $(document).on('turbolinks:load', Forreverafter.Photos.init );

})(jQuery, this);

