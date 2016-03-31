# 14 进程间通信
***

&emsp;&emsp;
Unix 系统下的 IPC (Inteprocess Communication) 主要分为下面这几种：

+ pipe
+ FIFO (First Input First Output)
+ 消息队列
+ 信号量
+ 共享存储
+ UDS (Unix Domain Socket)
+ 套接字 (Socket)

&emsp;&emsp;
套接字可以跨机器进程通信，而前面几类都是单机进程之间通信。
套接字有专门一节用于说明，这节仅仅说前面几类单机进程通信手段，Unix Domain Socket 也属于套接字范围，所以在这里没有单独叙述。