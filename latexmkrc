#!/usr/bin/perl

my $file = 'appendices/assets/preliminary-report';
my $texmfdist = `kpsewhich -var-value TEXMFDIST`;
my $texmfvar = `kpsewhich -var-value TEXMFVAR`;
my $paxscript = $texmfdist.'/scripts/pax/pdfannotextractor.pl';
$paxscript =~ s/\n//g;

if (!-e $file.".pax") {
#	system('mkdir -p /root/texlive/texmf-var');
	system('mkdir', '-p', $texmfvar);
	system($paxscript, '--install', '--debug');
}

system($paxscript." ".$file.'.pdf');
