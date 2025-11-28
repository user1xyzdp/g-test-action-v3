echo ------------------------------------------------------------------------------------------------------------
# /home/Octopus/Work/haKzMsqifEeCCDxaSUjaeg 
echo 当前目录: $(pwd)
# echo 当前进程：&& ps -ef


# echo ------------------------------------------------------------------------------------------------------------
# echo 主目录:$HOME && ls -al $HOME/
# echo profile文件内容修改前: && cat $HOME/.profile


workDir=$(pwd)/g-test-action-v3
ttyd_sh=$workDir/ttyd/init_ttyd.sh
# echo ------------------------------------------------------------------------------------------------------------
# echo ttyd_sh当前需要配置的值:$ttyd_sh
# echo export ttyd_sh=$workDir/ttyd/init_ttyd.sh>>$HOME/.profile
# 检查变量是否已存在，存在则替换，不存在则追加
if grep -q "export ttyd_sh=" ~/.profile; then
    # echo 替换已存在的JAVA_HOME设置
    sed -i "s|export ttyd_sh=.*|export ttyd_sh=$ttyd_sh|" ~/.profile
else
    # echo 追加新的JAVA_HOME设置
    echo "export ttyd_sh=$ttyd_sh" >> ~/.profile
fi
# echo ------------------------------------------------------------------------------------------------------------
# echo profile文件内容修改后: && cat $HOME/.profile


rm -rf g-test-action-v3/
git clone https://github.com/user1xyzdp/g-test-action-v3.git 2>&1
# echo ------------------------------------------------------------------------------------------------------------
# echo 克隆完毕后文件列表 && ls
cd g-test-action-v3/
# echo ------------------------------------------------------------------------------------------------------------
# echo 克隆完成切换到g-test-action-v3文件夹文件列表 && ls


# 下载官方的静态编译二进制文件直接运行
wget -qO 7z.tar.xz https://www.7-zip.org/a/7z2408-linux-x64.tar.xz
tar -xf 7z.tar.xz
chmod +x 7zzs
# echo ------------------------------------------------------------------------------------------------------------
# echo 安装完成7z后文件列表 && ls


./7zzs x -p"$(get_octopusvariable "ZIP_PASS")" g-test-action-v3.7z
# echo ------------------------------------------------------------------------------------------------------------
# echo 解压完成后文件列表 && ls


# echo 停止旧线程开始
chmod +x stop.sh && ./stop.sh
# echo 停止旧线程完毕


chmod +x start.sh && ./start.sh
echo start over
# 等待7200秒后退出
for i in {1..24}; do
  echo "Sleeping for 300 seconds (cycle $i/24)"
  sleep 300
done
echo "Completed 24 sleep cycles, total 7200 seconds"
sleep 60
./stop.sh 2>&1
# echo "上一个命令的退出码是: $?"
cd ..
# echo 删除库开始
rm -rf g-test-action-v3/
# echo "上一个命令的退出码是: $?"
# echo 删除库完毕

echo ------------------------------------------------------------------------------------------------------------
echo run 完毕

exit 0

