#!/usr/bin/perl

my $file = 'appendices/assets/preliminary-report';
my $texmfdist = `kpsewhich -var-value TEXMFDIST`;
my $texmfvar = `kpsewhich -var-value TEXMFVAR`;
$texmfdist =~ s/\n//g;
$texmfvar =~ s/\n//g;
my $paxscript = $texmfdist.'/scripts/pax/pdfannotextractor.pl';

if (!-d $texmfvar) {
	system('mkdir', '-p', $texmfvar);
}

if (!-e $file.".pax") {
	system($paxscript, '--install');
}

system($paxscript." ".$file.'.pdf');
