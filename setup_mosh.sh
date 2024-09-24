#!/bin/sh
## Setup
COMMAND="/usr/libexec/ApplicationFirewall/socketfilterfw"
SUDOCOMMAND="sudo $COMMAND"
MOSH=`which mosh-server`
REALMOSH=`readlink -f $MOSH`
FWSTATE=`$COMMAND --getglobalstate`
MOSHCHECK="$COMMAND --listapps"

## Is it in the firewall?
if $MOSHCHECK | grep -q $REALMOSH; then
	echo "$REALMOSH is present."
else
	echo "$REALMOSH is not present. Adding."
        $SUDOCOMMAND --add $MOSH
fi

## Unblock it

# Check for "Allow" status
if $MOSHCHECK | grep -A 1 $REALMOSH | grep -q "Allow"; then
   echo "$REALMOSH allows incoming connections.\nNo action taken."
else
   echo "$REALMOSH blocks incoming connections. Changing status."
   $SUDOCOMMAND --unblockapp $REALMOSH
   
   ## Toggle firewall if it's enabled
   case "$FWSTATE"
   in
   *enabled*)  echo "Firewall Enabled. Toggling state." 
         $SUDOCOMMAND --setglobalstate off
         $SUDOCOMMAND --setglobalstate on
      ;;
   *disabled*)       echo "Firewall Disabled. Not enabling."
      ;;
      *) echo "Unknown response for firewall state."
   esac
fi
