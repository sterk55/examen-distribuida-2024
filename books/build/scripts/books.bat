@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  books startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and BOOKS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\books-1.0-SNAPSHOT.jar;%APP_HOME%\lib\helidon-microprofile-openapi-3.2.6.jar;%APP_HOME%\lib\helidon-microprofile-health-3.2.6.jar;%APP_HOME%\lib\helidon-service-common-rest-cdi-3.2.6.jar;%APP_HOME%\lib\helidon-microprofile-server-3.2.6.jar;%APP_HOME%\lib\helidon-openapi-3.2.6.jar;%APP_HOME%\lib\helidon-health-3.2.6.jar;%APP_HOME%\lib\helidon-webserver-static-content-3.2.6.jar;%APP_HOME%\lib\helidon-webserver-jersey-3.2.6.jar;%APP_HOME%\lib\helidon-service-common-rest-3.2.6.jar;%APP_HOME%\lib\helidon-webserver-cors-3.2.6.jar;%APP_HOME%\lib\helidon-webserver-3.2.6.jar;%APP_HOME%\lib\jersey-weld2-se-3.0.12.jar;%APP_HOME%\lib\jersey-cdi1x-3.0.12.jar;%APP_HOME%\lib\helidon-jersey-server-3.2.6.jar;%APP_HOME%\lib\jersey-server-3.0.12.jar;%APP_HOME%\lib\helidon-jersey-client-3.2.6.jar;%APP_HOME%\lib\jersey-client-3.0.12.jar;%APP_HOME%\lib\jersey-hk2-3.0.12.jar;%APP_HOME%\lib\helidon-jersey-media-jsonp-3.2.6.jar;%APP_HOME%\lib\jersey-media-json-processing-3.0.12.jar;%APP_HOME%\lib\jersey-common-3.0.12.jar;%APP_HOME%\lib\jakarta.ws.rs-api-3.0.0.jar;%APP_HOME%\lib\helidon-microprofile-config-3.2.6.jar;%APP_HOME%\lib\jakarta.transaction-api-2.0.0.jar;%APP_HOME%\lib\postgresql-42.4.3.jar;%APP_HOME%\lib\jakarta.persistence-api-3.0.0.jar;%APP_HOME%\lib\helidon-fault-tolerance-3.2.6.jar;%APP_HOME%\lib\helidon-media-jsonp-3.2.6.jar;%APP_HOME%\lib\helidon-media-common-3.2.6.jar;%APP_HOME%\lib\helidon-config-encryption-3.2.6.jar;%APP_HOME%\lib\helidon-common-key-util-3.2.6.jar;%APP_HOME%\lib\helidon-common-configurable-3.2.6.jar;%APP_HOME%\lib\helidon-tracing-3.2.6.jar;%APP_HOME%\lib\helidon-tracing-config-3.2.6.jar;%APP_HOME%\lib\helidon-microprofile-cdi-3.2.6.jar;%APP_HOME%\lib\helidon-config-yaml-mp-3.2.6.jar;%APP_HOME%\lib\helidon-config-mp-3.2.6.jar;%APP_HOME%\lib\helidon-config-yaml-3.2.6.jar;%APP_HOME%\lib\helidon-config-object-mapping-3.2.6.jar;%APP_HOME%\lib\helidon-config-3.2.6.jar;%APP_HOME%\lib\weld-se-core-3.2.6.jar;%APP_HOME%\lib\helidon-health-common-3.2.6.jar;%APP_HOME%\lib\helidon-common-http-3.2.6.jar;%APP_HOME%\lib\helidon-common-reactive-3.2.6.jar;%APP_HOME%\lib\helidon-common-mapper-3.2.6.jar;%APP_HOME%\lib\helidon-common-context-3.2.6.jar;%APP_HOME%\lib\helidon-logging-common-3.2.6.jar;%APP_HOME%\lib\helidon-common-media-type-3.2.6.jar;%APP_HOME%\lib\helidon-common-service-loader-3.2.6.jar;%APP_HOME%\lib\helidon-common-crypto-3.2.6.jar;%APP_HOME%\lib\helidon-common-3.2.6.jar;%APP_HOME%\lib\netty-codec-http-4.1.100.Final.jar;%APP_HOME%\lib\netty-handler-4.1.100.Final.jar;%APP_HOME%\lib\netty-codec-4.1.100.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.100.Final.jar;%APP_HOME%\lib\netty-transport-4.1.100.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.100.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.100.Final.jar;%APP_HOME%\lib\netty-common-4.1.100.Final.jar;%APP_HOME%\lib\smallrye-open-api-jaxrs-2.1.16.jar;%APP_HOME%\lib\smallrye-open-api-core-2.1.16.jar;%APP_HOME%\lib\jackson-core-2.15.2.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.15.2.jar;%APP_HOME%\lib\jackson-databind-2.15.2.jar;%APP_HOME%\lib\jackson-annotations-2.15.2.jar;%APP_HOME%\lib\jakarta.xml.bind-api-3.0.1.jar;%APP_HOME%\lib\weld-spi-4.0.SP1.jar;%APP_HOME%\lib\weld-api-4.0.SP1.jar;%APP_HOME%\lib\jakarta.enterprise.cdi-api-3.0.0.jar;%APP_HOME%\lib\jakarta.el-api-4.0.0.jar;%APP_HOME%\lib\jakarta.interceptor-api-2.0.0.jar;%APP_HOME%\lib\jakarta.annotation-api-2.0.0.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.0.jar;%APP_HOME%\lib\parsson-1.0.5.jar;%APP_HOME%\lib\yasson-2.0.4.jar;%APP_HOME%\lib\jakarta.json-api-2.0.2.jar;%APP_HOME%\lib\jakarta.json.bind-api-2.0.0.jar;%APP_HOME%\lib\parsson-media-1.0.5.jar;%APP_HOME%\lib\snakeyaml-2.0.jar;%APP_HOME%\lib\microprofile-config-api-3.0.1.jar;%APP_HOME%\lib\microprofile-health-api-4.0.jar;%APP_HOME%\lib\microprofile-openapi-api-3.0.jar;%APP_HOME%\lib\jandex-2.4.3.Final.jar;%APP_HOME%\lib\jakarta.validation-api-3.0.0.jar;%APP_HOME%\lib\weld-environment-common-4.0.3.Final.jar;%APP_HOME%\lib\jboss-classfilewriter-1.2.5.Final.jar;%APP_HOME%\lib\jboss-logging-3.5.3.Final.jar;%APP_HOME%\lib\checker-qual-3.5.0.jar;%APP_HOME%\lib\jakarta.json-2.0.0-module.jar;%APP_HOME%\lib\weld-core-impl-3.2.6.jar;%APP_HOME%\lib\hk2-locator-3.0.3.jar;%APP_HOME%\lib\javassist-3.29.2-GA.jar;%APP_HOME%\lib\jakarta.activation-2.0.1.jar;%APP_HOME%\lib\hk2-api-3.0.3.jar;%APP_HOME%\lib\aopalliance-repackaged-3.0.3.jar;%APP_HOME%\lib\hk2-utils-3.0.3.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar


@rem Execute books
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %BOOKS_OPTS%  -classpath "%CLASSPATH%" io.helidon.microprofile.cdi.Main %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable BOOKS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%BOOKS_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
