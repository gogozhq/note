# 我们简单的举几个例子就很清晰了：
a <- paste("a","b","c",1:3,sep = '')
a

b <- paste("a","b","c",1:3,sep = '+')
b

c <- paste("a","b","c",1:3,sep = '+',collapse = '----')
c

# 取向量中最小最大的值：
min(x)
max(x)

# 求的是取得最小（大）值的第几个分量
which.min(x)
which.max(x)
sum(x)  # 求和
median(x)   # 求中位数
prod()  # 求积
var()  # 方差、
mean() # 平均值等
sort() # 给x排序，默认递增
rev() # 倒序
order() # 给出递增的序列号
a[order(a)]