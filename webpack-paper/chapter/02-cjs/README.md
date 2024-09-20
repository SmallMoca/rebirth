## commonjs vs esm

### **背景**

cjs 属于 node 模块系统， esm 是 js 原生模块系统 ，被浏览器和 node 支持

### **语法**

cjs 通过 require 方法导入 ，通过 module.exports 或 exports 导出
esm 通过 import 关键字导入，export 关键字导出

### 三大差异

- commonjs 输出是一个值的拷贝 esm 输出的是值的引用
- commonjs 是运行时加载 esm 是编译时输出的接口
- commonjs require()是同步加载模块，es6 import 是异步加载

### esm

**export**
模块式独立的，该模块里面的所有变量外部都无法获取，如果希望外部读取模块内的某个变量，使用 export 关键字输出该变量，所以说 export 是对外输出的一个接口

### package.json 中的 main 字段 和 exports 字段

main: 定义模块加载的入口文件

```json
{
  "type": "module",
  "main": "./src/index.js"
}
```

exports: exports 字段的优先级高于 main 字段，它有多种用法

- 子目录别名用法

```json
{
  "exports": {
    "./submodule": "./src/submodule.js"
  }
}
```

- main 别名用

```json
{
  "exports": {
    ".": "./main.js"
  }
}

// 等同于
{
  "exports": "./main.js"
}

```

- 条件加载
  .这个别名，可以为 ES6 模块和 CommonJS 指定不同的入口。

```json
{
  "type": "module",
  "exports": {
    ".": {
      "require": "./main.cjs",
      "default": "./main.js"
    }
  }
}
```
