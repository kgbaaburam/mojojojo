package Mojojojo::Entry;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub form {
	my $self = shift;

	$self->render(
		message => 'Welcome to the Mojolicious real-time web framework!'
	);
}

sub data {
	my $self = shift;
	
	
	$self->render(
		my ({
			date => $self -> param('date'),
			lieuDepart => $self -> param('lieuDepart'),
			lieuArrivee => $self -> param('lieuArrivee')
		})
	);
}

sub service{
	my $self = shift;
	warn "client connected\n";
	$self->send_message( 'Congratulations, your Mojo is working!' );
	$self->on_finish( sub {
		# put your disconnected client handling here
		warn "client disconnected\n";
	} );
	$self->on_message(sub {
		my ( $self, $message ) = @_;
		$self->send_message( 'echo:'.$message );
	});
};

1;
