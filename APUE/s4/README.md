# 4 文件和目录
***

&emsp;&emsp;
上一章主要是围绕文件系统 IO 来展开的，而这章主要说明文件系统的其他特征和文件的性质 (文件属性)。
在说明文件属性之前先看看有哪些属性是需要被讨论的。

&emsp;&emsp;
获取一个文件属性可以使用下面几个函数：

    stat(const char* restrict pathname, struct stat* restrict buf);
    fstat(int fd, struct stat* restrict buf);
    lstat(const char* restrict pathname, struct stat* restrict buf);

&emsp;&emsp;
lstat 和 stat 区别是：lstat 用来获取软链接文件属性。

    struct stat {
        mode_t      st_mode;      // 文件类型和访问权限
        ino_t       st_ino;       // inode 编号
        dev_t       st_dev;       // 设备号 (对文件系统)
        dev_t       st_rdev;      // 设备号 (对特殊文件)
        nlink_t     st_nlink;     // 链接数目
        uid_t       st_uid;       // 文件所有者 uid
        gid_t       st_gid;       // 文件所有者 gid
        off_t       st_size;      // 文件大小
        time_t      st_atime;     // access time
        time_t      st_mtime;     // modification time
        time_t      st_ctime;     // 属性最近一次 change time
        blksize_t   st_blksize;   // block size
        blkcnt_t    st_blocks;    // blocks
    };