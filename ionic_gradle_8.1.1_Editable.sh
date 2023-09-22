#!/bin/bash

# Variables
# Cambia estas variables según sea necesario
ANDROID_HOME_DEFAULT="%USERPROFILE%/AppData/Local/Android/Sdk"
GRADLE_VERSION="8.1.1"

# Ruta al directorio raíz del proyecto
projectDir=$(pwd)

# Verificar si la variable de entorno ANDROID_HOME está configurada
if [ -z "$ANDROID_HOME" ]; then
  # Usar la ubicación por defecto del SDK de Android
  export ANDROID_HOME="$ANDROID_HOME_DEFAULT"
  echo "La variable de entorno ANDROID_HOME se configuró automáticamente a: $ANDROID_HOME"
fi

# Modificar la versión de Gradle en build.gradle
gradleVersion="$GRADLE_VERSION"

# Modificar build.gradle en la carpeta android
find "$projectDir/android" -type f -name "build.gradle" | while read -r gradleFile
do
  sed -i "s/classpath 'com.android.tools.build:gradle:[0-9.]*'/classpath 'com.android.tools.build:gradle:$gradleVersion'/" "$gradleFile"
done

echo "La versión de Gradle se ha actualizado a $gradleVersion"

# Modificar gradle-wrapper.properties
gradleWrapperFile="$projectDir/android/gradle/wrapper/gradle-wrapper.properties"
sed -i "s/distributionUrl=.*$/distributionUrl=https\:\/\/services.gradle.org\/distributions\/gradle-$gradleVersion-bin.zip/" "$gradleWrapperFile"

echo "La versión de Gradle en gradle-wrapper.properties se ha actualizado a $gradleVersion"
