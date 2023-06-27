user_id=$(id -u)
image_name=nvgl_ros_dev
image_with_tag=$image_name:dev

echo "Building $image_with_tag"
docker build --rm -t $image_with_tag -f ./$image_name/Dockerfile .
echo "Built $image_name"