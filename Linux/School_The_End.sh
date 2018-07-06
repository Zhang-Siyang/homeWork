#Linux操作系统结课大作业 
#
#1、按需求写出配置步骤并截图: （35分）
#1.1 建立一个经理组 jl
groupadd jl
#1.2 在系统根目录下建立一个目录名为public,并切换public目录所属组为jl。
mkdir /public
chown :jl /public
#1.3 建立a, b, c 三个用户。将a,b两个用户加到jl组中。
useradd a
useradd b
useradd c
usermod -aG jl a
usermod -aG jl b
#1.4 只允许jl组中的用户读写执行public目录其他用户无权限。
chmod 070 /public
#1.5 在public目录中创建的目录或文件所属组必须为jl
chmod +s /public
#1.6 临时限制a用户对public目录写权限,允许其读与执行。该用户的其他目录权限不受影响。
chown a:jl /public -R
chmod 570 /public
#1.7 在根下创建一个str目录设置权限为所有用户读写执行，但只有所有者可以删除文件。
mkdir /str
chmod 777 /str
chmod +t /str
#
#2 按需求配置vsftpd服务器并截图: （15分）
#2.1 单独建立一个匿名用户可写的公共目录 并保留pub只读目录
#2.2 拒绝c用户登录ftp
#2.3 描述ftp主被工作模式的区别
#
#3 按需配置dns服务器 （20分）
#3.1 分别配置student.com study.com两个域名解析同一ip地址 写出配置步骤并截图
#3.2 搭建辅助dns服务器 写出配置步骤并截图
#
#4 实现LAMP web服务器，写出配置步骤并截图。（30分）
#4.1 在apache上为www.student.com www.study.com两个域名实现基于名字的虚拟主机。
#4.2 发布iwebshop 与discuz两个动态网站。
#4.3 为iwebshop站点 配置基于用户名密码的访问控制(basic)。
#4.4 为discuz站点配置一个虚拟目录 名称自定义。
