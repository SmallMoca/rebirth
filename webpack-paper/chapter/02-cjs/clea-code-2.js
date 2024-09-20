// 维护一个所有模块的数组。
var __webpack_modules__ = [
  ,
  // moduleId=0 的模块空缺，可理解为 index.js 即是0号模块
  // 每个模块都由一个包裹函数 (module, module.exports, __webpack_require__) 对模块进行包裹构成，这也是 CommonJS 模块的基础，详见 CommonJS 的 module wrapper
  (module) => {
    // moduleId=1 的模块，即 sum.js，此处没有做任务代码转译的工作
    module.exports = (...args) => args.reduce((x, y) => x + y, 0);
  },
];

// 模块缓存
var __webpack_module_cache__ = {};

// 实现一个模块加载器，模拟实现 CommonJS 的 require
function __webpack_require__(moduleId) {
  var cachedModule = __webpack_module_cache__[moduleId];

  if (cachedModule !== undefined) {
    // 如果该模块存在缓存，则直接在缓存中读取模块的 exports
    return cachedModule.exports;
  }

  // 对该模块进行缓存，注意 module.exports 是引用对象，稍后将对其赋值
  var module = (__webpack_module_cache__[moduleId] = {
    exports: {},
  });

  // 1. 执行模块内容，此时每一个模块是包裹函数，三个参数分别是 module、module.exports、__webpack_require__，详见 CommonJS 的包裹函数
  // 2. 在模块中执行 module.exports = xxx 的过程，将获取到模块的 exports，最后返回
  // 3. 此处容易得到在 CommonJS 中 module 与 exports 的关系
  __webpack_modules__[moduleId](module, module.exports, __webpack_require__);

  // require 的过程，其实就是执行函数并得到 module.exports 的过程
  return module.exports;
}

var __webpack_exports__ = {};

// 此处是一个立即执行函数
(() => {
  // 1. index.js，即入口文件的内容，直接执行
  // 2. 如果将 index.js 该模块视为 moduleId=0 的模块，则该立即执行函数等同于 __webpack_require__(0)
  // 3. 注意这里 require(sum) 时，已经变成了 require sum.js 的 moduleId
  const sum = __webpack_require__(/*! ./sum */ 1);
  sum(3, 8);
})();
