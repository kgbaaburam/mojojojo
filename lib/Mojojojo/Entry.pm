package Mojojojo::Entry;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::JSON;



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
		lieuArrivee => $self -> param('lieuArrivee')
	);
}

sub service {
	my $self = shift;
	$self->on(
		message => sub{
			my ($self, $msg) = @_;
						
			my $json = Mojo::JSON->new;
			for (my $i=0; $i<10; $i++) {
				$self->send(
					$json->encode({ c  => $i})
				);
				sleep(1);
			}
		}
	);
		
}

1;
