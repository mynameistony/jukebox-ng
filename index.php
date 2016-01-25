<link rel="stylesheet" href="/style.css">
<script type="text/javascript" src="/scripts.js"></script>
<center>
<p class=text id="info"></p>
<!--<?php
	echo shell_exec("bash ./action.sh");
?>-->
<p id="controls" class="controls">
<p>
<button class="half button" onclick=musicAction("prev")>Previous</button>
<button class="half button" onclick=musicAction("next")>Next</button>
</p>

<p>
<button class="half button" onclick=showInfo("artist")>View Artists</button>
<button class="half button" onclick=showInfo("title")>View Tracks</button>
</p>
<p id="infoholder"></p>
</center>
</p>
<script type="text/javascript">refreshCurrentSong()</script>
<script type="text/javascript">setInterval(refreshCurrentSong,"2500")</script>