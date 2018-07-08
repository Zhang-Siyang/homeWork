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
#apt install vsftpd
#2.1 单独建立一个匿名用户可写的公共目录 并保留pub只读目录
cat << EOF |sudo tee /etc/vsftpd.conf 1>/dev/null
listen=YES
write_enable=YES
anonymous_enable=YES
anon_root=/var/ftp/
anon_mkdir_write_enable=YES
anon_upload_enable=YES
local_enable=NO
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
ssl_enable=NO
utf8_filesystem=YES
EOF
sudo rm /var/ftp -r
sudo mkdir /var/ftp/pub -p
sudo mkdir /var/ftp/exam
sudo chown nobody:nogroup /var/ftp -R
sudo chown ftp:ftp /var/ftp/pub /var/ftp/exam
#2.2 拒绝c用户登录ftp
cat /etc/vsftpd.conf|sed -E 's/(^.*local_enable=)/#\1/'|sudo tee /etc/vsftpd.conf 1>/dev/null
echo "local_enable=NO"|sudo tee /etc/vsftpd.conf 1>dev/null
#2.3 描述ftp主被工作模式的区别
# https://www.google.com
#3 按需配置dns服务器 （20分）
#3.1 分别配置student.com study.com两个域名解析同一ip地址 写出配置步骤并截图
# https://github.com/bronze1man/it-summary/blob/master/dns/bind9/%E6%B7%BB%E5%8A%A0%E5%9F%9F%E5%90%8D%E8%A7%A3%E6%9E%90%E8%AE%B0%E5%BD%95.md
#3.2 搭建辅助dns服务器 写出配置步骤并截图
echo "没看懂题……"
#
#4 实现LAMP web服务器，写出配置步骤并截图。（30分）
#4.1 在apache上为www.student.com www.study.com两个域名实现基于名字的虚拟主机。
# 1. 在 /etc/apache2/site-enable/ 新建对应 conf 文件，内容大致如下:
cat << EOF
<VirtualHost *:80>
    ServerName www.student.com
    DocumentRoot /var/www/student
</VirtualHost>
EOF
echo "解析过来就可以"
#4.2 发布iwebshop 与discuz两个动态网站。
echo "解包"
#4.3 为iwebshop站点 配置基于用户名密码的访问控制(basic)。
echo "啥啥啥？"
#4.4 为discuz站点配置一个虚拟目录 名称自定义。
echo "没看懂"
