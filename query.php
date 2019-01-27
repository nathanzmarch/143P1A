<!DOCTYPE html>
<html>
<head>
	<title>CS143 Web Query Interface</title>
</head>
<body style="display: flex; flex-direction: column; align-items: center;">
	<h1 style="margin-top: 100px; margin-bottom: 0;">CS143 Web Query Interface</h1><br>
	<h5>Note: tables and fields are case sensitive.</h5>

	<form action="query.php" method="GET">
      <textarea name="query" cols="60" rows="8"><?php print "$query" ?></textarea><br />
      <input type="submit" value="Submit" />
   </form>

   <br>

	<?php
	if($_GET["query"]) {
		// Connection init
		$db_connection = mysql_connect("localhost", "cs143", "");
		if (!$db_connection) {
			echo "Failed to connect to database!";
		    exit(1);
		}
		mysql_select_db("CS143", $db_connection);

		// Grab query
		$query = $_GET["query"];
		// Sanitizing inputs actually breaks string matching for some reason
		// $sanitized_query = mysql_real_escape_string($query, $db_connection);
		$rs = mysql_query($query, $db_connection);

		// Query handling
		if (!$rs) {
			echo $query;
			echo "<br>Invalid query or field. Please enter a valid SELECT query.";
		}
		else if (mysql_num_fields($rs)) {
			echo "<table border=1>";

			// Column name row
			echo "<tr>";
			$i = 0;
			while ($i < mysql_num_fields($rs)) {
				$schema = mysql_fetch_field($rs);
				echo "<td> $schema->name </td>";
				$i++;
			}
			echo "</tr>";

			// Everything else
			while ($row = mysql_fetch_row($rs)) {
				echo "<tr>";
				foreach ($row as $val) {
					echo "<td>";
					if ($val) echo "$val";
					else echo "NULL";
					echo "</td>";
				}
				echo "</tr>";
			}

			echo "</table>";
		}

		mysql_close($db_connection);
	}
	?>

	
</body>
</html>