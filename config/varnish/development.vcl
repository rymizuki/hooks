backend hooks {
    .host = "localhost";
    .port = "8093";
}

sub vcl_recv {
    if (req.http.host == "hooks.ry-m.com") {
        set req.backend = hooks;
        return (pass);
    }
}
