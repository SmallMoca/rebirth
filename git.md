# git

git: 一个分布式的版本管理工具，支持开发人员在本地进行工作，然后将代码改动同步到远程主机.

## git 相对于 SVN 的优势

- 分布式，每个开发者本地都是一个完整的仓库，不需要担心远程主机宕机， SVN 是集中式的版本控制器，有一个单一集中的服务器，所有人都连接到这台服务器，获取最新的文件或提交更新
- 强大的分支管理和合并系统，性能比 SVN 好，SVN 频繁的分支操会让 SVN 仓库变大，导致某些操作的性能下降，同时 SVN 对远程服务器的要求也较高。

git 的缺点：

- 学习曲线比较陡峭

### git merge（合并） 和 git rebase（变基） 的区别

gitxxxx merge 和 git reabse 命令的宗旨都是将代码改动从一个分支合并到另外一个分支，但是二者的合并方式有很大的不同。

- merge: 使用 merge 方式合并代码 对现有分支是一种非破坏性的操作，现有分支不会有任何形式的更改，同时也避免了使用 rebase 的一些潜在缺陷。但是另一方面使用 merge 来从主分支跟新代码到 feature 时会产生一个额外的 merge commit。 如果主分支跟新非常活跃，可能会污染 feature 的 commit 记录

- rabase:rebase 也叫变基，reabse 会修改现有分支的历史记录，如果使用 rebase 从 master 分支更新代码到 feature 分支， rebase 不会产生额外的 merge commit，但是会将整个 feature 分支的 commit 移动到 master 分支的顶端，reabse 会为 feature 的每个新的提交创建新的 commit 来重写 commit 历史记录

git rebase 黄金法则
git rebase 在工作中的常见用法

git reabse 还可以用于整理我们的 commit

## git fetch 和 git pull 的区别。

- git fetch: 将远程主机的最新内容拉到本地 不会自动合并
- git pull: 将远程主机的最新内容拉下来后直接合并 即：git pull = git fetch + git merge
  用法 git pull --rebase origin main , git pull origin main 用来从主分支更新代码到版本分支

git fetch 拉取更新后会直接返回一个 FETCH_HEAD 指向的是某个 branch 在远程主机的最新状态，
使用 git log -p FETCH_HEAD 查看相关信息
