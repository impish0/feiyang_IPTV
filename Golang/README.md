# **使用说明：**  
## 一、推荐使用Docker一键运行，并配置watchtower监听Docker镜像更新，直接一劳永逸：
### 1，使用Docker一键配置allinone
```
docker run -d --restart unless-stopped --privileged=true -p 35455:35455 --name allinone youshandefeiyang/allinone
```
### 2，一键配置watchtower每天凌晨两点自动监听allinone镜像更新，同步GitHub仓库：
```
docker run -d --name watchtower --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock  containrrr/watchtower -c  --schedule "0 0 2 * * *"
```
## 二、直接运行：
首先去action中下载对应平台二进制执行文件，然后解压并直接执行
```
chmod 777 allinone && ./allinone
```
建议搭配进程守护工具进行使用，windows直接双击运行！
## 三、详细使用方法
## **抖音：**
### 1，抖音手机客户端进入直播间后，点击右下角三个点，点击分享，点击复制链接，然后运行并访问：
```
http://你的IP:35455/douyin?url=https://v.douyin.com/xxxxxx(&quality=xxxx)
```
其中&quality参数默认origin原画，可以省略，也可以手动指定：uhd、origin、hd、sd、ld
### 2，抖音电脑端需要打开抖音网页版复制`(live.douyin.com/)xxxxxx`，只需要复制后面的xxxxx即可：
```
http://你的IP:35455/douyin/xxxxx
```
## **斗鱼：**
### 1，可选m3u8和flv两种流媒体传输方式【`(www.douyu.com/)xxxxxx 或 (www.douyu.com/xx/xx?rid=)xxxxxx`，默认m3u8兼容性好】：
```
http://你的IP:35455/douyu/xxxxx
```
### 2，选择flv时可选择不同cdn（需要加`stream`和`cdn`参数，不加参数默认`hls`和`akm-tct.douyucdn.cn`）
```
http://你的IP:35455/douyu/xxxxx(?stream=flv&cdn=ws-tct)
```
## **BiliBili`(live.bilibili.com/)xxxxxx`：**
### 1，平台platform参数选择（默认web，如果有问题，可以切换h5平台）：
```
"web"   => "桌面端"
"h5"    => "h5端"
```
### 2，线路line参数选择（默认线路二，如果卡顿/看不了，请切换线路一或者三，一般直播间只会提供两条线路，所以建议线路一/二之间切换）：
```
"first"  => "线路一"
"second" => "线路二"
"third"  => "线路三"
```
### 3，画质quality参数选择（默认原画，可以看什么画质去直播间看看，能选什么画质就能加什么参数，参数错误一定不能播放）：
```
"30000" => "杜比"
"20000" => "4K"
"10000" => "原画"
"400"   => "蓝光"
"250"   => "超清"
"150"   => "高清"
"80"    => "流畅"
```
### 4，最后的代理链接示例：
```
http://你的IP:35455/bilibili/xxxxxx(?platform=h5&line=first&quality=10000)
```
## **虎牙`(huya.com/)xxxxxx`：**
```
http://你的IP:35455/huya/xxxxx
```
## **YouTube:**
```
https://www.youtube.com/watch?v=cK4LemjoFd0
Rid: cK4LemjoFd0
http://你的IP:35455/youtube/cK4LemjoFd0(?quality=1080/720...)
```
## 更多平台后续会酌情添加