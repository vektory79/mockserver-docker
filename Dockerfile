FROM bellsoft/liberica-openjdk-alpine:11

RUN mkdir -p /app/config /app/libs
COPY --from=mockserver/mockserver:mockserver-5.11.2 mockserver-netty-jar-with-dependencies.jar /app/mockserver-netty-jar-with-dependencies.jar

ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-cp", "/app/mockserver-netty-jar-with-dependencies.jar:/app/libs/*", "-Dmockserver.propertyFile=/app/config/mockserver.properties", "org.mockserver.cli.Main"]
CMD ["-serverPort", "1080"]
EXPOSE 1080
