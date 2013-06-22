use strict;
use warnings;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), qw(.. exlib lib perl5));
use lib File::Spec->catdir(dirname(__FILE__), qw(.. lib));
use Plack::Builder;
use Amon2::Lite;

sub load_config {
    return +{
        repository => +{
            'hook'           => "$ENV{HOME}/project/hooks/sample.pl",
            'android-sample' => "$ENV{HOME}/project/android-sample/hook.pl",
        },
    };
}

get '/' => sub { shift->render('index.tx') };

post '/github/:repository' => sub {
    my ($c, $p) = @_;

    my $repo = $p->{repository};
    my %config = %{ $c->config->{repository} };

    system($config{$repo});

    return $c->create_response(200);
};

__PACKAGE__->template_options(
    syntax => 'Kolon',
    cache  => 0,
);

__PACKAGE__->enable_middleware('ReverseProxy');

__PACKAGE__->to_app();

__DATA__

@@ index.tx
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Hooks Web</title>
</head>
<body>

</body>
</html>
