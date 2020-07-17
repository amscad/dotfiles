#!/bin/bash
fw='/usr/libexec/ApplicationFirewall/socketfilterfw'
mosh_sym="$(which mosh-server)"
mosh_abs="/usr/local/Cellar/mosh/1.3.2_4/bin/mosh-server"
"$fw" --setglobalstate off
"$fw" --add "$mosh_sym"
"$fw" --unblockapp "$mosh_sym"
"$fw" --add "$mosh_abs"
"$fw" --unblockapp "$mosh_abs"
"$fw" --setglobalstate on
