#####################################################################
#	service.pl / point d'entrée de la récupération des données		#
#####################################################################
# Nom des paramètres HTTP : 										#
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
	
	#TODO : Récupération des paramètres POST
	my $date = 1; 
	my $depart = 1; 
	my $arrive = 1; 

	my $xmlPath = "./services.xml";
	my $params = TripParameter->new($date, $depart, $arrive);
	my $facade = TripFacade->new($xmlPath);
	
	$self->render($self);
} => results;


app->start;