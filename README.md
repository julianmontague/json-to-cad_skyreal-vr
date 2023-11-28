If you plan to expand on this work, see the [Future work](#future-work) section.

# JSON to CAD

This project was meant to convert BackToCAD.json files exported from [SkyReal VR][skyreal-vr] to a neutral 3D CAD format. It is not, and was never, created nor endorsed by SkyReal.

These programs were created by Julian Montague for an internship with DigiCat at [ÅKP][åkp]. The use case was to create [designs][skyreal-design] in SkyReal VR and import them into 3D CAD software not supported by SkyReal.

## Status

The programs in this repository are not functional. This branch, main, contains a Zig program to read a BackToCAD.json file. All it does is write out the designs to another JSON file to verify that its parsing is correct.

The stepcode-bindings branch contains a failed attempt to create Zig [bindings][bindings] for [STEPcode][stepcode].

The java branch contains a JavaFX application that runs a "Hello World" of [JSDAI][jsdai].

<h3 id="future-work">Future work</h3>

The only useful result of this Zig program is its ability to parse BackToCAD.json files (referred to as BackToCAD in this section).

`src/main.zig` parses the "design" JSON object in BackToCAD. `src/BackToCad.zig` specifies which data to parse from BackToCAD. Zig source files are implicitly [structs][zig-structs], and the field names in `BackToCad.zig` are the [JSON object member names][json.org]. See commit 801d0502af775885507332da9c6f46ee152ae60b for an explanation of why the number types were chosen. A SkyReal representative confirmed that the 4-by-4 transformation matrix "absolute_transformation" is stored in [row-major order](https://en.wikipedia.org/wiki/Row-_and_column-major_order).

Line 33 of `src/main.zig` does the actual parsing by calling a Zig Standard Library function [parseFromTokenSource](https://ziglang.org/documentation/master/std/#A;std:json.parseFromTokenSource).

#### Generating 3D CAD files

There is no free (of charge) SDK or library for writing .dwg files, which was the desired output format. The best file formats for exchanging to other formats are [ISO 10303-21 (STEP)][step-file] or [IFC][ifc].

[STEPcode][stepcode] is a C++ SDK that works despite lacking comprehensive documentation, and is used by [BRL-CAD][brl-cad] (see [g-step.cpp][brl-cad-g-step]). See the previous version of this README in commit 3a9191e17fb1928dc48b64a392785cf0181e9fc4 for tips on how to build STEPcode. The [minimal Part 21 C++ example][p21-cpp] can be used to test the installation of STEPcode, although be aware that `sc_cf.h` used there [was renamed][sc_cf-rename] to `config.h` in v0.8.1. v0.8.2 also [recommends including the path to headers](https://github.com/stepcode/stepcode/releases/tag/v0.8.2).

[JSDAI][jsdai], a Java API for STEP files, is recommended against since Julian was unable to get it to work. [IfcOpenShell][ifc-open-shell] is an IFC toolkit for Python or C++, but its use was not investigated in this project.

If the licensing costs are amenable, the [Open Design Alliance Drawings SDK][oda-drawings] **may** be easier to use than other solutions in order to generate .dwg files directly. But there are absolutely no guarantees of this since we don't know its contents due to its proprietary nature.

#### Tools

The "tools" JSON object may also be of interest, but Julian has not worked on parsing it.

"SkyReal does not export the original file name of tools in Back to CAD. E.g. with Catia if the entire path is not there the file will not load." - SkyReal representative

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
[stepcode]: https://stepcode.github.io/
[jsdai]: https://jsdai.net/
[zig-structs]: https://ziglang.org/documentation/0.11.0/#struct
[json.org]: https://www.json.org/json-en.html
[step-file]: https://en.wikipedia.org/wiki/ISO_10303-21
[ifc]: https://en.wikipedia.org/wiki/Industry_Foundation_Classes
[brl-cad]: https://brlcad.org/
[brl-cad-g-step]: https://github.com/BRL-CAD/brlcad/blob/main/src/conv/step/g-step/g-step.cpp
[p21-cpp]: https://stepcode.github.io/docs/p21_cpp_example/
[sc_cf-rename]: https://github.com/stepcode/stepcode/commit/97c3d193a1421d6ee561c06f83323704cf4000cf
[ifc-open-shell]: https://ifcopenshell.org/
[oda-drawings]: https://www.opendesign.com/products/drawings
[save-for-b2c]: https://docs.sky-real.com/docs/skyreal/commands/save/#save-for-back-to-cad
