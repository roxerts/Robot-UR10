# UR10 Robotic Manipulation Project/Temporal Team

## Overview

This project implements a robotic manipulation system using MATLAB and the Robotics System Toolbox. The goal is to simulate a UR10 industrial robot capable of picking up and reorienting an aluminum cube placed in an arbitrary pose within the workspace.

The simulation includes:

* Kinematic modeling of the UR10 robot
* Inverse kinematics to reach a desired pose
* Trajectory planning using Cartesian interpolation
* Animation of the robot and object interaction
* Basic grasp simulation (cube attached to end-effector)

---

## Objective

To move a cube from an initial arbitrary position to a desired final configuration where:

* The cube is repositioned in space
* The robot follows a smooth trajectory
* The motion avoids unrealistic behavior (e.g., going through the floor)

---

## Requirements

To run this project, you need:

* MATLAB (R2021a or newer recommended)
* Robotics System Toolbox

---

## Project Structure

```
main_simulation.m      % Main script (runs everything)
robot_model.m         % Loads UR10 robot model
inverse_kinematics.m  % Solves target pose
trajectory.m          % Generates trajectory with waypoints
animation.m           % Visualizes robot + cube motion
```

---

## How to Run the Simulation

1. Open MATLAB

2. Navigate to the project folder:

   ```matlab
   cd('path_to_project_folder')
   ```

3. Run the main script:

   ```matlab
   main_simulation
   ```

---

## What You Should See

After running the simulation:

* A 3D visualization window will open
* The UR10 robot will appear with full geometry
* A cube (cyan) will be visible in the workspace
* The robot will:

  1. Lift upward to avoid collision
  2. Move horizontally toward the target
  3. Move downward to the final position
* The cube will move along with the robot, simulating a grasp

---

## Notes on the Simulation

* The model is **kinematic**, meaning:

  * No collision detection is implemented
  * No physics engine is used
* To improve realism, a **waypoint-based trajectory** is used to keep the robot above the workspace before descending

---

## Known Limitations

* No real gripper model (grasp is simulated)
* No collision avoidance algorithm
* Cube is rigidly attached to the end-effector during motion
* Orientation of the triangle is not explicitly modeled

---

## Possible Improvements

* Add collision detection
* Implement a realistic gripper model
* Include vision-based pose detection
* Improve object orientation control
* Export simulation as video

---

## Author

Project developed for robotic manipulation coursework using MATLAB.

---
