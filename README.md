# OpenFOAM 3.0.1

## How to build docker

```
wget "http://downloads.sourceforge.net/foam/OpenFOAM-3.0.1.tgz" -O OpenFOAM-3.0.1.tgz
wget "http://downloads.sourceforge.net/foam/ThirdParty-3.0.1.tgz" -O ThirdParty-3.0.1.tgz
docker build -t openfoam .
```

## How to compile
```
docker run -it -v $(pwd)/probeLocations:/root/probeLocations openfoam bash
of301
cd /root/probeLocations/lib
wmake
cd /root/probeLocations/exe
wmake
./probeLocations
```

## How to run sample
```
cd /root/probeLocations/data/cavity
../../exe/probeLocations -latestTime
```