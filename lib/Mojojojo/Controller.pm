package Mojojojo::Entry;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub form {
	my $self = shift;

	$self->render();
}

sub recherche {
	my $self = shift;
	$self->render(
		date => $self -> param('date'),
		lieuDepart => $self -> param('lieuDepart'),
		lieuDepart => $self -> param('lieuDepart')
	);
}



1;
