#include "probeLocations.H"

#include "argList.H"
#include "timeSelector.H"
#include "IOprobes.H"


using namespace Foam;


int probeLocations(int argc, char *argv[])
{
    timeSelector::addOptions();
    #include "addRegionOption.H"

    #include "setRootCase.H"
    #include "createTime.H"
    instantList timeDirs = timeSelector::select0(runTime, args);
    #include "createNamedMesh.H"

    IOprobes sniff
    (
        probes::typeName,
        mesh,
        word("probesDict"), // force the use of the system directory
        IOobject::MUST_READ,
        true
    );

    forAll(timeDirs, timeI)
    {
        runTime.setTime(timeDirs[timeI], timeI);
        Info<< "Time = " << runTime.timeName() << endl;

        // Handle geometry/topology changes
        polyMesh::readUpdateState state = mesh.readUpdate();

        if
        (
            state == polyMesh::POINTS_MOVED
         || state == polyMesh::TOPO_CHANGE
        )
        {
            sniff.read();
        }

        sniff.write();

        Info<< endl;
    }

    Info<< "End\n" << endl;

    return 0;
}