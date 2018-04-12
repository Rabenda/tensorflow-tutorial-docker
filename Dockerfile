FROM tensorflow/tensorflow:1.4.0
ENV LANG C.UTF-8
RUN apt update \
    && apt upgrade -y \
    && apt install -y git nano bc sed \
    && pip install -U scikit-learn \
    && pip install caicloud.tensorflow \
    && mkdir /git \
    && cd /git \
    && git clone --depth=1 https://github.com/caicloud/tensorflow-tutorial.git

RUN rm -rf /notebooks/*

RUN cp -r /git/tensorflow-tutorial/caicloud.tensorflow /caicloud.tensorflow
RUN cp -r /git/tensorflow-tutorial/Deep_Learning_with_TensorFlow/ /notebooks/Deep_Learning_with_TensorFlow/
RUN cp /git/tensorflow-tutorial/run_tf.sh /run_tf.sh
RUN sed -i "s/notebook/notebook --allow-root/g" /run_jupyter.sh
ENV PASSWORD notebook
CMD ["/run_tf.sh"]