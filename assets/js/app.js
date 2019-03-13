// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery; // Bootstrap requires a global "$" object.
import "bootstrap";

function format_date(d) {
  var month = '' + (d.getUTCMonth() + 1),
      year = d.getUTCFullYear(),
      day = '' + d.getUTCDate(),
      hours = '' + d.getUTCHours(),
      minutes = '' + d.getUTCMinutes(),
      seconds = '' + d.getUTCSeconds();

  if (month.length < 2) month = '0' + month;
  if (day.length < 2) day = '0' + day;
  if (hours.length < 2) hours = '0' + hours;
  if (minutes.length < 2) minutes = '0' + minutes;
  if (seconds.length < 2) seconds = '0' + seconds;
  return [year, month, day].join('-') + ' ' + [hours, minutes, seconds].join(':');
}

$(function () {

  let start_time = '';

  $('#start-time').click((ev) => {
    let now = new Date(Date.now());
    start_time = format_date(now);
    alert(`Started working on task on ${start_time}`);
  });

  $('#stop-time').click((ev) => {
    let now = new Date(Date.now());
    let stop_time = format_date(now);
    let user_id = $(ev.target).data('user-id');
    let task_id = $(ev.target).data('task-id');

    let text = JSON.stringify({
      time: {
        user_id: user_id,
        task_id: task_id,
        start: start_time,
        stop: stop_time
      },
    });

    console.log(text);

    $.ajax(time_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (response) => {
        console.log(response);
      }
    });
  });
});
