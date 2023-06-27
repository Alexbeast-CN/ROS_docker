# A example of ROS dockerfile

## Usage

Build a basic ros docker image based on nvidia/opengl docker image.

```
bash build_bash.bash
```

Build a dev docker image based on the basic docker image.

```
bash build_dev.bash
```

Run the dev docker image.

```
bash run_dev.bash image_name
```

Open another terminal and connect to the running docker image.

```
bash join.bash image_name
```