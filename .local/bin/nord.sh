#!/bin/bash
ARG="$1"
CMD='sudo nordvpn'
LOCATION='estonia'

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
