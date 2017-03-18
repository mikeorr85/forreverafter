(function ($, window) {
  window.Forreverafter = window.Forreverafter || {}

  Forreverafter.Rsvp = {
    init: function() {
      Forreverafter.Rsvp.handleInviteLookup();
      Forreverafter.Rsvp.handleIsAttendingChange();

      var estiamtedPartyCount = 0;
    },
    handleInviteLookup: function() {
      $('#startRsvpBtn').on('click', function (e) {
        e.preventDefault();

        var inviteCode = $('#inviteCode').val();
        var lastName = $('#lastName').val();

        $.ajax({
          method: "GET",
          url: "/invites/lookup",
          data: {
            invite: {
              invite_code: inviteCode,
              last_name: lastName
            }
          },
          success: function(r) {
            if (r === null) {
              location.reload();
            } else {
              $('#inviteJumbotron').addClass('hidden');
              $('#rsvpJumbotron').removeClass('hidden');
              $('#inviteId').val(r.id);
              $('#guestName').text(r.guest);

              estiamtedPartyCount = r.estimated_party_count;
              $('#rsvp_guest_count').val(estiamtedPartyCount);
            }
          },
          error: function(err) {
            console.error(err);
          }
        });

      });
    },
    handleIsAttendingChange: function() {
      $('.row#isAttending input[type=radio]').on('change', function() {
        var isAttending = $('.row#isAttending input[type=radio]:checked').val();

        if (isAttending === 'yes') {
          $('#rsvp_guest_count').val(estiamtedPartyCount);
          $('#rsvpDetails').removeClass('hidden');
        } else {
          $('#rsvp_guest_count').val(0);
          $('#rsvp_vegetarian_count').val(0);
          $('#rsvpDetails').addClass('hidden');
        }

      });
    },
  }

  window.Forreverafter = Forreverafter;
  $(document).ready( Forreverafter.Rsvp.init );

})(jQuery, this);

