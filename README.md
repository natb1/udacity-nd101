```
docker build -t nd .
```
```
docker run --rm -v $PWD:/usr/src -v $HOME/.floydconfig:/root/.floydconfig \
    --name udnd101 \
    -p 8888:8888 -p 8889:8889 \
    -it nd
```
```
docker exec -it nd tensorboard --port 8889 --logdir logs
```
