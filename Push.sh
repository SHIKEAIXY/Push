#!/bin/bash

###############################################################
###############################################################
###############################################################

# 配置相关

## 1.Git配置，邮箱+用户名（用于提交所显示的账户）
YouXiang='"XXX@XX.com"'
YongHuMing='"XXX"'

## 2. Git仓库URL配置（私库需要https://用户名:密码@gitee.com/xxx/xxx 或者 https://令牌@github.com/xxx/xxx）
GitURL='https://github.com/xxx/xxx'

## 3. 循环次数配置（默认0为无限循环）
CiShu=0

## 4. 循环间隔（默认1小时） 指：脚本执行间隔
time='1h' # 结尾s或无：秒，结尾h：小时

## 5. 脚本路径

LuJing='/root/Push'

### 6. 初始化次数统计变量（默认计数0开始）
count=0

###############################################################
###############################################################
###############################################################

# 颜色
Hong='\033[0;31m'  # 红色
RESET_COLOR='\033[0m'  # 恢复颜色

if [ "$CiShu" -eq 0 ]; then
    while true; do
        # 使用 grep 和 awk 来获取 Push 的值
        current_value=$(grep 'Push:' Push.yaml | awk '{print $2}')

        if [ "$current_value" == "1" ]; then
            new_value="2"
        elif [ "$current_value" == "2" ]; then
            new_value="1"
        else
            echo "Push值无效: $current_value"
            exit 1
        fi

        # 使用 sed 来替换 Push 的值
        sed -i "s/Push: $current_value/Push: $new_value/" Push.yaml

        if cd ${LuJing} && git rev-parse --git-dir > /dev/null 2>&1; then
            git add . > /dev/null 2>&1
            git commit -m "细节优化" > /dev/null 2>&1
            git push origin master -f > /dev/null 2>&1
        else
            cd ${LuJing}
            git config --global user.email ${YouXiang}
            git config --global user.name ${YongHuMing}
            git init > /dev/null 2>&1
            git remote add origin $GitURL > /dev/null 2>&1
            git checkout -b master > /dev/null 2>&1
            git add . > /dev/null 2>&1
            git commit -m "细节优化" > /dev/null 2>&1
            git push origin master -f > /dev/null 2>&1
        fi
        echo -e "${Hong}刷Git提交完成 [$((count+=1))]${RESET_COLOR}"
        sleep ${time}
    done
else

    for ((i=1; i<=CiShu; i++)); do
        # 使用 grep 和 awk 来获取 Push 的值
        current_value=$(grep 'Push:' Push.yaml | awk '{print $2}')

        if [ "$current_value" == "1" ]; then
            new_value="2"
        elif [ "$current_value" == "2" ]; then
            new_value="1"
        else
            echo "Push值无效: $current_value"
            exit 1
        fi

        # 使用 sed 来替换 Push 的值
        sed -i "s/Push: $current_value/Push: $new_value/" Push.yaml

        if cd ${LuJing} && git rev-parse --git-dir > /dev/null 2>&1; then
            git add . > /dev/null 2>&1
            git commit -m "细节优化" > /dev/null 2>&1
            git push origin master -f > /dev/null 2>&1
        else
            cd ${LuJing}
            git config --global user.email ${YouXiang}
            git config --global user.name ${YongHuMing}
            git init > /dev/null 2>&1
            git remote add origin $GitURL > /dev/null 2>&1
            git checkout -b master > /dev/null 2>&1
            git add . > /dev/null 2>&1
            git commit -m "细节优化" > /dev/null 2>&1
            git push origin master -f > /dev/null 2>&1
        fi
        echo -e "${Hong}刷Git提交完成 [$((count+=1))]${RESET_COLOR}"
        sleep ${time}
    done
fi