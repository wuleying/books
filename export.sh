#!/bin/sh
# eg. sh ./export.sh

base_dir=$(cd "$(dirname "$0")";pwd)

target_dir=~/Desktop/book_tmp

# 创建临时目录
if [ ! -d $target_dir ]; then
    mkdir $target_dir
fi

# 遍历项目目录
for dir in `ls`
do
    if [[ -d "$dir" && "$dir" != "tmp" ]]; then
        file_path=$base_dir/$dir/_book/

        if [ -d "$file_path" ]; then
            # 导出地址
            target=$target_dir/$(echo $dir | tr '[A-Z]' '[a-z]')

            # 拷贝文件
            cp -vr $file_path $target
        fi

    fi
done

cd $target_dir;
pwd;

#删除shell脚本文件
rm `find . -name *.sh`;

echo "OK."

