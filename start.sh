#!/bin/bash
# Setup the ensvironment variables
JAVA=/var/games/minecraft/java/jdk-24.0.2/bin/java
IP=192.168.40.125
PORT=25565
RAM=6G
DESCRIPTION="SMP Minecraft Server"
JAR=./fabric-server-1.21.8.jar
ARGS=nogui

echo "Starting Minecraft Server"
echo "Server Name: SMP Minecraft Server"

# Forward the port
echo "Port Forwarded $PORT"
upnpc -e "$DESCRIPTION" -a "$IP" "$PORT" "$PORT" TCP > /dev/null
upnpc -e "$DESCRIPTION" -a "$IP" "$PORT" "$PORT" UDP > /dev/null

# Start the server
$JAVA -Xmx$RAM -Xms$RAM  -jar "$JAR" $ARGS 


# Handle the server stop event
upnpc -d "$PORT" TCP > /dev/null
upnpc -d "$PORT" UDP > /dev/null
echo "Server Stopped"
exit 0
