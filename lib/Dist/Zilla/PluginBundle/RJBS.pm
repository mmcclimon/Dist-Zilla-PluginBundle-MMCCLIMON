package Dist::Zilla::PluginBundle::RJBS;
# ABSTRACT: BeLike::RJBS when you build your dists

use Moose;
use Moose::Autobox;
with 'Dist::Zilla::Role::PluginBundle';

=head1 DESCRIPTION

This is the plugin bundle that RJBS uses.  It is equivalent to:

  [@Filter]
  bundle = @Classic
  remove = PodVersion
  remove = MetaYAML

  [AutoVersion]
  [MetaJSON]
  [NextRelease]
  [PodWeaver]
  [Repository]

=cut

use Dist::Zilla::PluginBundle::Filter;

sub bundle_config {
  my ($self, $section) = @_;
  my $class = (ref $self) || $self;

  my $arg = $section->{payload};

  my $major_version = defined $arg->{version} ? $arg->{version} : 0;
  my $format        = q<{{ $major }}.{{ cldr('yyDDD') }}>
                    . sprintf('%01u', ($ENV{N} || 0))
                    . ($ENV{DEV} ? (sprintf '_%03u', $ENV{DEV}) : '') ;

  my @plugins = Dist::Zilla::PluginBundle::Filter->bundle_config({
    name    => "$class/Classic",
    payload => {
      bundle => '@Classic',
      remove => [ qw(PodVersion) ],
    },
  });

  my $prefix = 'Dist::Zilla::Plugin::';
  my @extra = map {[ "$class/$prefix$_->[0]" => "$prefix$_->[0]" => $_->[1] ]}
  (
    [
      AutoVersion => {
        major     => $major_version,
        format    => $format,
        time_zone => 'America/New_York',
      }
    ],
    [ MetaJSON     => { } ],
    [ NextRelease  => { } ],
    [ PodWeaver    => { config_plugin => '@RJBS' } ],
    [ Repository   => { } ],
  );

  push @plugins, @extra;

  eval "require $_->[1]" or die for @plugins; ## no critic Carp

  return @plugins;
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
