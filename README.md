
[![](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/liangxiegame/QFramework/blob/master/LICENSE)

## QFrameworkGodot 简介 Intro

本项目基于https://github.com/liangxiegame/QFramework 实现的一个godot插件，使用纯gdscript实现的版本。目前还在完善

## 我的对于此框架的理解：

- 所有层全部注册到architecture,各个层按所需职责限制好范围，不越界。具体可以参考上面页面的学生总结部分。
- 类似于注册中心。比如ioc_container和type_event_system都是一个对应的中心，一个是系统的中心，一个是事件分发的中心。
- command我觉得是一种高级权限，可以直接更改所有层状态。而event属于一种事件的订阅和分发。（最好的说明就是：command是一种意图，event是一个事实）
- 框架是采取规范的，不必太过于苛刻遵守，但是好的规范一定会编码受益



## v0.4:
去除了command这一层，因为gdscript语言的特性，不偏向于多层封装。

## v0.5
实现architecture采用全局自动加载形式，可以去掉单例块的代码，保证简洁

## v0.6
修复了model自动错误的bug

如有问题或者相关问题可以联系我
