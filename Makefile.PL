
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Bundle up your favorite modules and imports into one call',
  'AUTHOR' => 'Rodrigo de Oliveira <rodrigolive@gmail.com>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'rig',
  'EXE_FILES' => [
    'bin/rigup'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'rig',
  'PREREQ_PM' => {
    'Carp' => '0',
    'File::HomeDir' => '0',
    'File::Spec' => '0',
    'Hook::LexWrap' => '0',
    'YAML::XS' => '0',
    'version' => '0'
  },
  'VERSION' => '0.01_01',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



