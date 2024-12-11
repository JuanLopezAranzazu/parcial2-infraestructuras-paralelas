# Usar una imagen base de OpenJDK
FROM openjdk:17-jdk-slim

# Instalar Maven
RUN apt-get update && apt-get install -y maven sqlite3 libsqlite3-dev

# Crear un directorio de trabajo
WORKDIR /app

# Copiar el archivo pom.xml y el código fuente
COPY . .

# Construir la aplicación con Maven
RUN mvn clean install

# Exponer el puerto que usará la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "target/sqlitedb-1.0-SNAPSHOT.jar"]