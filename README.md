# NUIST Master Thesis

南京信息工程大学硕士学位论文模板

## 文件说明

```bash
template\
    |+ logo\                    # 存放封面所需图片
    |- nuistbib.bst             # 参考文献样式，修改自南航论文模板
    |- nuistthesis.cls          # 样式文件
    |- STZhongsong.ttf          # 封面标题字体文件（华文中宋；windows系统自带，无请下载）
```

## 样例使用

准备工作

```bash
非windows系统：

git reset --hard HEAD^          # 取回字体文件
cp -r demo/. template           # 拷贝样例文件至模板文件夹


windows系统：
拷贝demo目录下所有文件至template目录下
```

## 版本日志

> * beta
> > 1. 创建论文模板，提供部分便捷接口
> > 2. 依赖CTEX模板

## 协议

本模板支持**MIT协议**条款

## 特别鸣谢

> 1. [南京航空航天大学学位论文模板](!https://github.com/nuaatug/nuaathesis)
> 2. [华南理工大学学位论文Latex/Lyx模板](!https://github.com/alwintsui/scutthesis)
> 3. [上海理工大学本科毕业设计(论文) LaTeX 模板](!https://gitee.com/MkSwQi/usstthesis)
> 4. [南京信息工程大学本科学位论文模板](!https://github.com/LirenW/NUIST_thesis_template_V2.0)
> 5. [CTEX宏集手册](!http://mirrors.ibiblio.org/CTAN/language/chinese/ctex/ctex.pdf)