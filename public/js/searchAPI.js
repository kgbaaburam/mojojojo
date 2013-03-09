if(typeof window.SearchAPI=='undefined'){
	window.SearchAPI= {};
}

SearchAPI.SearchURI = "ws://localhost:3000/service";

SearchAPI.SearchManager = function(_date, _depart, _arrivee){
	this.date = _date;
	this.depart = _depart;
	this.arrivee = _arrivee;
	
	this.socket = null;
}


SearchAPI.SearchManager.prototype.start = function(){
	// Création du socket
	this.socket = new WebSocket(SearchAPI.SearchURI);  
	
	// Association de la méthode on message
	this.socket.onmessage = (function(o){
		return function(_t){
			o.onMessage(_t);
		}
	})(this);
	
	this.socket.onopen  = (function(o){
		return function(){
			o.connected();
		}
	})(this)
	
	
}

SearchAPI.SearchManager.prototype.connected = function(){
	// Construction du message
	var text = "{date : '"+this.date+"',lieuDepart : '" + this.depart +"',lieuArrivee : '" + this.arrivee + "'}";
	
	// Anvoi du message au serveur
	this.socket.send(text);
}

SearchAPI.SearchManager.prototype.stop = function(){
	if(this.socket!=null){
		this.socket = null;  
	}
}

SearchAPI.SearchManager.prototype.onMessage = function(_transport){
	var message = _transport.data;
	var div = document.createElement('div');
	div.innerHTML = message;
	
	var el =$("#lPH");
	el.append(div);
}

$(function(){
	// Récupération des valeurs
	var date = $("#datepicker");
	var depart = $("#lieuDepart");
	var arrivee = $("#lieuArrivee");
	
	// Instanciation de la classe
	(new SearchAPI.SearchManager()).start(date.value, depart.value, arrivee.value);
});
