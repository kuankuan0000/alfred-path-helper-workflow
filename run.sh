#!/bin/sh

filepath="$(osascript -e 'tell application "Finder" to get the POSIX path of (the selection as alias)')"
filename=$(basename "$filepath")
dirname=$(dirname "$filepath")
basename=${filename%.*}
extension=${filename##*.}

echo '{
  "items": [
    { "title": "[Full path]\\t\\t'"$filepath"'", "arg": "'$filepath'" },
    { "title": "[File name]\\t'"$filename"'", "arg": "'$filename'" },
    { "title": "[Base name]\\t'"$basename"'", "arg": "'$basename'" },
    { "title": "[Extension]\\t'"$extension"'", "arg": "'$extension'" },
    { "title": "[Directory]\\t'"$dirname"'", "arg": "'$dirname'" }
  ]
}'
