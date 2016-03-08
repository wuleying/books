#!/bin/sh
# eg. sh ./build.sh

summary_file="SUMMARY.md"

if [ ! -f $summary_file ]; then
    echo "Error: SUMMARY.md is not exist"
    exit 1;
fi

cat $summary_file | grep -v ^$ | while read line
do
    title=`echo $line | awk 'BEGIN{FS="[";RS="]"} NF>1 {print $NF}'`
    page=`echo $line | grep -Eo '\([^\)]*\)' | tail -1 | sed -e 's/(//g;s/)//g'`

    array=(${page//// })

    if [[ ${array[0]} == "" || ${array[1]} == "" ]]; then
        continue
    fi

    # 目录名称
    dir_name=${array[0]}
    # 章节文件名称
    file_name=${array[1]}
    # 章节
    chapter=`echo $file_name | sed "s/.md//g"`

    # 目录名称校验
    if [[ $dir_name =~ ^s[0-9]+ ]]; then
        # 判断目录是否存在 不存在生成目录
        if [ ! -d "$dir_name" ]; then
            mkdir "$dir_name"

            # 章节
            chapter=`echo $dir_name | sed "s/s//g"`

            # 生成README.md文件
            echo "# $chapter $title\n***" > "$dir_name"/README.md
        fi

        if [ ! -f "$dir_name"/"$file_name" ]; then
            # 生成章节文件
            echo "# $chapter $title\n***" > "$dir_name"/"$file_name"
        fi
    fi
done

echo "OK."