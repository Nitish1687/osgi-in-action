@ECHO OFF

SET _EXAMPLE_DIR_=%~dp0

pushd %_EXAMPLE_DIR_%

SET _BUNDLES_=%1,%2,%3,%4,%5,%6,%7,%8

IF NOT "%_BUNDLES_%"==",,,,,,," GOTO CHOSEN

  ECHO.
  ECHO.Dynamic service examples"
  ECHO.------------------------"
  ECHO.
  ECHO.1) Broken lookup (dangling field)
  ECHO.2) Broken lookup (one-time lookup)
  ECHO.3) Broken lookup (race condition)
  ECHO.4) Correct lookup
  ECHO.5) Broken listener
  ECHO.6) Correct listener
  ECHO.7) Standard tracker
  ECHO.8) Customized tracker
  ECHO.

  SET _BUNDLES_=

  SET /P _BUNDLES_="Choose an example (1-8): "

  ECHO.

:CHOSEN

CALL mvn clean install "-P%_BUNDLES_%"

cd target/launch

java -jar launcher.jar bundles

popd

@ECHO ON
