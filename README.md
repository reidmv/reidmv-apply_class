# apply\_class

#### Table of Contents

1. [Description](#description)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

The apply\_class module provides a utility plan for applying a Puppet class to a target node, and reviewing the output cleanly.

The README template below provides a starting point with details about what information to include in your README.

## Usage

If working with a Bolt project containing a Puppetfile (such as a control-repo), start by deploying all the referenced modules into the project directory.

```
bolt puppetfile install -v
```

Then, use the apply\_class plan to compile a catalog for the target 

```
bolt plan run apply_class --target=mynode.example.com classname=apply_class::test
```
