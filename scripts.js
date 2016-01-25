function musicAction(a){
	getPage("/action.php?a="+a,true);
	// var s = document.getElementById("state").innerHTML;
	// if(s == "1"){
	// 	document.getElementById("playbutton").innerHTML = "Pause";
	// }
	// else{
	// 	document.getElementById("playbutton").innerHTML = "Play";	
	// }
	refreshCurrentSong();
}

function playSong(id){
	// alert("Playing song #" + id);
	getPage("/action.php?a=play "+id,true);
	refreshCurrentSong();
}

function refreshCurrentSong(){
	getPage("/action.php?a=current",false,"info");
	// var s = document.getElementById("state").innerHTML;
	// if(s == "1"){
	// 	document.getElementById("playbutton").innerHTML = "Pause";
	// }
	// else{
	// 	document.getElementById("playbutton").innerHTML = "Play";	
	// }	
}

function showInfo(t){
	
	document.getElementById("infoholder").innerHTML = "<p class=text>Loading "+t+"s...</p>";
	getPage("/" + t +"s.html",true,"infoholder");
	window.location="/#controls";
}

function showTracks(a){
	document.getElementById("infoholder").innerHTML = "<p class=text>Loading tracks by " + a+"</p>";
	getPage("/action.php?t=artist&artist="+a,true,"infoholder");
	window.location="/#controls";
}

function getPage(theUrl,async,elemID)
{
    var h = new XMLHttpRequest();
    if(elemID != undefined){
	    h.onreadystatechange=function(){
			if (h.readyState==4 && h.status==200){
	    		document.getElementById(elemID).innerHTML=h.responseText;
	    	}
	  	}
  	}

    h.open( "GET", theUrl, async ); // false for synchronous request
    h.send( null );

}

function getSong(song){
	window.location = song;
}

function jumpToLetter(){
	var l = document.getElementById("letterPicker").value;
	window.location = "/#l"+l;
}