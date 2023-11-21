# JSON to CAD

This project was meant to convert BackToCAD.json files exported from [SkyReal VR][skyreal-vr] to a neutral 3D CAD format. It is not, and was never, created nor endorsed by SkyReal.

These programs were created by Julian Montague for an internship with DigiCat at [ÅKP][åkp]. The use case was to create [designs][skyreal-design] in SkyReal VR and import them into 3D CAD software not supported by SkyReal.

## Status

The programs in this repository are not functional. This branch, main, contains a Zig program to read a BackToCAD.json file. All it does is write out the designs to another JSON file to verify that its parsing is correct.

The stepcode-bindings branch contains a failed attempt to create Zig [bindings][bindings] for [STEPcode](https://stepcode.github.io/).

The java branch contains a JavaFX application that runs a "Hello World" of [JSDAI](https://jsdai.net/).

## Requirements

- Zig version 0.12.0 after [commit f3f554b9b89cc39cf00b4df68bd3455e8ef34984][1].

## Installing

- Clone this repository
- Run `zig build`

### Usage

- [Export BackToCAD.json][save-for-b2c] for a simulation map from SkyReal VR
- Create a new folder called `input`
- Copy the exported BackToCAD.json to `input`
- Create a new folder called `output`
- Run `json-to-cad`

The directories `input` and `output` must exist in the current working directory, otherwise the program will crash.

[1]: https://github.com/ziglang/zig/commit/f3f554b9b89cc39cf00b4df68bd3455e8ef34984
[skyreal-vr]: https://sky-real.com/product/skyreal-vr/
[åkp]: https://www.aakp.no/aakp
[skyreal-design]: https://docs.sky-real.com/docs/skyreal/commands/design
[bindings]: https://en.wikipedia.org/wiki/Language_binding
[save-for-b2c]: https://docs.sky-real.com/docs/skyreal/commands/save/#save-for-back-to-cad
