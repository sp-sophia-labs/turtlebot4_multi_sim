# turtlebot_sim_test

Tentative to launch multiple turtlebot4 in simulation with correct namespacing. This code is tested for Ubuntu 20.04 and ROS2 Galactic.
This code includes forked submodules for rclcpp, gz_ros2_control, ros2_control and ros2_controllers 

## clone

Use the following to clone the entire repo with submodules:
`git clone --recursive https://github.com/sp-sophia-labs/turtlebot4_sim_test.git`

Alternatively you can clone normally and run `git submodule update -r --init` in the root directory of the project

## install

`make install`

## build

`make build`

If you are building on a weaker machine, it's recommended to build packages sequentially to avoid problems

`make safe_build`

### run

### Create3

`source install/setup.bash`

Launch the world and the first create3 instance:
`ros2 launch irobot_create_ignition_bringup create3_ignition.launch.py namespace:=robot_0 robot_name:=robot_zero`

Alternatively, launching the robot without namespaces is still available:
`ros2 launch irobot_create_ignition_bringup create3_ignition.launch.py`

(Optional) For weaker machines, you can spawn create3 in an empty world:
`ros2 launch irobot_create_ignition_bringup create3_ignition.launch.py world:=empty`

In a separate terminal, spawn another create3 instance with different name, namespace and pose:
`ros2 launch irobot_create_ignition_bringup create3_spawn.launch.py namespace:=robot_1 robot_name:=robot_one y:=1`
You can change the x, y, z param to spawn the robot where needed

Once the gazebo simulation has started, you can modify the Create3 HMI field to reflect on the new robot name. It defaults to "create3"
This will correctly map the Create3 simulated button to one of your robots 

### TurtleBot4

`source install/setup.bash`

Launch the world and the first create3 instance:
`ros2 launch turtlebot4_ignition_bringup ignition.launch.py namespace:=robot_0 robot_name:=robot_zero`

Alternatively, launching the robot without namespaces is still available:
`ros2 launch turtlebot4_ignition_bringup ignition.launch.py`

In a separate terminal, spawn another create3 instance with different name, namespace and pose:
`ros2 launch turtlebot4_ignition_bringup turtlebot4_spawn.launch.py namespace:=robot_1 robot_name:=robot_one y:=1`
You can change the x, y, z param to spawn the robot where needed

Once the gazebo simulation has started, you can modify the Turtlebot4 HMI field to reflect on the new robot name. It defaults to "turtlebot4"
This will correctly map the Turtlebot simulated button and interface to one of your robots. Leds should light up and the interface should display the usual options

## Known issues

- The create3 dock can appear deformed in Gazebo in certain cases (often seen in non-depot worlds). Running `export LC_ALL=C LANG=C` before the launch or prefixing the command with `LC_ALL=C LANG=C` should solve the issue

- [Err] [SceneManager.cc:179] Visual: [robot_zero_standard_dock] already exists. These errors will appear in your first terminal when spawning new robots, they can be ignored for now (but should be investigated nonetheless..)
full stack-trace: 
```
[ign gazebo-1] [Err] [SceneManager.cc:179] Visual: [ground_plane] already exists
[ign gazebo-1] [Err] [SceneManager.cc:179] Visual: [robot_zero] already exists
[ign gazebo-1] [Err] [SceneManager.cc:179] Visual: [robot_zero_standard_dock] already exists
[ign gazebo-1] [Err] [SceneManager.cc:179] Visual: [robot_one_standard_dock] already exists
[ign gazebo-1] [Err] [SceneManager.cc:179] Visual: [robot_one] already exists
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::base_link::cliff_front_left] for entity [12]. Parent not found with ID[9].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::base_link::cliff_front_right] for entity [13]. Parent not found with ID[9].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::base_link::cliff_side_left] for entity [14]. Parent not found with ID[9].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::base_link::cliff_side_right] for entity [15]. Parent not found with ID[9].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_front_center_left::ir_intensity_front_center_left] for entity [26]. Parent not found with ID[25].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_front_center_right::ir_intensity_front_center_right] for entity [28]. Parent not found with ID[27].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_front_left::ir_intensity_front_left] for entity [30]. Parent not found with ID[29].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_front_right::ir_intensity_front_right] for entity [32]. Parent not found with ID[31].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_left::ir_intensity_left] for entity [34]. Parent not found with ID[33].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_right::ir_intensity_right] for entity [36]. Parent not found with ID[35].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_zero::ir_intensity_side_left::ir_intensity_side_left] for entity [38]. Parent not found with ID[37].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::base_link::cliff_front_left] for entity [93]. Parent not found with ID[90].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::base_link::cliff_front_right] for entity [94]. Parent not found with ID[90].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::base_link::cliff_side_left] for entity [95]. Parent not found with ID[90].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::base_link::cliff_side_right] for entity [96]. Parent not found with ID[90].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_front_center_left::ir_intensity_front_center_left] for entity [107]. Parent not found with ID[106].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_front_center_right::ir_intensity_front_center_right] for entity [109]. Parent not found with ID[108].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_front_left::ir_intensity_front_left] for entity [111]. Parent not found with ID[110].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_front_right::ir_intensity_front_right] for entity [113]. Parent not found with ID[112].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_left::ir_intensity_left] for entity [115]. Parent not found with ID[114].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_right::ir_intensity_right] for entity [117]. Parent not found with ID[116].
[ign gazebo-1] [Err] [RenderUtil.cc:842] Failed to create sensor with name[robot_one::ir_intensity_side_left::ir_intensity_side_left] for entity [119]. Parent not found with ID[118].
```

- Turtlebot4 navigation system does not start correctly when namespaced. Map is published to the correct topic but does not show up in RVIZ (maybe a reference frame_id issue) and the namespace/map frame is not created.