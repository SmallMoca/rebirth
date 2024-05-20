# git 常见操作

## 撤销操作

**撤销暂存区操作**

```bash
# 取消暂存区 src/a.js
git reset HEAD src/a.js
# 取消暂存区 src/a.js src/b.js
git reset HEAD src/a.js src/b.js
# 取消暂存区 所有文件
git reset HEAD .
```

`git reset` 命令不加上 --hard 选项是没有危险的
