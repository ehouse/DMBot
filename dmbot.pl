#!/usr/bin/perl

use strict;
use warnings;

package DMBot;
use base qw(Bot::BasicBot);

my $dm = DMBot->new(
    server      =>  "",
    port        =>  "",
    channels    =>  [""],
    
    nick        =>  "DMBot",
    alt_nicks   =>  ["The_Real_DMBot"],
    username    =>  "DMBot",
    name        =>  "D&D DM Bot",

    ignore_list =>  [qw(RepBot ChanServ)],
);

sub said {
    my ($self, $message) = @_;
    if ($message->{body} =~ /^!roll[\s]+(?<num>\d+)?d(?<sides>\d+)/){
        my $dice = (defined $+{num}) ? int($+{num}) : 1;
        my $sides = $+{sides};
        if ($sides == 0 || $dice == 0){
            return 0;
        }
        my $val = int(rand($dice*$sides))+$dice;
        if ($val == $dice*$sides){
            return "$val!";
        }
        elsif ($val == $dice){
            return "$val!";
        }
        else{
            return "$val";
        }
    }
}

$dm->run();
