#!/usr/bin/perl

my $dir = 'appendices/assets';
my $texmfdist = `kpsewhich -var-value TEXMFDIST`;
my $texmfvar = `kpsewhich -var-value TEXMFVAR`;
$texmfdist =~ s/\n//g;
$texmfvar =~ s/\n//g;
my $paxscript = $texmfdist.'/scripts/pax/pdfannotextractor.pl';

if (!-d $texmfvar) {
	system('mkdir', '-p', $texmfvar);
}

if (not my @files = glob "$dir/*.pax"){
	system($paxscript, '--install');
}

my @files = glob "$dir/*.pdf";
for (0..$#files){
	system($paxscript." ".$files[$_]);
}
