// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import $ from 'jquery';

function loadTweets() {
  $('#tweets').load('/tweets');
}

var App = {
  setupTwitter: function setupTwitter() {
    loadTweets();

    $('#send_tweet').click((ev) => {
      ev.preventDefault();
      $('#send_tweet').hide();
      $('#send_tweet_status').html('Sending...');

      $.ajax(
        {
          url: '/tweets',
          type: 'post',
          data: { message: $('#tweet_message').val() },
          headers: {
            'x-csrf-token': $('#csrf_token').val()
          }
        }
      ).done(() => {
        $('#send_tweet_status').html('Sent!');
        $('#send_tweet').show();
        loadTweets();
      });

    });
  }
};

module.exports = {
  App: App
};
