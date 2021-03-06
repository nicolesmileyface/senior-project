#!/bin/bash

case $1 in
"start")
  msg="Running!"
  pushd thesaurus
  ./app.sh boot
  popd
  ;;
"stop")
  msg="Stopping!"
  pushd thesaurus
  ./app.sh stop
  popd
  ;;
"dev")
  msg="Running dev server!"
  pushd thesaurus
  ./app.sh dev
  popd
  ;;
"restart")
  msg="Booting!"
  pushd thesaurus
  ./app.sh stop
  ./app.sh boot
  popd
  ;;
"lines")
  scc -i vue,js,ts,py,go,sh,yaml .
  ;;
*)
  msg="Oops! '$1' is not a valid option:\noptions: \n\tstart \n\tstop \n\trestart \n\tlines"
  ;;
esac

echo -e $msg
