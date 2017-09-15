#! /bin/sh
# 从mac微信客户端中抓取表情到桌面
# @author asiareal

# 目标为桌面的pkg文件夹
dist=~/Desktop/pkg

# 微信path
from=~/Library/Containers/com.tencent.xinWeChat/Data/Library/"Application Support"/com.tencent.xinWeChat/2.0b4.0.9

cd "$from"

for d in $(ls -d */)
do
    cd $d
    if [ ! -d "Stickers" ]
    then
        cd .. # 没有就返回上层目录
        echo '不在这里 :-( '
    else
        cd Stickers/File
        echo '找到了 (＾－＾)V'
        break # 结束循环
    fi
done

echo '正在复制到桌面...'
cp -r ./ $dist
cd $dist

echo '正在帮你批量修改后缀...'

for f in $(ls .)
do
    mv $f $f.gif
done

echo '搞完了ヽ(^o^)丿'

open .

