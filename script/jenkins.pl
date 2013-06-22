use strict;
use warnings;
use utf8;
use 5.10.0;
use Data::Validator;
use Log::Minimal;
use Furl;

my $JENKINS_HOST = 'jenkins.ry-m.com';
my $JENKINS_PORT = '80';

my $furl = Furl->new(
    agent => 'hook/ry-m.com',
);

sub run {
    state $rule = Data::Validator->new(
        name  => 'Str',
        token => 'Str',
    )->with(qw(Sequenced));
    my $args = $rule->validate(@_);
    my %args = %$args;

    my $token = $args->{token};
    my $path = sprintf '/job/%s/build?token=%s' => @args{qw(name token)};

    my $res = $furl->request(
        method      => 'GET',
        scheme      => 'http',
        host        => $JENKINS_HOST,
        port        => $JENKINS_PORT,
        path_query  => $path,
    );
}

run(@ARGV);
