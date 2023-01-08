FROM gcr.io/kaggle-gpu-images/python:v122

WORKDIR /ml-docker/working
COPY ./artifact/jupyter_lab_config.py /ml-docker/.

RUN mkdir -p /ml-docker
COPY ./artifact/requirements.txt /ml-docker/.
RUN pip install -U pip && pip install -r /ml-docker/requirements.txt
RUN pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu116 
RUN pip freeze >| /ml-docker/requirements.lock
