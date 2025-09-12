FROM python:3.13-trixie

ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:21-jre-noble $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY --from=ghcr.io/astral-sh/uv:0.8.17 /uv /uvx /bin/

RUN mkdir -p /opt/program
WORKDIR /opt/program

COPY ./requirements.txt /opt/program/
RUN uv pip --no-cache install -r /opt/program/requirements.txt  --system

RUN mkdir -p /usr/local/lib/python3.13/site-packages/pyspark/jars