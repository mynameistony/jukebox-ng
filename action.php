<?php
	if(isset($_GET["a"])){
		$a = $_GET["a"];
		if("$a"=="current"){
			echo shell_exec("bash ./action.sh");
		}else{
			echo shell_exec("bash ./action.sh $a");
		}
	}else{
		if(isset($_GET["t"])){
			$t = $_GET["t"];
			if(isset($_GET["artist"])){
				$a = $_GET["artist"];
				echo shell_exec("bash ./list.sh $t $a");
			}else{				
				echo shell_exec("bash ./list.sh $t");
			}
		}
	}
?>