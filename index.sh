#!/bin/sh

if [ "$(echo $HTTP_USER_AGENT | grep -Ei 'curl|wget')" == '' ]; then
        echo -e "Content-Type: text/html\n"
		cat <<EOF
<!DOCTYPE html>
<html>
    <head>
        <title>Lighttpd - SH CGI</title>
		<meta charset="UTF-8">
	</head>
	<body>
		<table>
			<tr>
				<td><b>Webserver:</b></td><td>$SERVER_SOFTWARE</td>
			</tr>
			<tr>
				<td><b>Hostname:</b></td><td>$HOSTNAME</td>
			</tr>
			<tr>
				<td><b>Address:</b></td><td>$SERVER_ADDR</td>
			</tr>
			<tr>
				<td><b>Method:</b></td><td>$REQUEST_METHOD</td>
			</tr>
		</table>
	</body>
</html>
EOF
else
        cat <<EOF
Content-Type: text

Version:   $(sh echo $VERSION)
Webserver: $SERVER_SOFTWARE
Hostname:  $HOSTNAME
Address:   $SERVER_ADDR
Method:    $REQUEST_METHOD
EOF

fi

exit 0
