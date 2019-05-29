FROM docker:18.06.3-ce-dind

ARG PIPENV_VERSION="v2018.11.26"
ARG PIP_VERSION="19.1.1"
ENV PYTHON_PIP_VERSION ${PIP_VERSION}

RUN echo "Install AWS CLI" && \
    apk add -q --no-cache ca-certificates curl python3 py-pip && \
    pip3 install pip==${PYTHON_PIP_VERSION} && \
    pip3 -q install pipenv==${PIPENV_VERSION} awscli && \
    echo "Done install AWS" && \
    echo "Cleaning up" && \
    rm -rf /tmp/* /var/cache/apk/* && \
    docker --version && \
    aws --version && \
    echo "Done!"

ADD tag-image.sh /tmp
RUN mv /tmp/tag-image.sh /usr/local/bin/tag-image

