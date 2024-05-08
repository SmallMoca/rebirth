# git

git: 一个分布式的版本管理工具，支持开发人员在本地进行工作，然后姜代码改动同步到中央服务区.

## git 相对于 SVN 的优势

- 分布式，每个开发者本地都是一个完整的仓库，不需要担心服务器宕机， SVN 是集中式的版本控制器，有一个单一集中的服务器，所有人都连接到这台服务器，获取最新的文件或提交更新
- 强大的分支管理和合并系统，性能比 SVN 好，SVN 频繁的分支操会让 SVN 仓库变大，导致某些操作的性能下降，同时 SVN 对远程服务器的要求也较高。

git 的缺点：

- 学习曲线比较陡峭

### git merge（合并） 和 git rebase（变基） 的区别

gitxxxx merge 和 git reabse 命令的宗旨都是将代码改动从一个分支合并到另外一个分支，但是二者的合并方式有很大的不同。

- merge:
- rabese:

git reabse 还可以用于整理我们的 commit

## git fetch 和 git pull 的区别

- git fetch: 将远程主机的最新内容拉到本地 不会自动合并
- git pull: 将远程主机的最新内容拉下来后直接合并 即：git pull = git fetch + git merge
  用法 git pull --rebase origin main , git pull origin main 用来从主分支更新代码到版本分支

git fetch 拉取更新后会直接返回一个 FETCH_HEAD 指向的是某个 branch 在远程主机的最新状态，
使用 git log -p FETCH_HEAD 查看相关信息
