# http

http 超文本传输协议 是用于传输超媒体文档的传输协议。http 是无状态协议。

## URI

URI 也被称为统一资源标识符
http 请求的内容都称为“资源”，每个资源都用 URL 来进行标识，一般情况下资源名称和位置由同一个 URL（统一资源定位符，URI 的一种）来标识

URL 的组成

```bash
http://www.example.com:80/path/to/myfile.html?key1=value1&key2=value2#SomewhereInTheDocument
https:// 表示协议
www.example.com  表示主机
:80 表示端口
/path/to/myfile.html 表示路径
?key1=value1&key2=value2 表示查询
#SomewhereInTheDocument 表示hash片段
```

所以一个 URL 的组成是 ： 协议 + 主机 + 端口 + 路径 + 查询字符串 + 片段

## http 基础

背景：提出三大技术

1. URI：统一资源标识符
2. HTML: 超文本标记语言
3. http： 超文本传输协议
   基于这三个技术，web 世界诞生，http 蓬勃发展

- http/0.9
  只有 get 方法 从服务器拉取文档，并在响应请求之后关闭连接，功能相当有限

- http/1.0
  背景：互联网蓬勃发展，多媒体图片、音乐技术也有新的发展促进了 http 的发展
  1. 增加了 HEAD、POST 等新方法
  2. 增加了响应状态码，标记可能得错误原因
  3. 引入了 http header 概念，让 http 处理请求和响应更加灵活
  4. 传输的数据不在局限于文本
- http/1.1
  1. 增加 delete put 等方法
  2. 增加缓存管理和控制
  3. 明确连接管理 允许持久连接
  4. 允许数据分块 利于传输大文件
  5. 强制 host 头，让互联网主机托管成为可能
- http/2
  1. 二进制协议，不再是纯文本
  2. 可以发起多个请求 废弃 1.1 中的管道
  3. 使用专用压缩算法压缩头部 减少数据传输量
  4. 允许服务器主动向客户端推送数据
