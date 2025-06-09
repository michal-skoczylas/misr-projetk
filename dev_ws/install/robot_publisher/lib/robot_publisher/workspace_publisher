#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs_py.point_cloud2 as pc2
import numpy as np
from std_msgs.msg import Header

class WorkspacePublisher(Node):
    def __init__(self):
        super().__init__('workspace_publisher')
        self.publisher_ = self.create_publisher(PointCloud2, 'workspace', 10)
        timer_period = 1.0  # sekundy
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.get_logger().info('WorkspacePublisher node started!')

    def timer_callback(self):
        # Przykład: sześcian o wymiarach 1x1x0.5m, 20x20x10 punktów
        points = []
        for x in np.linspace(-0.5, 0.5, 20):
            for y in np.linspace(-0.5, 0.5, 20):
                for z in np.linspace(0.0, 0.5, 10):
                    if self.is_reachable(x, y, z):
                        points.append([x, y, z])

        header = Header()
        header.stamp = self.get_clock().now().to_msg()
        header.frame_id = 'base_link'  # dopasuj do robota

        cloud_msg = pc2.create_cloud_xyz32(header, points)
        self.publisher_.publish(cloud_msg)
        self.get_logger().info(f'Published workspace cloud with {len(points)} points.')

    def is_reachable(self, x, y, z):
        # Tu możesz dodać własną logikę workspace (np. ograniczenia robota)
        return True  # dla uproszczenia: wszystko osiągalne

def main(args=None):
    rclpy.init(args=args)
    node = WorkspacePublisher()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__'ros2 launch my_robot_moveit_config demo.launch.py:
    main()