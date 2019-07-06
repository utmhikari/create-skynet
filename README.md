# create-skynet

启动你的[skynet](https://github.com/cloudwu/skynet)之旅吧！

## 介绍

skynet是一个性能出众但上手不易服务端框架。因此为了解决上手痛点，开启`create-skynet`分享一下入坑经验（对自己而言也是个学习笔记～）。

`create-skynet`参考了云大的[skynet_sample](https://github.com/cloudwu/skynet_sample)项目以及skynet内置examples的设定。通常框架开发咱们都会下意识地clone一个项目然后在项目里边折腾，然而对于skynet，最妥的方式却是把它当做一个submodule使用。为此，利用skynet的loader，我们可以在读取skynet原生项目，将之当做一个lib/toolset的同时，在外层做我们自己的事。这样就方便多了。

约定优于配置。比如写skynet服务，统一写到`service`目录下，默认config约定主入口为`main.lua`，而子服务可以写在根目录下，也可以写在以服务名为目录下的`main.lua`中。这样就不需关心最基础的服务需求该如何组织目录了（强迫症orz）。

要理解更多，比如skynet的运行机制、配置细节、数据库/缓存/http支持等，仍需refer to [skynet wiki](https://github.com/cloudwu/skynet/wiki)

## 目录结构

- root: 根目录
  - bin: 可执行文件目录
  - config: 配置
  - luaclib: c库
  - lualib: lua库
  - resource: 静态文件
    - sproto: sproto协议
  - service: 服务目录
    - SERVICE_NAME: 服务名
      - aaa.lua: 服务的lualib
      - main.lua: 服务入口
    - main.lua: 主入口
    - SERVICE_XXX.lua: XXX服务
  - skynet: skynet原生项目
  - test: 测试脚本
  - make.sh: 编译skynet
  - start.sh: 启动skynet

## 用法

`create-skynet`自带了最经典的`watchdog--gate--agent`例子

### 启动＆测试

最简单的用法如下：

```sh
git clone $GITURL $PROJECT_ROOT --recursive
cd $PROJECT_ROOT
./make.sh
./start.sh
```

而后启动测试客户端：

```sh
lua ./test/client.lua
```

Enjoy~
