requires 'perl', '5.18.0';
requires 'Plack';
requires 'Plack::Middleware::ReverseProxy';
requires 'Starlet';
requires 'Amon2';
requires 'Amon2::Lite';

requires 'Data::Validator';
requires 'Furl';
requires 'Log::Minimal';
requires 'Mouse';

requires 'Carton::CLI';

on 'test' => sub {
    requires 'Test::More', '0.98';
};
