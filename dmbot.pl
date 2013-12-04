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
    if ($message->{body} =~ /^!roll[\s]+(\d+)?d(\d+)/){
        my $numDice = (defined $1) ? int($1) : 1;
        my $val = 0;
        $val += (int(rand($2))+1) for (0 .. $numDice);
        return $val
    }
}

$dm->run();
