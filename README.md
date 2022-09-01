# turtlebot_sim_test

Tentative to launch multiple turtlebot4 in simulation. For now working only with the create3 mobile base. This code is tested for Ubuntu 20.04 and ROS2 Galactic

# Create3

### install

`make install`

### build

`make build`

If you are building on a weaker machine, it's recommended to build packages sequentially to avoid problems

`make safe_build`

### run

`source install/setup.bash`

Launch the world and the first create3 instance:
`ros2 launch irobot_create_ignition_bringup create3_ignition.launch.py namespace:=robot_0 robot_name:=robot_zero`

The namespace needs to follow the `robot_X` nomenclature or be left empty
The robot_name can be changed and defaults to "create3"

For weaker machines, you can spawn create3 in an empty world:
`ros2 launch irobot_create_ignition_bringup create3_ignition.launch.py namespace:=robot_0 robot_name:=robot_zero world:=empty`

Alternatively, launching the robot without namespaces is still available:
`ros2 launch irobot_create_ignition_bringup create3_ignition.launch.py`


# Known issues

- The create3 dock can appear deformed in Gazebo in certain cases (often seen in non-depot worlds). Running `export LC_ALL=C LANG=C` before the launch or prefixing the command with `LC_ALL=C LANG=C` should solve the issue

- docking/undocking behavior is not completely stable as namespaces are not completely propagated to /_internal topics. ir related topics don't seem to work as intended for now. We are investigating the issue..

- Create3 button GUI in Gazebo does not work yet with namespacing.We are investigating the issue..

- Spawning a 3rd create3 in the scene causes Gazebo to crash unexpectandly. We are still investigating this issue, it does not appear to be a performance issue and the limit of 2 create3 in the same scene has been noticed in multiple machines with different specs 

- Namespaces need to be registered in `` before being used, limiting scalability and naming flexibility
