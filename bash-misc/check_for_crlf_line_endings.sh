find . -not -type d -exec file "{}" ";" | grep CRLF
