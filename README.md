# create-skynet

A simple launch application for [skynet](https://github.com/cloudwu/skynet)

## Requirements

- lua 5.3.5
- skynet prerequisites (see [skynet wiki](https://github.com/cloudwu/skynet/wiki))

## Usage

cd to the root dir and run `./script/start.sh` to start the server

basically refer to [skynet_example](https://github.com/cloudwu/skynet_sample) and examples already written in skynet module


## Structure

- bin: binaries
- config: skynet configs
- doc: docs
- internal: lower-level services and libraries that can be reused
- luaclib: C libraries
- lualib: lua libraries
- service: lua services
- script: scripts for common usage
- skynet: skynet SDK
- test: libraries and scripts for testing
- Makefile
