# Use JDK 17 (ajusta esto según tu compatibilidad)
FROM openjdk:17 as build

# Copia los archivos de Gradle y el código fuente
COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts .
COPY settings.gradle.kts .
COPY src src

# Construye la aplicación usando Gradle
RUN ./gradlew build -x test

# Empaqueta la aplicación en una imagen Docker limpia
FROM openjdk:17-jdk-slim
COPY --from=build /app/build/libs/app.jar /app/app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
