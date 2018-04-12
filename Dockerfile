FROM tensorflow/tensorflow:1.7.0
ENV LANG C.UTF-8
RUN apt update \
    && apt upgrade -y \
    && apt install -y git nano bc \
    && pip install -U scikit-learn \
    && pip install caicloud.tensorflow \
    && mkdir /git \
    && cd /git \
    && git clone --depth=1 https://github.com/caicloud/tensorflow-tutorial.git

RUN rm -rf /notebooks/*

RUN cp -r /git/tensorflow-tutorial/caicloud.tensorflow /caicloud.tensorflow
RUN cp -r /git/tensorflow-tutorial/Deep_Learning_with_TensorFlow/ /notebooks/Deep_Learning_with_TensorFlow/
RUN cp /git/tensorflow-tutorial/run_tf.sh /run_tf.sh

RUN echo "c.NotebookApp.password = u'sha1:b3f8790d4455:a20adad91a461b3bd3855412ee589fb33db21af1'" >> /root/.jupyter/jupyter_notebook_config.py

CMD ["/run_tf.sh"]