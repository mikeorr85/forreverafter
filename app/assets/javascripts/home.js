(function ($, window) {
  window.Forreverafter = window.Forreverafter || {}

  Forreverafter.Home = {
    init: function() {
      $('#scrollLink').on('click', function (e) {
        e.preventDefault();

        document.getElementById('scheduleSection').scrollIntoView();
      });

      $('#scrollArrow').on('click', function (e) {
        e.preventDefault();

        document.getElementById('scheduleSection').scrollIntoView();
      });
    }
  }

  window.Forreverafter = Forreverafter;
  $(document).ready( Forreverafter.Home.init );

})(jQuery, this);

