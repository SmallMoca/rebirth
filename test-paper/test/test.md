加载 JavaScript 文件有多种方式，不同方式对页面的加载顺序、性能和用户体验有不同的影响。以下是常见的几种加载 JavaScript 文件的方式：

### 1. **同步加载 JavaScript （默认加载方式）**

这是最基础的方式，默认情况下，浏览器会同步加载 `<script>` 标签中的 JavaScript 文件。浏览器在加载和执行 JavaScript 之前，会阻塞 HTML 的解析和渲染。

```html
<script src="script.js"></script>
```

- **优点**：确保 JavaScript 在 HTML 解析之前执行。
- **缺点**：阻塞页面加载，增加首屏时间，不推荐用于非关键的脚本。

### 2. **异步加载 JavaScript**

使用 `async` 属性可以异步加载 JavaScript 文件。脚本在后台下载，一旦加载完成，立即执行，不保证执行顺序。如果有多个异步脚本，它们的执行顺序取决于哪个先下载完成。

```html
<script src="script.js" async></script>
```

- **优点**：不会阻塞 HTML 的解析，提升页面的加载性能。
- **缺点**：脚本的执行顺序不确定，适合与其他脚本无依赖关系的代码。

### 3. **延迟加载 JavaScript**

使用 `defer` 属性可以延迟加载 JavaScript 文件。与 `async` 不同的是，`defer` 脚本会在 HTML 完全解析完后再按照顺序依次执行。

```html
<script src="script.js" defer></script>
```

- **优点**：不会阻塞 HTML 解析，保证脚本按顺序执行。
- **缺点**：需要等待整个 HTML 解析完成后才执行，适合用于页面的初始化或与 DOM 操作有关的脚本。

### 4. **动态加载 JavaScript**

可以通过 JavaScript 代码动态创建 `<script>` 标签，从而加载额外的脚本。常用于懒加载或按需加载 JavaScript 文件。

```javascript
const script = document.createElement('script');
script.src = 'script.js';
document.body.appendChild(script);
```

- **优点**：灵活，可以按需加载脚本，不影响页面初始渲染。
- **缺点**：依赖 JavaScript 本身，需要确保 DOM 完全加载。

### 5. **内联 JavaScript**

JavaScript 代码可以直接写在 `<script>` 标签中，这称为内联脚本。这种方式不需要额外的 HTTP 请求，因此速度较快。

```html
<script>
  console.log('This is inline JavaScript');
</script>
```

- **优点**：减少 HTTP 请求，适合一些小的初始化逻辑。
- **缺点**：不能缓存，代码不可重用，影响可维护性和性能。

### 6. **模块化加载 JavaScript（`<script type="module">`）**

使用 `<script type="module">` 可以加载 ES6 模块。模块的加载是异步的，但它们的执行顺序是按照声明顺序来的，类似 `defer`。

```html
<script type="module" src="module.js"></script>
```

- **优点**：支持模块化开发，支持浏览器原生模块功能，异步加载，执行顺序可控。
- **缺点**：只适用于现代浏览器，且适合模块化的应用开发。

### 7. **在 `body` 末尾加载 JavaScript**

将 `<script>` 标签放在页面的 `</body>` 标签之前，这样可以确保 HTML 在加载和解析完成后再执行 JavaScript。这是一种传统的做法，效果类似于使用 `defer`。

```html
...
</body>
<script src="script.js"></script>
</html>
```

- **优点**：不会阻塞页面的内容显示，页面结构和样式优先渲染。
- **缺点**：没有异步或延迟的灵活性，属于比较老的方案。

### 8. **使用 `preload` 提前加载 JavaScript**

通过 `<link rel="preload">` 标签，可以提前加载 JavaScript 文件，但不会立即执行。等到解析到对应的 `<script>` 标签时，脚本会立即执行，因为文件已经在后台加载好了。

```html
<link rel="preload" href="script.js" as="script" />
<script src="script.js" defer></script>
```

- **优点**：减少文件下载时间，提高加载速度。
- **缺点**：需要结合 `defer` 或 `async` 一起使用。

---

### 总结

| 加载方式          | 阻塞 HTML 解析 | 执行顺序     | 适用场景                        |
| ----------------- | -------------- | ------------ | ------------------------------- |
| **同步加载**      | 阻塞           | 顺序执行     | 关键脚本，需确保执行顺序        |
| **async 加载**    | 不阻塞         | 加载完即执行 | 独立脚本，无需依赖其他脚本      |
| **defer 加载**    | 不阻塞         | 顺序执行     | 依赖 DOM 或需要按顺序执行的脚本 |
| **动态加载**      | 不阻塞         | 动态控制     | 按需加载脚本，延迟加载          |
| **内联脚本**      | 阻塞           | 顺序执行     | 小的初始化脚本                  |
| **模块化加载**    | 不阻塞         | 顺序执行     | 现代浏览器，模块化开发          |
| **body 末尾加载** | 不阻塞         | 顺序执行     | 老式方案，与 defer 类似         |
| **preload 加载**  | 不阻塞         | 顺序控制     | 提前下载资源，提升性能          |

根据项目需求和性能要求，可以选择不同的 JavaScript 加载方式来优化页面的加载速度和用户体验。如果有具体场景或问题，可以进一步探讨！
