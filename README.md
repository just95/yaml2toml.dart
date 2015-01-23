# yaml2toml.dart

A converter for 
[YAML](http://www.yaml.org/) 
to 
[TOML](https://github.com/toml-lang/toml)
for dart. 

This application uses the encoder provided by the
[toml.dart](https://github.com/just95/toml.dart)
library to generate TOML documents from files parsed by the
[yaml](https://pub.dartlang.org/packages/yaml) library.

## Usage:

### Command line interface

The `yaml2toml.dart` script located in the `bin/` directory exposes a simple 
command line interface.
The `--input` (or `-i`) option specifies the path to the `.yaml` file.
By default the generated TOML document will be placed in the current working 
directory and is called `<input>.toml`.  
An optional `--output` (or `-o`) option can be passed to override this behavior.
```sh
  pub run yaml2toml -i <path-to-yaml> [-o <path-to-toml>] 
```

### Dart interface

This package can be integrated into your application by adding `yaml2toml`
as a dependency to your `pubspec.yaml` and running the `pub get` command.
```yaml
dependencies:
  yaml2toml: ">=0.1.0 <0.2.0"
```

Now insert this import at the top of your code:
```dart
import 'package:yaml2toml/yaml2toml.dart';
``` 
The library exports a single `Yaml2TomlConverter` class whose `convert` method
takes a YAML encoded `String` and returns a `Future` of the converted TOML
document.
```dart
var converter = new Yaml2TomlConverter();
converter.convert(yaml).then((String toml) {
  // ...
});
```

## Example

You can try to convert the `pubspec.yaml` included with this package
to a TOML file.
Running the following command from the package root:
```sh
pub run yaml2toml -i pubspec.yaml 
```
will automatically create a `pubspec.toml` file.

## License

toml.dart is licensed under the MIT license agreement. 
See the LICENSE file for details.