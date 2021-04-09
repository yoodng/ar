# ar
建 database ar
检查 ./ar-parent/ar-portal/src/main/resources/config.properties

门户网站： 访问地址: http://localhost:8080/ar_portal_war/index.action
用户名/密码: 123/12345678
后台管理： 访问地址: http://localhost:8080/ar_portal_war/manage.action 
用户名/密码: admin/12345678

### 导入工程（推荐IDEA）
1.安装Maven...
2.在IDEA中配置Maven，jdk
3.导入Maven项目，等待maven依赖项下载...
4.在IDEA中配置Tomcat8.0
5.修改项目中的数据库配置 ./ar-parent/ar-portal/src/main/resources/config.properties
``` xml
jdbc.driver=com.mysql.jdbc.Driver
# 数据库地址
jdbc.url=jdbc:mysql://localhost/ar?characterEncoding=utf8
# 数据库用户名密码
jdbc.username=root
jdbc.password=root

```

### 项目构建
执行ar-common模块下的maven clean 以及 maven install
ar-common生成jar 安装在本地，ar-manage和ar-portal依赖此库。

### 项目部署
运行 ar-portal:war exploded。

门户网站：
访问地址: http://localhost:8080/ar_portal/login.action
用户名/密码: black/12345678

后台管理：
访问地址: http://localhost:8080/ar-portal/manage.action
用户名/密码: sa/12345678

### 项目打包

可以使用命令行打包war，打包的war在ar-portal/target下：
```cmd
mvn clean && mvn install && mvn package
```