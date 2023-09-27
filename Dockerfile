FROM python:3.11-slim

ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:20-jre-jammy $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PIP_NO_CACHE_DIR=TRUE
ENV PIP_DISABLE_PIP_VERSION_CHECK=TRUE

RUN mkdir -p /opt/program
WORKDIR /opt/program

RUN pip install --upgrade pip

COPY ./requirements.txt /opt/program/
RUN pip install -r /opt/program/requirements.txt

RUN mkdir -p /usr/local/lib/python3.11/site-packages/pyspark/jars
