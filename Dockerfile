FROM debian

RUN apt-get update -q &&\
    apt-get install -yq libffi-dev bzip2 build-essential \
    curl libssl-dev ca-certificates apt-transport-https

# conda
RUN curl -sLO \
    http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh &&\
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda &&\
    rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/opt/miniconda/bin:$PATH

RUN conda install numpy matplotlib pandas jupyter notebook bokeh scipy h5py \
    scikit-learn tqdm scikit-image
RUN pip install tensorflow TFLearn floyd-cli
COPY reinforcement/gym reinforcement/gym
RUN pip install -e reinforcement/gym
RUN apt-get install -y python-opengl xvfb mesa-utils libgl1-mesa-glx

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR /usr/src
ADD . /usr/src

CMD  xvfb-run -s "-screen 0 1400x900x24" jupyter notebook --allow-root --ip=0.0.0.0
