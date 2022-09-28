#!/usr/bin/perl

use URI::Escape;

$mail = $ARGV[0];

$bot_token = "your_token";
$chat_id = "your_id";

$msg = "$mail";

$url_encode = uri_escape($msg);

$curl=`curl -s "https://api.telegram.org/bot$bot_token/sendMessage?chat_id=$chat_id&parse_mode=HTML&text=$url_encode"`;
