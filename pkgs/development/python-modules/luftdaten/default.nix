{ lib, buildPythonPackage, isPy3k, fetchPypi, aiohttp, async-timeout }:

buildPythonPackage rec {
  pname = "luftdaten";
  version = "0.7.0";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0f578c67c96faa05b4bbd0efcd2476c24a0cbb569751c85b72485f4d30301f52";
  };

  propagatedBuildInputs = [ aiohttp async-timeout ];

  # No tests implemented
  doCheck = false;

  pythonImportsCheck = [ "luftdaten" ];

  meta = with lib; {
    description = "Python API for interacting with luftdaten.info";
    homepage = "https://github.com/home-assistant-ecosystem/python-luftdaten";
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
  };
}
