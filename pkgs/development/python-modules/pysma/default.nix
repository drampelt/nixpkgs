{ lib
, aiohttp
, attrs
, buildPythonPackage
, fetchPypi
, jmespath
, async-timeout
}:

buildPythonPackage rec {
  pname = "pysma";
  version = "0.6.9";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d995375230cda3e7e99d82b85a5612bbb5ea91ba5c2bb5f3e5c50a0c0061c1d9";
  };

  propagatedBuildInputs = [
    aiohttp
    async-timeout
    attrs
    jmespath
  ];

  # pypi does not contain tests and GitHub archive not available
  doCheck = false;
  pythonImportsCheck = [ "pysma" ];

  meta = with lib; {
    description = "Python library for interacting with SMA Solar's WebConnect";
    homepage = "https://github.com/kellerza/pysma";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
