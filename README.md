# apply\_class

#### Table of Contents

1. [Description](#description)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

The apply\_class module provides a utility plan for applying a Puppet class to a target node, and reviewing the output cleanly.

## Usage

If working with a Bolt project containing a Puppetfile (such as a control-repo), start by deploying all the referenced modules into the project directory.

```
bolt puppetfile install -v
```

Then, use the apply\_class plan to compile a catalog for the target 

```
bolt plan run apply_class --target=mynode.example.com classname=apply_class::test
```

### Full example

```
[reidmv@halcyon:~/control-repo/] % ls
data  manifests  modules  scripts  site-modules  LICENSE  Puppetfile  README.md  bolt.yaml  environment.conf  hiera.yaml
[reidmv@halcyon:~/control-repo/] % bolt puppetfile install -v
Using Puppetfile '/Users/reidmv/control-repo/Puppetfile'
Updating module /Users/reidmv/control-repo/modules/inifile
Updating module /Users/reidmv/control-repo/modules/stdlib
Updating module /Users/reidmv/control-repo/modules/concat
Updating module /Users/reidmv/control-repo/modules/apply_class
Successfully synced modules from /Users/reidmv/control-repo/Puppetfile to /Users/reidmv/control-repo/modules
[reidmv@halcyon:~/control-repo/] % bolt plan run apply_class --target="local://localhost" classname="apply_class::test"
Starting: plan apply_class
Starting: install puppet and gather facts on local://localhost
Finished: install puppet and gather facts with 0 failures in 6.57 sec
Starting: apply catalog on local://localhost
Finished: apply catalog with 0 failures in 14.18 sec
2019-04-26T17:09:28.875230000-07:00 NOTICE Puppet this is a test
2019-04-26T17:09:28.877054000-07:00 NOTICE /Stage[main]/Apply_class::Test/Notify[this is a test]/message defined 'message' as 'this is a test'
2019-04-26T17:09:28.878121000-07:00 NOTICE Puppet of apply_class
2019-04-26T17:09:28.879459000-07:00 NOTICE /Stage[main]/Apply_class::Test/Notify[of apply_class]/message defined 'message' as 'of apply_class'
2019-04-26T17:09:28.880491000-07:00 NOTICE Puppet have a wonderful day!
2019-04-26T17:09:28.881761000-07:00 NOTICE /Stage[main]/Apply_class::Test/Notify[have a wonderful day!]/message defined 'message' as 'have a wonderful day!'
2019-04-26T17:09:28.890619000-07:00 NOTICE Puppet Applied catalog in 0.02 seconds
"changed" on local://localhost: changed: 3, failed: 0, unchanged: 0 skipped: 0, noop: 0
Finished: plan apply_class in 20.89 sec
true
[reidmv@halcyon:~/control-repo/] %
```
