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

## gird 网格布局
