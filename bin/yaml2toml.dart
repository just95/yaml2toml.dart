#!/usr/bin/env dart

import 'package:args/args.dart';
import 'package:yaml2toml/yaml2toml.dart';

import 'dart:io';

/// Script which converts a `.yaml` file to a `.toml` file.
void main(List<String> args) {
    // command line arguments
  var parser = new ArgParser();  
  parser.addOption('input', 
      abbr: 'i', 
      valueHelp: 'path', 
      help: 'Path to the .yaml file. Required.');
  parser.addOption('output', 
      abbr: 'o', 
      valueHelp: 'path', 
      help: 'Path to the .toml file.\n'
            '(Defaults to "<input>.toml")');
  parser.addFlag('help',
      abbr: 'h',
      negatable: false,
      help: 'Shows this information.');
  
  try {
    var res = parser.parse(args);
    var help = res['help'];
    var input = res['input'];
    var output = res['output'];
    
    if (help || input == null) throw '--help';
    
    // output defaults to <input>.toml
    if (output == null) 
      output = input.replaceFirst(new RegExp(r'\.yaml$'), '.toml');
    
    // open in/output
    var yaml = new File(input);
    var toml = new File(output);
    
    if (!yaml.existsSync()) throw '$yaml not found!';
    
    // read yaml, convert and write to toml
    var converter = new Yaml2TomlConverter();
    yaml.readAsString()
        .then(converter.convert)
        .then(toml.writeAsString)
        .catchError(print);
  }
  catch (err) {
    if (err == '--help') {
      print('YAML to TOML converter.');
    }
    else{
      print(err);
    }
    
    print('\n'
          'Usage: yaml2toml [options]'
          '\n');
    print('Options:');
    
    print(parser.usage);
  }
}
