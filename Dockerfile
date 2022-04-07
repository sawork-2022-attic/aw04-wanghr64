FROM maven:3.8.4-eclipse-temurin-11

COPY maven_settings.xml /usr/share/maven/conf/settings.xml

COPY webpos.tar.gz /

RUN mkdir /webpos

WORKDIR /webpos

RUN tar -xzvf ../webpos.tar.gz

RUN rm /webpos.tar.gz

RUN mvn install

CMD mvn clean spring-boot:run