#!/usr/bin/env fish

# This script clears the "primary selection" (regular pastes are unchanged) every 0.2 seconds, which effectively stops middle-click from pasting.
while true
    wl-copy -p -n < /dev/null
    sleep 0.2
end