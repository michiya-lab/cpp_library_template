# Templete to develop c++ library

## Getting start

```bash
rm -rf .git
git init
```

```bash
git remote -v
git remote rm origin
git remote -v
git remote add origin <your_remote_repository>
git checkout -b develop
```

```bash
cd script
python3 create_project_cmakes.py -n <your_project_name> [--build_main]
```

```bash
git add -A
git commit -m "initial commit"
git checkout -b develop

## CMake Building

```bash
mkdir build
cd build
cmake \
-DCMAKE_INSTALL_PREFIX=/path/to/install \
-DBUILD_SHARED_LIBS=ON \
-DBUILD_EXAMPLES=ON \
-DBUILD_TESTING=ON \
..
make
make test
make install
```
