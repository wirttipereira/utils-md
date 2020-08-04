<?php
 if(isset($_POST['submit']))
 {
   $output=shell_exec('sh /somePATH/cgi-bin/script.sh');
   echo $output;
 }
?>

<form action="" method="post">
<input type="submit" name="submit" value="Call my Shell Script">
</form>