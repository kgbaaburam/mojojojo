use Mojolicious::Lite;
use Mojo::UserAgent;
use URI::Escape;

my $ua = Mojo::UserAgent->new;


my $depart = "bordeaux";
my $arrivee = "paris";
my $date = uri_escape("08/03/2013");


my $url = "http://www.covoiturage.fr/recherche?fc=".$depart."&tc=".$arrivee."&d=".$date."&to=BOTH&p=1&n=20&t=tripsearch&a=searchtrip";



my $contenu = $ua->get($url)->res->dom('li.one-trip');

# my $contenu = $ua->get($url)->res->dom->html->body;


#   say $ua->get('mojolicio.us')->res->dom->html->head->title->text;


get '/' => {text => $contenu};



app->start;