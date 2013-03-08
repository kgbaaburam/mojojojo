#####################################################################
#	service.pl / point d'entr�e de la r�cup�ration des donn�es		#
#####################################################################
# Nom des param�tres HTTP : 										#
#   - Date : 				"date"									#
#   - Lieu de depart : 		"depart"								#
#   - Lieu de d'arrivee : 	"arrivee"								#
#####################################################################
use Mojolicious::Lite;

#TODO : R�cup�ration des param�tres POST
my $date = 1; 
my $depart = 1; 
my $arrivee = 1; 

my $xmlPath = "./services.xml";
my $params = TripParameter->constructeur($date, $depart, $arrivee);
my $facade = TripFacade -> constructeur($xmlPath);