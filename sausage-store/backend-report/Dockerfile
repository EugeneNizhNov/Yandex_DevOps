FROM maven:3.8-openjdk-16 as builder
#Create build directory
ARG VERSION
WORKDIR /usr/src/app
COPY . .
RUN mvn package

FROM openjdk:16

#Create app directory
WORKDIR /usr/src/app

RUN curl https://storage.yandexcloud.net/cloud-certs/CA.pem -o YandexInternalRootCA.crt && \
    keytool -importcert -file YandexInternalRootCA.crt -alias yandex -cacerts -storepass changeit -noprompt && \
    rm -f YandexInternalRootCA.crt

COPY --from=builder /usr/src/app/target/sausage-store-report-1.0.0.jar sausage-store-report.jar

ENTRYPOINT ["java", "-jar", "./sausage-store-report.jar"]
EXPOSE 8080