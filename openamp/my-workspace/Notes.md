```shell
sudo apt install libsysfs-dev
```

Initialization
The first step is to initialize the workspace folder (my-workspace) where the examples and all Zephyr modules will be cloned. You can do that by running:
```shell
# initialize my-workspace for the example-application (main branch)
west init -m https://github.com/OpenAMP/openamp-system-reference --mf examples/legacy_apps/west.yml --mr main my-workspace
# update modules
cd my-workspace
west update
```
Build
The following steps are to build legacy apps on a host machine.
```shell
export PROJECT_ROOT=$PWD
```
Build libmetal
```shell
cd $PROJECT_ROOT/libmetal
cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=$PROJECT_ROOT/target
make -C build VERBOSE=1 install
```
Build open_amp
```shell
cd $PROJECT_ROOT/open-amp
cmake . -Bbuild -DCMAKE_INCLUDE_PATH=$PROJECT_ROOT/libmetal/build/lib/include/   -DCMAKE_LIBRARY_PATH=$PROJECT_ROOT/libmetal/build/lib/ -DCMAKE_INSTALL_PREFIX=$PROJECT_ROOT/target
make -C build VERBOSE=1 install
```
Build legacy Apps
```shell
cd $PROJECT_ROOT/openamp-system-reference/examples/legacy_apps
cmake -Bbuild \
-DCMAKE_INCLUDE_PATH="$PROJECT_ROOT/libmetal/build/lib/include/;$PROJECT_ROOT/open-amp/build/lib/include/" \
-DCMAKE_LIBRARY_PATH="$PROJECT_ROOT/libmetal/build/lib/;$PROJECT_ROOT/open-amp/build/lib/" \
-DCMAKE_INSTALL_PREFIX=$PROJECT_ROOT/target
make -C build VERBOSE=1 install
```

Run demonstration on a Linux PC
It is possible to run the application on a Linux PC to communicate between two Linux processes.
```shell
# Terminal 1 (echo/device - starts first, listens on Unix socket)
cd $PROJECT_ROOT/target
LD_LIBRARY_PATH=$PWD/lib ./bin/rpmsg-sample-echo-static

# Terminal 2 (ping/driver - connects to the echo server)
cd $PROJECT_ROOT/target
LD_LIBRARY_PATH=$PWD/lib ./bin/rpmsg-sample-ping-static 1
```

> Note: `rpmsg-echo-static` uses service name `"rpmsg-openamp-demo-channel"` (its ping partner was not built).
> Use matched pairs only: `rpmsg-sample-echo-static` + `rpmsg-sample-ping-static`, or `rpmsg-nocopy-echo-static` + `rpmsg-nocopy-ping-static`.
> The `1` argument selects `proc_id=1` (client/connect mode). The echo side defaults to `proc_id=0` (server/listen mode).