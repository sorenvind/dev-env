#!/bin/bash
# Show Git Changes in Subdirectories

BASE=`pwd`
REPOS=`ls -d */`
CMD="git status -s"

for REPO in $REPOS; do
  dir=$BASE/$REPO
  if [[ -d $dir/.git ]]; then
    cd $dir
    result=`$CMD`
    if [[ ${#result} > 0 ]]; then
      echo -e "\x1B[1;33m\xCE\xB4 Git Status :: $dir\x1B[0m" 
      #echo -e "\x1B[33m--------------------------------------------------------------------------------\x1B[0m"
      git status -s
      echo ""
    fi
  fi
done

echo -e "\x1B[1;94m\xE2\x88\xB4 All other subdirectories are clean."

# String Pattern Matching
#case "$longstring" in 
#  *pattern*)
#    # Do stuff
#    ;;
# esac

