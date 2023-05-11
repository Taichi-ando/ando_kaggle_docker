FROM gcr.io/kaggle-gpu-images/python:v132

WORKDIR /ml-docker/working
COPY ./artifact/jupyter_lab_config.py /ml-docker/.

RUN mkdir -p /ml-docker
COPY ./artifact/requirements.txt /ml-docker/.
RUN pip install -U pip && pip install -r /ml-docker/requirements.txt
RUN pip install --force-reinstall --no-deps jupyter_server>=2.*
RUN pip install torch==2.0.0+cu118 torchvision==0.15.1+cu118 torchaudio==2.0.1 --extra-index-url https://download.pytorch.org/whl/cu118 
RUN pip freeze >| /ml-docker/requirements.lock
