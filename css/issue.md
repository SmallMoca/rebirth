# css 权重

> - !important 关键字 最高权重
> - 内联样式
> - id 选择器
> - 类选择器
> - 属性选择器
> - 伪类选择
> - 标签选择器

# 可继承和不可继承样式

**可继承属性** 通常只会影响文本的内容和展示
如： color font-size 字体 font-weight line-height 等
**不可继承属性** 通常会影响 HTML 盒模型 位置 尺寸等
如：高度 宽度 内边距 margin 外边距 pending 边框 border position 定位 display overflow

# 隐藏元素的方式

- display：node （回流
- visibility: hidden （重绘
- opacity：0 （回流
- position 绝对定位 移出可是窗口 （可能回流 可能重绘
- z-index：将元素置于层级最下遮挡 （重绘
