# This file is generated by Dist::Zilla::Plugin::CPANFile v6.014
# Do not edit this file directly. To change prereqs, edit the `dist.ini` file.

requires "Dist::Zilla" => "5.014";
requires "Dist::Zilla::Plugin::AutoPrereqs" => "1.100130";
requires "Dist::Zilla::Plugin::CheckExtraTests" => "0";
requires "Dist::Zilla::Plugin::CheckPrereqsIndexed" => "0";
requires "Dist::Zilla::Plugin::Git::Contributors" => "0";
requires "Dist::Zilla::Plugin::GithubMeta" => "0.12";
requires "Dist::Zilla::Plugin::PodWeaver" => "4";
requires "Dist::Zilla::Plugin::PromptIfStale" => "0";
requires "Dist::Zilla::Plugin::TaskWeaver" => "0.093330";
requires "Dist::Zilla::Plugin::Test::ChangesHasContent" => "0";
requires "Dist::Zilla::Plugin::Test::ReportPrereqs" => "0";
requires "Dist::Zilla::PluginBundle::Basic" => "0";
requires "Dist::Zilla::PluginBundle::Filter" => "0";
requires "Dist::Zilla::PluginBundle::Git" => "0";
requires "Dist::Zilla::Role::PluginBundle::Config::Slicer" => "0";
requires "Dist::Zilla::Role::PluginBundle::Easy" => "0";
requires "Dist::Zilla::Role::PluginBundle::PluginRemover" => "0.103";
requires "Moose" => "0";
requires "Pod::Elemental" => "0.092970";
requires "Pod::Elemental::PerlMunger" => "0.200000";
requires "Pod::Elemental::Transformer::List" => "0";
requires "Pod::Weaver" => "4";
requires "Pod::Weaver::Config::Assembler" => "0";
requires "Pod::Weaver::Section::Contributors" => "0.008";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "Test::More" => "0.96";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Encode" => "0";
  requires "Test::More" => "0";
  requires "Test::Pod" => "1.41";
};
