// thx to http://pauillac.inria.fr/~xleroy/experiment.html
function decrypt_me_silly(msg, text) {
  msg = msg.replace(/[^A-Z_\-0-9 .@]/g, "").toLowerCase();
  document.write("<a href=\"mailto:" + msg + "\">" + text + "</a>");
}

function nospam() {
  document.getElementById('ray_bot').value = 'R';
}