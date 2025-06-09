from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='robot_publisher',
            executable='csv_pointcloud_publisher',
            name='csv_pointcloud_publisher',
            output='screen'
        )
    ])