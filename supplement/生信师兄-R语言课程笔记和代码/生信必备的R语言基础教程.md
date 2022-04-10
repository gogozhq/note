# 生信必备技巧之R语言基础教程

## 1. 学习资源

- **推荐书籍**：R语言实战，R数据科学等等；

  这两本书在公众号【生信师兄】都有pdf版，有需要的可以关注公众号【生信师兄】并回复：“R语言”，即可获得免费电子版书籍。

- **遇见bug怎么办**
  
  - R语言初学者必备-cheatsheet大全：https://www.rstudio.com/resources/cheatsheets/
  
  - R语言菜鸟教程：https://www.runoob.com/r/r-tutorial.html
  
  - 简书、知乎等各大平台都会提供很多生信分析常见的教程，一定要利用好这些资源；
  
  - 报错怎么办：度娘来帮忙；一定要学会百度！一定要学会百度！一定要学会百度！
  
    

## 2. 了解并安装R, Rstudio 及R包

- 下载R语言的软件: https://cran.r-project.org/bin

- 下载Rstudio这个R编辑器: https://www.rstudio.com/products/rstudio/download/

- 安装**一些必要的包**：

  - 什么是R包：包是 R 函数、实例数据、预编译代码的集合，包括 R 程序，注释文档、实例、测试数据等；

  - 安装包 install.packages(" xxxxxx ")

    对于生物信息学常用的包，可以使用：BiocManager::install("xxxx")函数进行安装

  - 加载包 library( xxxxx ) 

  - 查看包的帮助文档help("xxxxx") 或?xxxxx

```R
# 生物信息学分析必备的一些R包，复制以下代码，直接运行即可；
rm(list = ls())
# 设置镜像：
options()$repos
options()$BioC_mirror
#options(BioC_mirror="https://mirrors.ustc.edu.cn/bioc/")
options(BioC_mirror="http://mirrors.tuna.tsinghua.edu.cn/bioconductor/")
options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
options()$repos
options()$BioC_mirror

# 方法一：
options()$repos
install.packages('WGCNA')
install.packages(c("FactoMineR", "factoextra"))
install.packages(c("ggplot2", "pheatmap","ggpubr"))
library("FactoMineR")
library("factoextra")

# 方法二：
if (!requireNamespace("BiocManager", quietly = TRUE))
 install.packages("BiocManager")
BiocManager::install("KEGG.db",ask = F,update = F)
BiocManager::install(c("GSEABase","GSVA","clusterProfiler" ),ask = F,update = F)
BiocManager::install(c("GEOquery","limma","impute" ),ask = F,update = F)
BiocManager::install(c("org.Hs.eg.db","hgu133plus2.db" ),ask = F,update = F)

# 方法三：从github中安装

# 所有的R包都提交上传到CRAN，如Github，需要通过一定的渠道进行安装
# R安装devtools包
install.packages("devtools")
library(devtools)
# 安装github上的R包（需翻墙或改hosts）
devtools::install_github('lchiffon/REmap')
# 前为github的用户名，后为包名

# 测试--加载R包；
library(REmap)
library(GSEABase)
library(GSVA)
library(clusterProfiler)
library(ggplot2)
library(ggpubr)
library(hgu133plus2.db)
library(limma)
library(org.Hs.eg.db)
library(pheatmap)
```

- 获取当前工作区间getwd() 

- 更改工作区间setwd( "xxxxxx") 

- 清除当前对象rm(xx)

  

## 3. 数据类型和数据结构

1. **数据类型**：数据类型指的是用于声明不同类型的变量或函数的一个广泛的系统。变量的类型决定了变量存储占用的空间，以及如何解释存储的位模式；
   - R 语言中的最基本数据类型主要有三种：
     - 数字
     - 逻辑
     - 文本

```R
a = 1
b <- TRUE
d = "abc"

class(a)
class(b)
class(d)
```

​		

2. **数据结构**：

   *R拥有许多用于存储数据的对象类型,包括标量、向量、矩阵、数组、数据框和列表。它们在存储数据的类型、创建方式、结构复杂度,以及用于定位和访问其中个别元素的标记等方面均有所不同。图2-1给出了这些数据结构的一个示意图。*

<img src="/Users/xufeng/Library/Application Support/typora-user-images/image-20210331160859118.png" alt="image-20210331160859118" style="zoom: 50%;" />

- **向量：**

  - ```R
    a <- c(1,2,5,3,6,-2,4)
    b <- c("one", "two", "three")
    d <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)
    
    # 由于R中内置了同名函数c(),最好不要在编码时使用c作为对象名,否则可能产生一些不易察觉的问题。
    ```

    *这里：a是数值型向量，b是字符型向量，而c是逻辑型向量。
    注意：单个向量中的数据必须拥有相同的类型或模式(数值型、字符型或逻辑型) 。同一向量中无法混杂不同模式的数据。*

    

  - 与向量相关的常用操作：

    ```R
    # 快速创建连续数列：
    a <- c(1:10)
    
    # seq函数创建数列：
    a <- seq(1,10,2)  # seq(from = value1 ,to = value2 , by = step)
    
    # 重复函数rep：
    rep(x，times = value1) # 即表示将x重复value1次。
    ```

    

  - 访问向量中的元素：

    - 通过在方括号中给定元素所处位置的数值, 我们可以访问向量中的元素。 

      *例如, a[c(2, 4)] 用于访问向量a中的第二个和第四个元素。*

    ```R
    a <- c(1,2,5,3,6,-2,4)
    
    a[3]
    
    a[c(1,3,4)]
    
    a[2:6]
    ```

  - 修改向量中的元素：

    ```R
    # 创建向量
    x <- c(1,2,24)
    x
    
    # 修改向量中的元素
    x[c(1,3)] <- c(23,43)
    x
    
    # 负号表示删除元素
    x <- c(1:10)
    x[-(1:5)]
    ```

  - 进阶：

    - 字符型元素即用双引号括起来的元素，如"beautiful",“handsome”,“er”,诸如此类，这里我们主要讲一个paste函数，将字符型变量给合并成一个字符串，形式为：
      *paste（“variable1”，”variable2",…,sep=’ ',collapse=NULL）*
    - 其中sep参数是指变量和变量之间的连接，默认为空字符，collapse参数是指合并过后的元素之间的连接，默认为空，

    ```R
    # 我们简单的举几个例子就很清晰了：
    a <- paste("a","b","c",1:3,sep = '')
    a
    
    b <- paste("a","b","c",1:3,sep = '+')
    b
    
    c <- paste("a","b","c",1:3,sep = '+',collapse = '----')
    c
    
    # 我们发现若是给定collapse一个参数就会变成一整个合并的字符串，默认的话就是一个一个合并过后地元素。可以看b和c的区别。
    ```

    - 向量相关的运算：

    ```R
    # 取向量中最小最大的值：
    min()
    max()
    
    # 求的是取得最小（大）值的第几个分量
    which.min()
    which.max()
    sum()  # 求和
    median()   # 求中位数
    prod()  # 求积
    var()  # 方差、
    mean() # 平均值等
    sort() # 给x排序，默认递增
    rev() # 倒序
    order() # 给出递增的序列号
    a[order(a)]
    ```

- **矩阵：**

  

- **数组：**

- **数据框：**

- **列表：**

- 

​	

## 4. 基本数据管理

## 5. 高级数据管理——条件和循环







