## 当前问题分析

- 将不同考纲的词汇怎么处理
  - 放在不同表

    - 好处是清晰
  - 放在一张表

    - 为每个单词增加一个examType字段
    - 采用多表查询的策略
      - 不同考纲的单词通过外键(wrod的wordSpelling)来获取单词释义等字段值
    - > - 一种思想是在一条记录的同一个字段有个取值时,将其拆分为多条记录加以存放
      > - 主属性采用原主键+多值的那个字段构成多字段主键
      >
  - 收藏表和搜索记录表是否分开放


## 数据类型

- 某个词汇同时隶属于4/6/Neep;如何表达

### user

### examWords

```sql
ALTER TABLE `ela`.`examwords` 
ADD COLUMN `wordSpelling` varchar(255) NULL AFTER `WID`,
ADD COLUMN `examType` varchar(255) NULL AFTER `wordSpelling`,
ADD CONSTRAINT `wordSpelling` FOREIGN KEY (`wordSpelling`) REFERENCES `ela`.`words` (`wordSpelling`);
```

![1648170962804.png](image/DataBase/1648170962804.png)
