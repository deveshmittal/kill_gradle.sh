#!/bin/bash

# Script to kill Gradle daemon processes on Mac

echo "Searching for Gradle processes..."

# Find all Gradle daemon processes
PIDS=$(jps -l | grep 'org.gradle.launcher.daemon.bootstrap.GradleDaemon' | awk '{print $1}')

if [ -z "$PIDS" ]; then
  echo "No Gradle processes found."
else
  # Kill each Gradle process
  for PID in $PIDS
  do
    echo "Killing Gradle process with PID: $PID"
    kill $PID
    # Uncomment the next line to force kill if needed
    # kill -9 $PID
  done
  echo "Gradle processes terminated."
fi

