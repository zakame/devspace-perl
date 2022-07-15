use Mojolicious::Lite -signatures;

get '/' => sub ($c) {
  $c->render;
} => 'index';

app->start;

__DATA__
@@ index.html.ep
This is the app.pl file. Change CMD command in your Dockerfile to start
the container with a different Perl script.
