安装说明:

dockerfile文件会根据环境复制对应的config.env.json到根目录.然后重命名为config.json

由于config.json中已经填好了uri.所以需要提前在对应的nodebb中复制数据<
因为nodebb判定配置文件中有mongouri的时候说明之前已经初始化数据到DB里面了>.

此处也可以直接把不同环境的config.json通过-v映射到存储卷里面. 但是由于freelog forum需要安装自己的插件,所以没有使用官方镜像.顺便就把配置文件一起内置了.

## 关于本地调试

1.由于windows系统下本项目无法启动,所以目前是放在linux中做的测试.
2.复制config.local.json到根目录,改名为config.json
3.npm install
4.执行./nodebb setup构建程序
5.执行./nodebb dev以开发模式启动