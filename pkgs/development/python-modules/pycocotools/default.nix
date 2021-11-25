{ lib
, buildPythonPackage
, fetchPypi
, cython
, matplotlib
}:

buildPythonPackage rec {
  pname = "pycocotools";
  version = "2.0.3";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "3829024930013771156521a4b8db4b3aef590556cfa3a8dd3fab027d39b215e1";
  };

  propagatedBuildInputs = [
    cython
    matplotlib
  ];

  pythonImportsCheck = [
    "pycocotools.coco"
    "pycocotools.cocoeval"
  ];

  # has no tests
  doCheck = false;

  meta = with lib; {
    description = "Official APIs for the MS-COCO dataset";
    homepage = "https://github.com/cocodataset/cocoapi/tree/master/PythonAPI";
    license = licenses.bsd2;
    maintainers = with maintainers; [ hexa piegames ];
  };
}
