#!/bin/bash

# allows GUI
echo "Allowing X11 connection..."
xhost +local:root

echo "Starting Robot..."
docker-compose up -d

echo "Entering container..."
docker exec -it unitree_robot_fusion bash
