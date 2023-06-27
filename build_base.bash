user_id=$(id -u)
image_name=nvgl_ros_base
image_plus_tag=$image_name:foxy

echo "Building nvgl_ros_base:foxy"
docker build --rm -t $image_plus_tag --build-arg user_id=$user_id -f ./$image_name/Dockerfile .
echo "Built $image_plus_tag"