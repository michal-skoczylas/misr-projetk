from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
from launch.substitutions import Command
import os

def generate_launch_description():
    pkg_share = get_package_share_directory('robot_publisher')
    urdf_file = os.path.join(pkg_share,'urdf','my_robot.urdf.xacro')

    return LaunchDescription([
        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            parameters=[{
    'robot_description': Command([
        '/opt/ros/jazzy/lib/xacro/xacro ',
        os.path.join(pkg_share, 'urdf', 'my_robot.urdf.xacro')
    ])
}]
        ),
        Node(
            package='joint_state_publisher_gui',
            executable='joint_state_publisher_gui'
        ),
        Node(
            package='rviz2',
            executable='rviz2'
            # arguments=['-d',os.path.join(pkg_share,'rviz','config.rviz2')]
        ),
        Node(
            package='robot_publisher',
            executable='csv_pointcloud_publisher',
            name='csv_pointcloud_publisher',
            output='screen'
        )
#         Node(
#     package='robot_publisher',
#     executable='workspace_visualizer.py',
#     name='workspace_visualizer',
#     output='screen'
# )
    ])