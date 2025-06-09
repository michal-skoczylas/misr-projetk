#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from std_msgs.msg import Header
import sensor_msgs_py.point_cloud2 as pc2
import pandas as pd
import os
import math
from ament_index_python.packages import get_package_share_directory

class CSVPointCloudPublisher(Node):
    def __init__(self):
        super().__init__('csv_pointcloud_publisher')
        pkg_share = get_package_share_directory('robot_publisher')
        csv_path = os.path.join(pkg_share, 'data', 'datapoints.csv')
        self.publisher_ = self.create_publisher(PointCloud2, 'csv_pointcloud', 10)
        self.points = self.read_csv(csv_path)
        self.timer = self.create_timer(1.0, self.publish_pointcloud)

    def read_csv(self, filename):
        df = pd.read_csv(filename, comment='#')
        if set(['x', 'y', 'z']).issubset(df.columns):
            points = df[['x', 'y', 'z']].values.tolist()
        else:
            points = df.values.tolist()
        # Offset Z
        return [[x, y, z+0.7 ] for x, y, z in points]
    def publish_pointcloud(self):
        header = Header()
        header.stamp = self.get_clock().now().to_msg()
        header.frame_id = 'world'
        msg = pc2.create_cloud_xyz32(header, self.points)
        self.publisher_.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node = CSVPointCloudPublisher()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()