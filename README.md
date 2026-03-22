# basestation

This runs ros2 on the base station within a docker container.

Run `$ docker compose up`
to build the image and start the docker container


## TELEOP
Once you plug in the teleop controller to the base station via USB, you should see a device at /dev/input/js0 (both on the base station and within the container).

Within the container, to run the teleop node,
`$ ros2 run joy joy_node`



## VISUALIZING CAMERA FEEDS
To visualize anything, first run the following on the base station:
`$ xhost +local:docker`

Then re-start the container (kill it and re-run `$docker compose up`)
Then run rviz2

## RUNNING CAM NODES
On the jetson, as usual, run
`$ ros2 launch mrobosub_hal botcam_launch.xml` and similarly for ZED (make sure to run bot_cam or zed to actually get the nodes to publish the camera feeds!)
Now, within the docker container, run `$ ros2 node list` and you should be able to see `botcam` or `zed` accordingly

And you should be able to select the topics they publish images to to see the camera feeds in rviz2.

