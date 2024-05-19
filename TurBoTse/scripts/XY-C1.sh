#####################################################################
# cd /opt/rt-n56u/trunk 执行在这个目录下
#
# 修改默认参数（不同设备拷贝到相应 *.sh)          by: TurBoTse
#####################################################################

lan_ip="192.168.2"                          # LAN 地址 别写后面的 .1
default_path="./user/shared"                # 默认配置路径
config="./configs/templates/XY-C1.config"     # 默认配置文件
user_name="Ferdavis"                        # 用户名
user_password="SXYsxy1914"                  # 登录密码 
version_time=$(date +%Y%m%d)                # 更新时版本号时间: 20210101

echo "修改 LAN IP 地址"
sed -i "s/192.168.2/$lan_ip/g" $default_path/defaults.h

echo "设置为PPPOE模式并写入账号和密码"
sed -i 's/{ "wan_proto", "dhcp" }/{ "wan_proto", "pppoe" }/g' $default_path/defaults.c
sed -i 's/{ "wan_pppoe_username", "" }/{ "wan_pppoe_username", "t632f6329079" }/g' $default_path/defaults.c
sed -i 's/{ "wan_pppoe_passwd", "" }/{ "wan_pppoe_passwd", "123123" }/g' $default_path/defaults.c

echo "修改用户名"
sed -i 's/SYS_USER_ROOT		"admin"/SYS_USER_ROOT		"'$user_name'"/g' $default_file

echo "修改登陆密码"
sed -i 's/DEF_ROOT_PASSWORD	"admin"/DEF_ROOT_PASSWORD	"'$user_password'"/g' $default_file

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc
