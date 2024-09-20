// 数组字面量方式创建数组
const arr1 = [1, 2, 3, 4];

arr1.forEach((item) => {
  console.log(item);
});

// 使用构造函数构建数组
const arr2 = new Array(5).fill(0);

arr2.forEach((item) => {
  console.log(item);
});

// new Array(5) 创建的是稀松数组，这些空位不是undefined  而是未定义的空槽 无法直接只用数组的大部分呢方法操作
const arr3 = new Array(5);
//空槽无法使用forEach filter map 等大部分方法遍历
arr3.forEach((item) => {
  console.log(item);
});

// 空槽 可以使用 for 循环遍历
for (let i = 0; i < arr3.length; i++) {
  const element = arr3[i];
  console.log(element);
}
// 可以获取数组长度
console.log(arr3.length); // 5

// 二维数组
// 初始化一个二维数组
const dyadicArr1 = new Array(7).fill(new Array(7).fill(1));
console.log(dyadicArr1);

// Array文档
// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array

{
  // 数组构造函数 Array
  // 构造函数方式创建数组 返回数组实例
  let arr = new Array(7);

  // 直接把构造函数Array 当普通方法使用也会返回数组实例
  let arr2 = new Array(7);
  // Array 是一个多态函数
  // Array 一个入参的时候 这个参数是一个整数 创建一个长度为 n 的空槽数组
  // Array 为多个参数的时候 ，多个参数将作为创建数组实例的元素
  let arr3 = new Array('1', 'logo');
  console.log(arr3); // [ '1', 'logo' ]
}
