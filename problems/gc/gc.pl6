#!/usr/bin/env perl6

#use BioInfo::Parser::FASTA;

#use BioInfo::IO::FileParser;

sub MAIN (Str $file!, Rat :$threshold=0.3) {
    die "Not a file ($file)" unless $file.IO.f;

# or die "Not a file ($file)" unless $file.IO.f;
for $file.IO.lines -> $lines {
	 if !($lines ~~ /^\>/) {
	 my $b = $lines.uc.comb.Bag;

#    my $seq_file = BioInfo::IO::FileParser.new(
#        file     => $file,
#        parser   => BioInfo::Parser::FASTA
#    );

#   while (my $seq = $seq_file.get()) {
# put "$seq";
#  my $b = $seq.sequence.uc.comb.Bag;
    my $GC = sum($b<G C>)/$b.total;
# put "$GC";
    my $type = $GC > $threshold ?? "burkholderia"!!"anthrax";
    printf("%.2f: %s\n",$GC,$type);
	} 
}
}

