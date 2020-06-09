# NUIST Master Thesis

南京信息工程大学硕士学位论文模板

## 特别说明

这是一份不够稳定的论文模板

## 文件说明

```bash
template\
    |+ logo\                    # 存放封面所需图片
    |- nuistbib.bst             # 参考文献样式，修改自南航论文模板
    |- nuistthesis.cls          # 样式文件
    |- STZhongsong.ttf          # 封面标题字体文件（华文中宋；windows系统自带，无请下载）
    |- contentsappend.txt       # contentsappend开启时，该部分内容附加至目录尾部
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

> * v0.1.1
> > 1. 修正关键字显示
> > 2. 修正章节号格式
> > 3. 修正书签显示
> > 4. 修正参考文献格式
> > 5. 增加appendixtoc命令，控制隐藏目录中附录section
> > 6. 增加thankschapter命令，防止忘记取消盲审时致谢部分注释
> > 7. 增加abstracttocontents命令，目录中显示摘要页码
> > 8. 增加contentsappend命令，可在目录中显示附加信息，如缩写索引
> > 9. ~~增加盲审时，material不显示的功能~~（不存在的，依旧会显示）
> * v0.1
> > 1. 修正图表上下间距
> > 2. 修正参考文献格式及行间距
> > 3. 修正目录中参考文献页码显示错误
> > 4. 修正ref{subsubsection}引用格式，为'小节号-子节号'
> > 5. 全文公式使用displaystyle
> > 6. 增加subsecref命令，引用原始小节号
> > 7. 增加appendixrenewenv与appdeixchaper命令，可选附录形式
> > 8. 增加盲审时，material不显示的功能
> > 9. 增加subsubsection，设为大写字母
> > 10. 使用subfig替换subfigure包，添加subfigure命令（等同subfloat）
> > 11. 已知图标目录内引用参考文献，二次编译之后其编号会前移（移除lot lof等文件可解决）
> > 12. 已知图片底部空行较大
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