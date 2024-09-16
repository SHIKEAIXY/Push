# 刷Git提交记录脚本

## 使用：

### 1.克隆脚本

#### 通过gitee

```
git clone --depth=1 --single-branch https://gitee.com/SHIKEAIXY/Push /root/Push
```

#### 通过github

```
git clone --depth=1 --single-branch https://github.com/SHIKEAIXY/Push /root/Push
```

### 2.打开`/root/Push/Push.sh`修改1~4配置项

 - 5与6配置无需修改

### 3.运行

```
cd /root/Push/ && screen -R Git
```
```
chmod +x /root/Push/Push.sh && ./Push
```