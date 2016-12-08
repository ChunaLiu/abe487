#!/usr/bin/env perl6
sub MAIN (Str $input!) {
    my $dna = $input.IO.e ?? $input.IO.slurp !! $input;
    say $dna.trans('T' => 'U');

}


