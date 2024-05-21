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

**取消一个 commit**

```bash
git reset --soft HEAD^ # 撤销最近一次提交 --soft 选项不危险的的 撤销的爱相关commit的 改动会保留在工作目录
git reset --soft HEAD^3 # 撤销最近三次提交
git reset --hard HEAD^ # --hard 危险的 会将工作目录 和暂存区的所有改动丢弃,完全回到HEAD的新位置
```

`--hard` 是危险的操作，会丢弃所有未提交的更改 ，使用的时候要特别小心

## git 远程分支

```bash
# 查看远程仓库信息
git remote
# 查看远程仓库 更详细信息
git remote
# 查看所有分支的信息 包括本地分支和远程分支
git branch -a -v
# 查看远程分支的信息
git branch -r -v
```
