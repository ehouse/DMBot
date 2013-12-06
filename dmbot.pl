#!/usr/bin/perl

use strict;
use warnings;

package DMBot;
use base qw(Bot::BasicBot);

use utf8;
use Data::Dumper;
use YAML::Tiny;

my $yaml = YAML::Tiny->read('config.yml');

my $dm = DMBot->new(
    server      =>  $yaml->[0]->{server},
    port        =>  $yaml->[0]->{port},
    channels    =>  $yaml->[0]->{channels},
    
    nick        =>  $yaml->[0]->{nick},
    alt_nicks   =>  $yaml->[0]->{alt_nicks},
    username    =>  $yaml->[0]->{username},
    name        =>  $yaml->[0]->{name},

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
