# css 日常

## flex 布局

`display:flex` 弹性盒子布局。

flex 布局属性
**容器属性**
`felx-direction`: 决定主轴的方向，默认值 row ，可设 column | column-reverse | row | row-reverse
`flex-wrap`: 决定轴线排不下是否换行 默认值 nowrap ,可设 nowrap | wrap | wrap-reverse
`justify-content`: 决定主轴的对其方式
`align-items`: 配置所有子项目在交叉轴的对其方式
`align-content`: 配置项目在交叉轴上的分布方式 ，作用于多行 单行无效
`flex-flow`: flex-direction 和 flex-wrap 的简写

**项目属性**
order: 配置项目的排列顺序
flex-grow: 定义了项目的放大比例，默认值为：0 ，也就是说如果存在剩余空间 也不会放大
flex-shrink: 定义了项目缩小比例，吗，默认值为：1，也就是说如果空间不足，该项目将缩小
flex-basis: 定义了在分配多余空间之前，项目占据的主轴空间，默认值：auto，既项目本来大小
align-self: 配置单元格内容的垂直对齐方式。默认值：auto。可设置的值：start | end | center | stretch。
flex: flex 属性是 flex-basic 、flex-grow flex-shrink 的简写，flex:1,代表设置 felx-basic:auto;flex-shrink:1; flex-grow:1;

常用属性：

## grid 网格布局

display:grid; 指定一个容器采用网格布局

```css
display: grid;
grid-template-columns: 100px 100px 100px;
grid-template-rows: 100px 100px 100px;
/* 也可以简写为 */
grid-template-columns: repeat(3, 100px);
```

## css 盒模型

css 用来描述在浏览器渲染引擎渲染一个文档时，将元素比作一个个矩形盒子。css 盒模型分为两种：标准盒模型 和 怪异盒模型；
在标准模型中 `盒子总宽度 = width + padding + margin = border`,谷歌浏览器中默认就是标准盒模型
在怪异盒子模型中 `盒子总宽度 = width + margin`，通过 css `box-sizing:border-box;`设置盒子为怪异盒子模型

## css 中的选择

id 选择器 类名选择器 标签选择器 后代选择器 子级 伪类选择器 属性选择器等
样式生效权重 `！important > 内联样式 > id选择 > 类名选择 > 标签选择器`

## css 中的单位有哪些；

- px:像素单位
- rem：相对单位 相对于根字体大小
- vw\vh：相对单位 ，相对于窗口宽高比
- 百分比（%）:相对于父容器

## 物理像素、逻辑像素、CSS 像素、PPI、设备像素比 DPR

- 物理像素：设备屏幕实际拥有的像素点，比如 iPhone6 宽边有 750 个像素点，长边有 1334 个像素点.
- 逻辑像素（设备独立像素）：通常指分辨率 比如 iPhone 的独立像素 就是 375 \* 667，在 iPhone 6 中 一个逻辑像素等于两个物理像素，在 iPhone12 中 dpr 为 3 ，一个逻辑像素等于三个物理像素
- css 像素：浏览器使用的单位
- dpr: 设备像素比 ，浏览器可以通过 window.devicePixelRatio 获取 dpr ,小程序可以通过 wx.getSystemInfoSync().devicePixelRatio 获取 dpr

在移动端中，例如 iPhone6 的 dpr 是 2，我们用 1px 配置边框，实际上是使用了 2 个物理像素 。

**移动端 1px 方案**

**移动端设配方案**

- rem 方案
- vw/vh 方案

**meta 标签的作用**
为 html 文档提供元数据

- 为移动端设置视窗
- 声明一些数据利于 seo

##
