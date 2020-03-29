#!/usr/bin/perl

my $file = 'appendices/assets/preliminary-report';
my $texmfdist = `kpsewhich -var-value TEXMFDIST`;
my $paxscript = $texmfdist.'/scripts/pax/pdfannotextractor.pl';
$paxscript =~ s/\n//g;

if (!-e $file.".pax") {
	system('ls -al /root');
	system('ls -al /root/texlive');
	system('ls -al /root/texlive/texmf-var');
	system('mkdir -p /root/texlive/texmf-var');
	system('perl '.$paxscript.' --install --debug');
	
}

system($paxscript." ".$file.'.pdf');
