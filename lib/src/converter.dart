// Copyright (c) 2015 Justin Andresen. All rights reserved. 
// This software may be modified and distributed under the terms
// of the MIT license. See the LICENSE file for details.

library yaml2toml.src.converter;

import 'dart:async';

import 'package:yaml/yaml.dart';
import 'package:toml/encoder.dart';

/// Converter for YAML to TOML.
class Yaml2TomlConverter {
  
  /// Converts a YAML document to a TOML document.
  /// 
  /// [yaml] contains the contents of the YAML document.
  /// Returns a future of the generted TOML document.
  Future<String> convert(String yaml){
    var encoder = new TomlEncoder();
    return new Future.microtask(
        () => encoder.encode(loadYaml(yaml)));
  }
  
}
