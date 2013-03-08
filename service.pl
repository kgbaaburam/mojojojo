#####################################################################
#	service.pl / point d'entrée de la récupération des données		#
#####################################################################
# Nom des paramètres HTTP : 										#
#   - Date : 				"date"									#
#   - Lieu de depart : 		"depart"								#
#   - Lieu de d'arrivee : 	"arrivee"								#
#####################################################################
use Mojolicious::Lite;

#TODO : Récupération des paramètres POST
my $date = 1; 
my $depart = 1; 
my $arrivee = 1; 

my $xmlPath = "./services.xml";
my $params = TripParameter->constructeur($date, $depart, $arrivee);
my $facade = TripFacade -> constructeur($xmlPath);