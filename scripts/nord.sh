#!/bin/bash
ARG="$1"
LOCATION="$2"
CMD='sudo nordvpn'
disconnect(){
    $CMD set killswitch false
    $CMD disconnect
}

connect(){
    $CMD set killswitch true
    $CMD connect $LOCATION
}

#sudo nordvpn connect Estonia
if [[ $ARG == connect ]]
then
  connect
fi

if [[ $ARG == disconnect ]]
then
  disconnect
fi
