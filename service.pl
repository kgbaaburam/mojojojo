#####################################################################
#	service.pl / point d'entr�e de la r�cup�ration des donn�es		#
#####################################################################
# Nom des param�tres HTTP : 										#
#   - Date : 				"date"									#
#   - Lieu de depart : 		"depart"								#
#   - Lieu de d'arrivee : 	"arrivee"								#
#####################################################################
use Mojolicious::Lite;

use TripFacade;
use TripParameter;

# route principale
get '/' => sub{
	my $self = shift;
    return $self->render;
} => 'index';

#route service
get '/service.html' => sub{
	my $self = shift;
	
	print($self);
	
	#TODO : R�cup�ration des param�tres POST
	my $date = 1; 
	my $depart = 1; 
	my $arrive = 1; 

	my $xmlPath = "./services.xml";
	my $params = TripParameter->new($date, $depart, $arrive);
	my $facade = TripFacade->new($xmlPath);
	
	$self->render($self);
} => results;


app->start;