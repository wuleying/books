#!/bin/sh

#章节
s=14

#小章节
ss=3

#数量
number=4

for count in `seq $number`
do
    touch ./s$s/$s.$ss.$count.md
done