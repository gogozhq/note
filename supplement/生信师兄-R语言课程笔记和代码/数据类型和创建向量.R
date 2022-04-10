# 数据类型
a = 1
b <- TRUE
d = "abc"

class(a)
class(b)
class(d)


# 创建向量：
a <- c(1,2,5,3,6,-2,4)
b <- c("one", "two", "three")
d <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)


# 快速创建连续数列：
a <- c(1:10)

# seq函数创建数列：
a <- seq(1,10,3)  # seq(from = value1 ,to = value2 , by = step)

# 重复函数rep：
rep(x，times = value1) # 即表示将x重复value1次。

a <- rep(3,4)


# 访问向量中的元素：
a <- c(1,2,5,3,6,-2,4)

a[3]

a[c(1,3,4)]

a[2:6]



# 创建向量
x <- c(1,2,24)
x

# 修改向量中的元素
x[c(1,3)] <- c(23,43)
x

# 负号表示删除元素
x <- c(1:10)
x[-1]
x[-(1:5)]
