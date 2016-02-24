#!/bin/sh
# eg. sh ./mkdir.sh 3 4 6
# 第一个参数 表示章节
# 第二个参数 表示小章节
# 第三个参数 表示文章数量

if [ $# -ne 3 ];then
    echo "USAGE: $0 TABNAME"
    echo " e.g.: $0 3 4 6"
    exit 1;
fi

# 章节
s=$1

# 小章节
ss=$2

# 数量
number=$3

# 判断目录是否存在
dir_name=./s"$s"

if [ ! -d "$dir_name" ];then
    mkdir "$dir_name"
fi

# 生成README.md文件
echo "# \n***" > "$dir_name"/README.md

if [ "$number" -gt 0 ];then
    # 生成章节文件
    for count in `seq $number`
    do
        if [ "$ss" -eq 0 ];then
            file_name="$dir_name"/"$s"."$count".md
        else
            file_name="$dir_name"/"$s"."$ss"."$count".md
        fi

        echo "# \n***" > "$file_name"
    done
fi

echo "OK."