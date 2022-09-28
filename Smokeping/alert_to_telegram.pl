#!/usr/bin/perl

use URI::Escape;

$vAlert      =$ARGV[0];
$vTarget     =$ARGV[1];
$vPktLoss    =$ARGV[2];
$vRTT        =$ARGV[3];
$vHostName   =$ARGV[4];
$vEdgeTrigger=$ARGV[5];


$bot_token = "your_token";
$chat_id = "your_id";

$msg = "$vAlert $vTarget $vPktLoss $vRTT $vHostName $vEdgeTrigger";

$url_encode = uri_escape($msg);

$curl=`curl -s "https://api.telegram.org/bot$bot_token/sendMessage?chat_id=$chat_id&text=$url_encode"`;
