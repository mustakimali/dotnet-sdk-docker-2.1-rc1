FROM debian:9 AS build

RUN  apt-get update \
  && apt-get install -y wget gnupg apt-transport-https curl \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://yum.dockerproject.org/gpg \
  && apt-key add gpg

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
	&& mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
	&& wget -q https://packages.microsoft.com/config/debian/9/prod.list \
	&& mv prod.list /etc/apt/sources.list.d/microsoft-prod.list

RUN apt-get update \
	&& apt-get install -y dotnet-sdk-2.1.300-rc1-008673