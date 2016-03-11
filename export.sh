#!/bin/sh
# eg. sh ./export.sh

base_dir=$(cd "$(dirname "$0")";pwd)

# 创建临时目录
if [ ! -d $base_dir/tmp ]; then
    mkdir $base_dir/tmp
fi

# 遍历项目目录
for dir in `ls`
do
    if [[ -d "$dir" && "$dir" != "tmp" ]]; then
        file_path=$base_dir/$dir/_book/

        if [ -d "$file_path" ]; then
            # 导出地址
            target=$base_dir/tmp/$(echo $dir | tr '[A-Z]' '[a-z]')

            # 拷贝文件
            cp -vr $file_path $target
        fi

    fi
done

echo "OK."

