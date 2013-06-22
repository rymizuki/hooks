requires 'perl', '5.18.0';
requires 'Plack';
requires 'Plack::Middleware::ReverseProxy';
requires 'Starlet';
requires 'Amon2';
requires 'Amon2::Lite';

requires 'Log::Minimal';

on 'test' => sub {
    requires 'Test::More', '0.98';
};
