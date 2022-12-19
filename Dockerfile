FROM cccs/assemblyline-v4-service-base:stable

ENV SERVICE_PATH autoitripper.AutoItRipper

USER root

RUN pip3 install autoit-ripper

USER assemblyline

WORKDIR /opt/al_service
COPY . .

ARG version=4.3.0.dev1
USER root
RUN sed -i -e "s/\$SERVICE_TAG/$version/g" service_manifest.yml

USER assemblyline
