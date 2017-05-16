```
docker build -t nd .
```
```
docker run --rm -v $PWD:/usr/src -v $HOME/.floydconfig:/root/.floydconfig \
    -p 8888:8888 -it nd
```
