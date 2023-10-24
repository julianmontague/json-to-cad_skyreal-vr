# JSON to CAD

## Requirements

- Zig version 0.12.0 after [commit f3f554b9b89cc39cf00b4df68bd3455e8ef34984][1].
- [STEPcode][2]

## Installing

### TODO: Zig json-to-cad build

### STEPcode

Follow the [instructions][3] to build STEPcode from the command line, with the following modifications:

- Run `cmake .. -DSC_BUILD_SCHEMAS=ap203` instead of `cmake ..` (json-to-cad only uses AP203)
- Don't run `make install` (I didn't)

[1]: https://github.com/ziglang/zig/commit/f3f554b9b89cc39cf00b4df68bd3455e8ef34984
[2]: https://github.com/stepcode/stepcode
[3]: https://github.com/stepcode/stepcode/blob/develop/INSTALL
