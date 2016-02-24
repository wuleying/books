#!/bin/sh
# eg. sh ./build.sh

cat SUMMARY.md | grep -v ^$ | while read line
do
    title=`echo $line | cut -d '[' -f2|cut -d ']' -f1`
    page=`echo $line | awk 'BEGIN{FS="(";RS=")"} NF=2 {print $NF}'`

    # 修改字符串分隔符
    OLD_IFS="$IFS"
    IFS="/"

    array=($page)

    # 将字符串分隔符恢复
    IFS="$OLD_IFS"

    # 目录名称
    dir_name=${array[0]}
    # 章节文件名称
    file_name=${array[1]}

    # 目录名称校验
    if [[ $dir_name =~ ^s[0-9]+ ]];then
        # 判断目录是否存在 不存在生成目录
        if [ ! -d "$dir_name" ];then
            mkdir "$dir_name"

            # 生成README.md文件
            echo "# $title\n***" > "$dir_name"/README.md
        fi

        # 生成章节文件
        echo "# $title\n***" > "$dir_name"/"$file_name"
    fi
done

echo "OK."


#i=0
#j=0
#title=()
#
## 获取文章标题
#for title_row in $(awk 'BEGIN{FS="[";RS="]"} NF>1 {print $NF}' SUMMARY.md)
#do
#    title[$i]=$title_row
#
#    echo $title_row
#
#    i=$[$i+1]
#done
#
#exit
#
## 修改字符串分隔符
#OLD_IFS="$IFS"
#IFS="/"
#
## 获取文章章节
#awk 'BEGIN{FS="(";RS=")"} NF>1 {print $NF}' SUMMARY.md | while read row
#do
#    array=($row)
#
#    # 目录名称
#    dir_name=${array[0]}
#    # 章节文件名称
#    file_name=${array[1]}
#
#    # 目录名称校验
#    if [[ $dir_name =~ s[0-9]+ ]];then
#        # 判断目录是否存在 不存在生成目录
#        if [ ! -d "$dir_name" ];then
#            mkdir "$dir_name"
#
#            # 生成README.md文件
#            echo "# ${title[$j]}\n***" > "$dir_name"/README.md
#
#            j=$[$j+1]
#        fi
#
#        # 生成章节文件
#        echo "# ${title[$j]}\n***" > "$dir_name"/"$file_name"
#
#        j=$[$j+1]
#    fi
#done
#
## 将字符串分隔符恢复
#IFS="$OLD_IFS"