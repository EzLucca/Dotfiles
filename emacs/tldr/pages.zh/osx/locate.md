# locate

> 快速查找文件名。
> 更多信息：<https://manned.org/locate>.

- 在数据库中查找关键字。注意：数据库定期重新更新（通常每周或每天）：

`locate "{{关键字}}"`

- 按文件名查找文件（不包含填充字符的模式被解释为 `*关键字*`）：

`locate */{{文件名}}`

- 重新建立文件数据索引数据库。如果要查找最近添加的文件，则需要执行此操作：

`sudo /usr/libexec/locate.updatedb`
