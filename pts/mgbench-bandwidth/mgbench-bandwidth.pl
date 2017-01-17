#!/usr/bin/perl -w

use strict;
use warnings;

use List::Util qw(min max sum);

if (exists $ENV{LOG_FILE}) {
    open(STDOUT, ">$ENV{LOG_FILE}");
    $ENV{PATH} = "$ENV{TEST_EXTENDS}/mgbench/:".$ENV{PATH};
    open(STDERR, ">/tmp/aaa");
    use Data::Dumper; print STDERR Dumper(\@ARGV);
}

my %type = (h2d => {max => undef,
                    min => undef,
                    avg => undef,
                    list => []},
            d2d => {max => undef,
                    min => undef,
                    avg => undef,
                    list => []}
           );

my $cmd = (grep {$_ eq "halfduplex"} @ARGV) ? "halfduplex" : "fullduplex";

open(HALF, "$cmd | ") or die "Can't $cmd: $!";
my @lines = <HALF>;
close(HALF);

foreach my $line (@lines) {
    chomp($line);

    next unless $line =~ m/(?:(?:Copying from)|(?:Exchanging between)) (host|GPU \d+) (?:to|and) (host|GPU \d+): ([\d\.]+) MB/;
    if ($1 eq "host" or $2 eq "host") {
        push @{$type{h2d}{list}}, $3;
    } else {
        push @{$type{d2d}{list}}, $3;
    }
}
foreach  my $t (keys %type) {
    $type{$t}{list} = [0] unless @{$type{$t}{list}};
    $type{$t}{min} = min(@{$type{$t}{list}});
    $type{$t}{max} = max(@{$type{$t}{list}});
    $type{$t}{avg} = sum(@{$type{$t}{list}}) / scalar(@{$type{$t}{list}});
}

if (@ARGV) {
    foreach my $key (keys %type) {
        if (grep {$key eq $_} @ARGV) {
            foreach my $val (keys %{$type{$key}}) {
                if (grep {$val eq $_} @ARGV) {
                    print $type{$key}{$val}."\n";
                    exit 0;
                }
            }
            print "$key (min avg max): ";
            foreach my $val (qw(min avg max)) {
                print $type{$key}{$val}." ";
            }
            print "\n";
            exit 0;
        }
    }
    exit 1;
}

foreach my $key (qw(d2d h2d)) {
    print "$key (min avg max): ";
    foreach my $val (qw(min avg max)) {
        print $type{$key}{$val}." ";
    }
    print "\n";
}
