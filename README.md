![github actions](https://github.com/PurpleFlowerGarden/vcpkg-sqlite-demo/actions/workflows/cmake.yml/badge.svg)

Run `cmake --list-presets` to display a set of supported presets, and then use
    
```
cmake --preset ${preset}
cmake --build --preset ${preset}
ctest --preset ${preset}
```
in order to build and and execute the demo application.
