#!/usr/bin/perl

use strict;
use warnings;

package DMBot;
use base qw(Bot::BasicBot);

my $dm = DMBot->new(
    server      =>  "",
    port        =>  "",
    channels    =>  ["#DND"],
    
    nick        =>  "DMBot",
    alt_nicks   =>  ["The_Real_DMBot"],
    username    =>  "DMBot",
    name        =>  "D&D DM Bot",

    ignore_list =>  [qw(RepBot ChanServ)],
);

sub said {
    my ($self, $message) = @_;
    if ($message->{body} =~ /^!rtd(\d+)?/){
        if (defined $1){
            return int(rand($1))+1
        }
        else{
            return int(rand(20))+1
        }
    }
}

$dm->run();
