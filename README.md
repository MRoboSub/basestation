# basestation

This runs ros2 on the base station within a docker container.

To build docker image and start container, run
`$ docker container prune && docker compose up --build`

To open up interactive bash terminals within this container, run
`$ docker exec -it basestation_container bash`

To kill an interactive bash session, run `$ exit` from within it

To kill the docker container itself, Ctrl+C in the terminal where you ran `$ docker compose ...`


### teleop
Once you plug in the teleop controller to the base station via USB, you should see a device at /dev/input/js0 (both on the base station and within the container).

Within the container, to run the teleop node,
`$ ros2 run joy joy_node`

Now you can see the raw info published by teleop by running `$ ros2 topic echo /joy`


### visualizing camera feeds
To visualize anything, first run the following on the base station:
`$ xhost +local:docker`

Run camera node(s) on jetson
`$ ros2 launch mrobosub_hal botcam_launch.xml` and similarly for ZED node (and make sure to run bot_cam or zed to actually get the nodes to publish the camera feeds)

Now, both on the jetson and within the docker container, you should be able to run `$ ros2 node list` and see `botcam` or `zed` accordingly.

Now, within docker container, run `$ rviz2` and add whatever topics you want to visualize within rviz2 and you should be able to see the botcam/ZED camera feed !


