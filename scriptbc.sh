#!/bin/bash

# scriptbc -- Wrapper for'bc' that returns the result of a calculation non-
# interactively. This overrides the default scale of 0, meaning you can't
# expect integer division to work without passing "-p 0

if [ "$1" = "-p" ] ; then 
	precision=$2
	shift 2
else 
	precision=2 # default precision
fi

# The << notation allows content from the sript to be treated as if it were
# typed into the input stream.
# This is referred to as writing a "here document"
bc -q << EOF
	scale=$precision
	$*
	quit
EOF

exit 0 

