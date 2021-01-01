[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
![https://github.com/pharo-containers/Containers-RunArray/workflows/currentStablePharo/badge.svg](https://github.com/pharo-containers/Containers-RunArray/workflows/currentStablePharo/badge.svg)
![https://github.com/pharo-containers/Containers-RunArray/workflows/matrix/badge.svg](https://github.com/pharo-containers/Containers-RunArray/workflows/matrix/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-containers/Containers-RunArray/badge.svg?branch=master)](https://coveralls.io/github/pharo-containers/Containers-RunArray?branch=master)

# Containers-RunArray
A runarray is a collection optimized for sequence of repeating values. 

## Loading 
The following script installs Containers-RunArray in Pharo.

```smalltalk
Metacello new
  baseline: 'ContainersRunArray';
  repository: 'github://pharo-containers/Containers-RunArray/src';
  load.
```

## If you want to depend on it 

Add the following code to your Metacello baseline or configuration 

```smalltalk
spec 
   baseline: 'ContainersRunArray' 
   with: [ spec repository: 'github://pharo-containers/Containers-RunArray/src' ].
```
