# Permet de générer le schéma des services disponible en fonction d'un xml

package ServiceSchemasBuilder;

use Mojo::DOM;
use Mojo::UserAgent;
use File::Slurp;
use ServiceData;
use Schema;

sub build {

	my $xmlPath = @_[1]; # l'index 0 est le nom du package, le 1 est le chemin du xml
  	my $xml = read_file( $xmlPath ); # lecture du xml
	my $dom = Mojo::DOM->new($xml); # instanciation de l'objet DOM avec le contenu du fichier

	# liste des services

	my @services;

	for my $e ($dom->find('service')->each) {
		my $service = ServiceData->new($e->{class}, 
									   $e->{url});
    	#print $e->{class};
    	push(@services, $service);
 	} 

 	return Schema->new(@services);
}

1;