# OpenFOAM 3.0.1

## How to build docker

```
git clone https://github.com/mixxen/OpenFOAM_example.git
cd OpenFOAM_example
wget "http://downloads.sourceforge.net/foam/OpenFOAM-3.0.1.tgz" -O OpenFOAM-3.0.1.tgz
wget "http://downloads.sourceforge.net/foam/ThirdParty-3.0.1.tgz" -O ThirdParty-3.0.1.tgz
docker build -t openfoam .
```

## How to compile this project in docker
```
docker run -it -v $(pwd)/probeLocations:/root/probeLocations openfoam bash
of301
cd /root/probeLocations/lib
wmake
cd /root/probeLocations/exe
wmake
./probeLocations
```

## How to run sample in docker container
```
cd /root/probeLocations/data/cavity
../../exe/probeLocations -latestTime
```