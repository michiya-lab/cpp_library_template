# Templete to develop c++ library

```bash
$ mkdir build
$ cd build
$ cmake \
-DCMAKE_INSTALL_PREFIX=/path/to/install \
-DBUILD_SHARED_LIBS=ON \
-DBUILD_EXAMPLES=ON \
-DBUILD_TESTING=ON \
..
$ make
$ make test
$ make install
```

```bash
$ git remote -v
$ git remote rm origin
$ git remote -v
$ git remote add origin <your_remote_repository>
```
