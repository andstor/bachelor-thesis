#!/usr/bin/perl

my $file = 'appendices/assets/preliminary-report';
my $texmfdist = `kpsewhich -var-value TEXMFDIST`;
my $paxscript = $texmfdist.'/scripts/pax/pdfannotextractor.pl';
$paxscript =~ s/\n//g;

if (!-e $file.".pax") {
	system($paxscript, '--install');
}

system($paxscript." ".$file.'.pdf');