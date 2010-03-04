use strict;
use inc::Module::Install;
name 'POE-Component-CPANIDX';
author 'Chris Williams <chris@bingosnet.co.uk>';
version_from 'lib/POE/Component/CPANIDX.pm';
abstract_from 'lib/POE/Component/CPANIDX.pm';
readme_from 'lib/POE/Component/CPANIDX.pm';
license 'perl';
auto_license holder => 'Chris Williams';
perl_version '5.006';
build_requires 'Test::More' => 0.47;
requires 'POE' => '1.287';
requires 'POE::Component::Client::HTTP' => '0.895';
requires 'URI' => '1.52';
requires 'YAML::Tiny' => '1.41';
clean_files 'network.tests';
my $value;
if ( $Module::Install::AUTHOR ) {
  $value = 'y';
}
else {
  $value = prompt( 'Do you want live network tests [N/y]?', 'N' );
}
if ( $value =~ /^y$/i ) {
  open FH, "> network.tests" or die "$!\n";
  print FH "Bleh\n";
  close FH;
}
makemaker_args(dist => { PREOP => "$^X ./tools/git-log.pl > ./Changes" });
auto_provides;
githubmeta;
WriteAll();
