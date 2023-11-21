# JSON to CAD

This project was meant to convert BackToCAD.json files exported from [SkyReal VR][skyreal-vr] to a neutral 3D CAD format. It is not, and was never, created nor endorsed by SkyReal.

This project was created by Julian Montague for an internship with DigiCat at [ÅKP][åkp]. The use case was to create [designs][skyreal-design] in SkyReal VR and import them into 3D CAD software not supported by SkyReal.

## Status

The programs in this repository are not functional. This branch, main, contains a Zig program to read a BackToCAD.json file. All it does is write out the designs to another JSON file to verify that its parsing is correct.

The stepcode-bindings branch contains a failed attempt to create Zig [bindings][bindings] for [STEPcode](https://stepcode.github.io/).

The java branch contains a JavaFX application that runs a "Hello World" of [JSDAI](https://jsdai.net/).

## Requirements

- Zig version 0.12.0 after [commit f3f554b9b89cc39cf00b4df68bd3455e8ef34984][1].
- [STEPcode][2]

## Installing

### json-to-cad

- Clone this repository
- Run `zig build`

#### Usage

- [Export BackToCAD.json][save-for-b2c] for a simulation map from SkyReal VR
- Create a new folder called `input`
- Copy the exported BackToCAD.json to `input`
- Create a new folder called `output`
- Run `json-to-cad`

The directories `input` and `output` must exist in the current working directory, otherwise the program will crash.

### STEPcode

Follow the [instructions][3] to build STEPcode from the command line, with the following modifications:

- Run `cmake .. -DSC_BUILD_SCHEMAS=ap203` instead of `cmake ..` (json-to-cad only uses AP203)
- Run `cmake install`, it is not optional for our uses!
- Copy the `sdai_ap203` shared library to the install location, as it is not installed with `cmake install`.
  - On Linux with the default install location:
    ```bash
    sudo cp /path/to/stepcode/build/lib/libsdai_ap203.so.0.8.1 /usr/local/lib
    # remove execute permission to match the rest of STEPcode libraries
    sudo chmod 644 /usr/local/lib/libsdai_ap203.so.0.8.1
    # configure dynamic linker run-time bindings
    sudo ldconfig
    # create linker name as a symbolic link to the soname created by ldconfig
    sudo ln -s /usr/local/lib/libsdai_ap203.so.0 /usr/local/lib/libsdai_ap203.so
    ```

[1]: https://github.com/ziglang/zig/commit/f3f554b9b89cc39cf00b4df68bd3455e8ef34984
[2]: https://github.com/stepcode/stepcode
[3]: https://github.com/stepcode/stepcode/blob/develop/INSTALL
[skyreal-vr]: https://sky-real.com/product/skyreal-vr/
[åkp]: https://www.aakp.no/aakp
[skyreal-design]: https://docs.sky-real.com/docs/skyreal/commands/design
[bindings]: https://en.wikipedia.org/wiki/Language_binding
[save-for-b2c]: https://docs.sky-real.com/docs/skyreal/commands/save/#save-for-back-to-cad
