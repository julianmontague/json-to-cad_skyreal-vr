# JSON to CAD

The code in this branch doesn't work. It was an attempt to use [STEPcode][2] from Zig.

## Requirements

- Zig version 0.12.0 after [commit f3f554b9b89cc39cf00b4df68bd3455e8ef34984][1].
- [STEPcode][2]

## Installing

### TODO: Zig json-to-cad build

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
