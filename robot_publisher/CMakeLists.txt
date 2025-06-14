cmake_minimum_required(VERSION 3.8)
project(robot_publisher)

# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # The following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # The following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

# Install resources
install(
  DIRECTORY urdf launch rviz data
  DESTINATION share/${PROJECT_NAME}
)

# Install Python node
install(PROGRAMS
  src/workspace_publisher.py
  DESTINATION lib/${PROJECT_NAME}
  RENAME workspace_publisher
)
install(PROGRAMS
  src/csv_pointcloud_publisher.py
  DESTINATION lib/${PROJECT_NAME}
  RENAME csv_pointcloud_publisher
)
ament_package()