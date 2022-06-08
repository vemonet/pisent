#!/bin/bash

# Wait for the network to connect
sleep 30

# Show a URL in full screen
PRESENTATION_URL="https://docs.google.com/presentation/d/e/2PACX-1vSVjc9FgDZrsYYsXjPU9R02D4kSC-MEXU7ZYYucvw8EdIStr3xgaqtDqHmBq7UzzPnZnB4nPzVV3ONj/pub?start=true&loop=true&delayms=60000"
chromium-browser --enable-extensions --kiosk $PRESENTATION_URL