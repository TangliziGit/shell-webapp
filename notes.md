1. 注意参数传递时, 引号的作用.
2. 利用带名管道可以进行进程间同步, 带名管道是阻塞读写的. 只有读写或写读后, 两个读写进程才可进入就绪态.
3. 注意`echo`默认多输出一个`\n`.
4. dispatcher原理:  
```
    首先同时启动无名管道左右的进程
    此时read pipe为空, 等待pipe内容; 同时nc等待HTTP header
    nc将header写入pipe
    read pipe中的header, 调用对应的handler, 获得response body
    计算response body大小, 并输出
```
5. 调试shell脚本, 用`bash -x xxx.sh`
6. 为了使用`Ctrl-C`退出循环, 我们需要做指令和信号的绑定`trap break INT`
