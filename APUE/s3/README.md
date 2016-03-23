# 3 文件 IO
***

&emsp;&emsp;
文件 IO 通常只需要用到下面 5 个函数：

+ open
+ read
+ write
+ lseek
+ close

&emsp;&emsp;
read/write 是不带缓冲的 IO，因为它们直接进行系统调用而不在用户态进行缓冲。
相对应的是标准 IO，标准 IO 在用户态进行了数据缓冲。
不带缓冲 IO 不是 ISO C 的组成部分，它是 POSIX 和 SUS 的组成部分。

&emsp;&emsp;
文件 IO 操作的对象是文件描述符，这是一个非负整数。
通常系统会使用 0、1、2 来作为进程的标准输入、输出和错误。
但最好不要依赖这个行为，而使用：

    #include <unistd.h>
    #define STDIN_FILENO    0
    #define STDOUT_FILENO   1
    #define STDERR_FILENO   2

&emsp;&emsp;
同时需要注意进程打开的文件描述符是存在上限的，可以通过 sysconf 得到。