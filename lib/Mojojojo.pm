package Mojojojo;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
	my $self = shift;

	# Documentation browser under "/perldoc"
	$self->plugin('PODRenderer');

	# Router
	my $r = $self->routes;

	# Normal route to controller
	$r->get('/form')->to('Entry#form');
  
	$r->get('/recherche')->to('Entry#recherche');
  
	$r->websocket('/service')->to('Entry#service');
}

1;
