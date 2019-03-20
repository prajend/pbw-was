# Generated by IBM TransformationAdvisor
# Tue Mar 19 12:23:47 UTC 2019


#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7

USER root
#BINARIES: Add in all necessary application binaries
COPY ./server.xml /config
COPY Dockerfile ./binary/application/* /config/apps/
RUN mkdir /config/lib
COPY Dockerfile ./binary/lib/* /config/lib/
COPY PLANTSDB /config/lib/PLANTSDB

#FEATURES: Install any features that are required
RUN apt-get update && apt-get dist-upgrade -y \
&& rm -rf /var/lib/apt/lists/* 
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense \
	jsp-2.3 \
	ejbLite-3.2 \
	servlet-3.1 \
	jsf-2.2 \
	beanValidation-1.1 \
	jndi-1.0 \
	cdi-1.2 \
	jdbc-4.1 \
	jpa-2.0 \
	javaMail-1.5 \
    el-3.0

