#!/bin/bash

# 定义基本路径
base_path="/mnt/disk2/liwei/01-code/MissCG/anon/jelly"
node_path="/mnt/disk2/liwei/01-code/jelly/lib/main.js"
source_base="/mnt/disk2/liwei/01-code/MissCG/anon/todomvc-master/examples"

# 进入指定目录
cd $base_path

# 项目名称数组
projects=("angularjs" "backbone" "canjs" "jquery" "knockback" "knockoutjs" "mithril" "react" "vanillajs" "vue")

# 循环创建文件夹并执行命令
for project in ${projects[@]}; do
    # 创建文件夹
    mkdir "todo_$project"

    # 执行node命令
    node $node_path -j "$base_path/todo_$project/SCG.json" "$source_base/$project/"
done

echo "脚本执行完毕！"