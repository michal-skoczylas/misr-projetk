from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='robot_publisher',
            executable='workspace_publisher',
            name='workspace_node',
            output='screen'
        )
    ])
