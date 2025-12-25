# Unitree Go1 Sensor Fusion & 2D Mapping

This repository contains the ROS implementation of an Extended Kalman Filter (EKF) and SLAM for the Unitree Go1 quadruped robot, based on the [LegKilo Dataset](https://github.com/ouguangjun/legkilo-dataset).

## Overview
The project focuses on fusing high-frequency IMU data with leg odometry to provide a stable pose estimation, which is then used to build an occupancy grid map via Gmapping using fata fro LIDaR.

### Key Features:
* **Sensor Fusion:** Configured `robot_localization` (EKF) to merge IMU and Leg odometry.
* **TF Tree Management:** Established a consistent transform tree (`map` -> `odom_combined` -> `sdk_base_link_3d` -> `velodyne`-> `imu_link`).
* **SLAM:** Optimized Gmapping parameters for the Unitree Go1 sensor suite and custom frame names.

## Project Structure
* `config/` - EKF parameters and covariance matrices.
* `launch/` - Launch files for the full navigation stack and data processing.
* `maps/` - Generated 2D occupancy grid maps.
* `rviz/` - RViz configuration for visualization.
* `results/` - TF tree diagrams and performance analysis (frames.pdf).

## Installation

1. **Clone the repository into your catkin workspace:**
   ```bash
   cd ~/catkin_ws/src
   git clone [https://github.com/YOUR_USERNAME/leg_kilo.git](https://github.com/YOUR_USERNAME/leg_kilo.git)
   catkin_make
source devel/setup.bash

## Usage

### 1. Start the Sensor Fusion and Gmapping
roslaunch leg_kilo leg_kilo_play_data.launch

### 2. Play the Dataset
rosbag play --clock --pause /path/to/your/running.bag

## Results
### TF Tree
The system maintains a valid transformation chain. Results can be found in results/frames.pdf.

### Mapping
By fusing IMU and leg odometry, the position drift was significantly reduced, allowing for a consistent 2D occupancy grid map.

![Map Result](maps/my_map.pgm)

