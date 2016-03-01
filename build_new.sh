#!/bin/sh
# eg. sh ./build_new.sh

base_dir=$(cd "$(dirname "$0")";pwd)

run_script_name="supertouch $base_dir/%s && echo \"# %s\\\n***\" > $base_dir/%s \n";

supertouch() {
    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

export -f supertouch

awk -v vals="$run_script_name" 'BEGIN{
    FS="[][]";
}
{
    if(NF>1){
        gsub(/\(/,"",$3);
        gsub(/\)/,"",$3);
        if($3 ~ /^s[0-9]/){
            system(sprintf(vals,$3,$2,$3));
        }
    }
}' SUMMARY.md

echo "OK."