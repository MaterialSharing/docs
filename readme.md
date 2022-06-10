---
title: 基于微信小程序的英语学习系统
author:
  - 徐超信(1935010102)
  - 潘淼森(1912190529)

description: |
  我们开发了一个基于微信小程序的英语学习助手，
  它前端采用微信小程序，后端采用Python/Django，
  实现了英语词汇的学习和复习功能和查词匹配功能
---


# 一、项目介绍 [徐超信,潘淼森]

## 背景


本项目旨在帮助用户记忆和熟悉大学阶段的英语词汇学习,解决日常的查词功能

- 当下的词典软件功能很丰富,但是高频使用的功能为数不多,
- 而且充斥着各种广告和产品推销
- 软件体积较大,运行开销不小,想要流畅的使用软件,需要用户有较好的设备
- 千方百计诱导用户充值vip,添加各种限制和不必要的信息,分散用户的精力

我们设计的这套英语学习系统,希望能够帮助用户更加轻松愉快的学习英语,<u>包括</u>:

- `cet4/cet6/考研英语`的词汇记忆学习/复习系统
- 用户可以分享自己对于词汇的记忆方法和技巧,互助学习
- 提供常规的词汇查询功能,用户可以通过输入英文单词来查询单词的基本信息(音标/词形/释义)
- 同时提供模糊查词的功能,帮助用户减轻查词过程中`摩擦感`
- 同时提供基本的形近词推荐,帮助用户集中记忆相似单词
- 记录用户的使用痕迹和习惯,帮助用户定制学习计划,检验学习效果,集中学习专注度,拒绝分心

## 项目需求分析


###  思维导图
![image-20220608105755588](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/images17u62v9icUIaOeD.png)
思维导图1:总体的功能设计树
![image-20220608105853314](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesaWivhRq3yEz6rJA.png)
思维导图2:复习部分的细节设计树
### 首页

#### 欢迎

- 查词框(入口)
- 显示精美的轮播图
- 用户上次的科目以及对应的学习进度(进度条),诱导用户继续投入学习

#### 查词服务

- 查词详情内容:后端数据库直接提供词典

  - 音标

  - 词形(包括五种词形)

  - 解释


  - 用户查过的单词自动添加到查词记录中

  - 显示上一次学习的科目以及进度

​	

### 学单词

- 记单词首页:

  - 用户可以选择科目进入学习(刷单词卡片)

  - 同时提供一个下拉框,可以选择学习模式

    - 简洁模式

      - 常驻上方的模式`简洁模式/交流模式`点击开挂来切换学习模式

      - 常驻的进度提示:eg.`50/5514`

      - 单词卡片提供:

        - 单词拼写
        - 音标
        - 中文释义

      - 显示一个`单词详情`的查询按钮

      - 一个收藏按钮

        

    - 交流模式(引入其他用户的一些统计数据)

      - 基本和简洁模式一致,但包括:

      - 提供批注的发送和查看功能

      - 显示所有用户对该单词的平均掌握程度

        
### 提分助手(复习/测验)

- 该模块的菜单页包括
  - 头部显示当前的科目和学习进度(区别于复习)
  - 复习列表(复习策略)的选择
    - 最近学过的单词群
    - 所有熟练度不佳的单词
    - 当前词书内抽取单词(可作为总复习)(随机不重复)
  - 用户选择一种复习策略后,显示该策略的需要复习的词数
  - 提供四个题型的练习通道

#### 复习数据的生成&设计


- 用户初次学过一遍单词,可以复习&测验

  - 复习的内容的生成:(两级反馈复习队列)

    - 最近学过的内容(譬如指定时间24小时)
      - 如何判断时间:过去24小时见过的单词(刷卡片学习单词时会刷新相关属性,后端会完成响应操作)
    - 所有熟练度小于特定值的单词(该标准参考测验的答题情况,来量化熟练度)

  - 测验:用户复习的形式是通过做测验题目来完成的

    - > 题目的交互形式主要交由前端来落实,而数据反馈会同步到后端

    - 系统的答题模块提供了若干种题型

      - 根据中文意思选择单词
      - 根据音标以及意思提示拼写整个单词
      - 根据提示,为单词字母填空

    - 如果用错答,那么系统会将该用户对于错单单词的熟练度值-1

    - 如果用户正确答题,那么响应的将熟练度+1

    

- 提供学习规划:

  - 帮助用户规划每天学习的词汇数量,前端提供双向联动的学习计划设置入口.
    - 根据用户设定的每日任务计划数,计算出总耗时(天数)
    - 比如用户希望在多少天内完成,那么每天任务量是多少词,
  - 后台可以同步用户的计划设置(schedule)

### 我的

- 提供微信小程序的登录授权按你就,首先要求用户登录授权后继续使用

- 登录成功后显示

  - 用户昵称的基本信息

    - 用户户龄

    - 用户打卡累计天数和排行榜


  - 用户考试倒计时功能
    - 用户输入考试时间,系统提示剩余时间倒计时

  - 用户学习过程中累计的
    - 收藏列表
      - 收藏列表显示单词拼写
      - 用户在收藏列表中可以选择取消收藏
      - 用户点击单词,可以调转到单词解释详情页

    - 查词记录列表
      - 类似于收藏列表

  - 提供小程序问题反馈功能

## 计划和分工

> 介绍大致的开发计划以及每个人的分工。

- 徐超信:
  - 原型设计和功能设计
  - 数据库设计
  - 后端开发接口开发与测试
  - 后端服务部署
  - 文档编写(主体)
- 潘淼森:
  - 前端小程序的开发与测试
  - 文档编写(前端)

# 二、界面原型设计 [徐超信]



> 结合上述功能设计,我们将原型设计为对应的四个模块,采用`墨刀工具进行设计`

## 首页

![首页设计](https://img-blog.csdnimg.cn/ea9e2431c925449fa1b05c3d9c6079db.png)
图2.1:首页操作
- 用户可以在首页提供的查词框中输入单词进行查词
- 查词框下面是一个轮播图,获取通过bing的图片接口,获取精美图片,为学习带来一点视觉上的享受
- 我们将单词的解释分为两层,第一层仅仅提供单词的音标和简单的解释,这一般能够满足主要的需求;此外,我们在第一层中配置了一个进一步查询单词的词形变化的按钮,点击该按钮,会跳转到第二层,这一层提供了更详细的解释,包括单词的词性等等
- 此外,还提供了收藏该的单词的按钮,点击该按钮,会将该单词添加到收藏列表中

![image-20220608181908470](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220608181908470.png)
图2.2:继续复习
- 轮播图下面安排了用户当前的学习科目和学习进度,用户点击继续学习,便可以进入学习模式



![请添加图片描述](https://img-blog.csdnimg.cn/06d87c57851d462da531acf846027e5b.png)
图2.3查词操作

- 对于拼写错误的单词,后台会尝试通过匹配算法推荐一些形近词
  - 对于记忆不清的单词来说,这会很有用,用户也可以利用该接口查找形近词
  - 事实上,后端可以提供正则匹配/通配符等高级功能(尽管已经很少用到了)





## 学单词

![在这里插入图片描述](https://img-blog.csdnimg.cn/9205722daed04e0093be2f8cdfa7b137.png)
图2.4学单词操作流程
- 学单词模块,也就是本应用的核心模块
- 用户可以在该模块的主菜单页选择记忆模式(包括简洁模式和交流模式(也叫常规模式))
  - 默认的,记忆模式是常规模式
- 然后选择自己的考试类型(对应的词书)
- 其中,简洁模式包含内容弄个较少,只有音标和基本的解释,已经一个查询单词详情解释的按钮和收藏按钮
- 而另一个模式(交流模式中),除了包含简洁模式中的相关功能,还提供了基于后台数据分析的`所有用户平均熟练度指标`(也被称为`难度等级`)
- `我的观点`则是反映本人的当前对于该词汇的熟练度

![请添加图片描述](https://img-blog.csdnimg.cn/ae7cf0f2d90347eca6e0c959d96b1fd5.png)
图2.5收藏单词操作

- 这是用户点击单词详情和收藏后分别的出现的响应结果

![请添加图片描述](https://img-blog.csdnimg.cn/e47c3386c0444de6a6508c497189118b.png)
图2.6交流模式下的批注操作
- 这是用户在交流模式下,提交自己的记忆技巧(简称为`批注`)
- 提交成功,则反馈一个`提交成功`的标识给用户


## 复习与测验

![请添加图片描述](https://img-blog.csdnimg.cn/8bc5e7ec92304ff0b9563342c3f2b74b.png)
图2.7复习与测验操作流程1

- 复习&测验也是本应用的主要功能,能够帮助用户检查自己的记忆效果(掌握程度),帮助用户对自己的学习成果有更加客观的把握
- 我们提供了多样化的复习策略和题型,包括中文选词,拼写组合,拼写填空和全拼默写
- 对于答错的题目,页面会切换到正确答案的解释页面
- 对于答对的题目,页面会切换到下一题
- 注:问题提交答案的方式:
  - 用户选中一个选项后,(被自动提交),后台自动判断正确性,根据正确性切换对应的页面
  - 上述流程表示的是中文选词的答题过程

![请添加图片描述](https://img-blog.csdnimg.cn/a1eaba552a494f09a42457c4c43fac65.png)
图2.8复习与测验操作流程2
- 这是拼写填空题型下的答题过程


## 我的

![请添加图片描述](https://img-blog.csdnimg.cn/4e96e13bd2f342eab9a19ac8d6a8c188.png)

图2.9:我的主页

- 这是`我的(用户中心)`模块,用于借助于微信平台的登录授权功能方便的注册登录到本系统
  - 后台通过获取微信提供的信息头像和昵称的信息创建一个用户记录
  - 该记录也作为登录状态保持(session)的value
  - 后台将会凭借session来判断和区别用户
- 登录成功后,小程序拉取必要的同步数据,并且做一定的数据计算和转换,得到签到天数,户龄
- 还包括考试倒计时/单词收藏列表和查词记录/反馈与建议的提交入口



![请添加图片描述](https://img-blog.csdnimg.cn/dfb8484b4cfb48b0946d4a4ebdec51a9.png)
图2.10:我的主页2
- 用户点击我的->收藏列表,可以看到之前做过的单词收藏,(这些单词可能是用户自认为容易混淆意思/难以拼写/品读正确的单词)

- 用户点击某个条目后,可以跳转到响应的词典解释页面

- 用户点击星号`star`,可以取消掉对某个单词的收藏,程序会向用户发送一个确认询问,当用户确认取消,才真正将对应的单词从收藏列表中移除,否则,操作被取消

  

![image-20220609081939578](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220609081939578.png)
图2.11:我的主页3

- 这是进入`单词搜索记录`的流程,UI和操作逻辑基本和`收藏列表`一致

## 墨刀在线预览(可交互)

- https://modao.cc/app/Zq2TY5o8rd1a7cROgqSHwe 《EnglishLearningAsistant》 (页面附带多种状态)
- https://modao.cc/app/xg43top2raoiorN4gHVgF 《ELA_morePages》 

# 三、系统架构设计 [徐超信]


## 前端

- 前端我们分为四个功能模块
- 第一个模块是工具性模块,提供查词功能和形近词推荐功能
- 第二个模块是学单词模块(核心),并且具有两种模式可供选择,可以满足用户不同的学习风格
- 第三个模块是承接第二个模块,也是核心模块,用户可以复习和检测自己的学习效果;并提供了多样的复习策略和复习题型,也能更加全面的检测对单词的掌握情况
- 第四个模块是用户中心,属于不太常用但又不可或缺的模块,用户可以通过本模块获取自己的总体的学习情况和学习痕迹(打卡天数/收藏列表/查词记录列表/...),用户也是在该模块中反馈问题给程序后台
- 程序操作逻辑如下

![logic](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imageslogic.svg)
图3.1:程序操作逻辑流图

## 后端

- > 后端对应前端,创建了4个功能模块,每个功能模块中在进一步细分

  - 为了实现灵活性,独立性,使用前后端分离的方式渐渐称为主流,本项目中,我们采用前后端分离的开发模式,并且借助于apifox做接口设计和对接,前后端可以有自己实际开发进度
  - 我们奉行`api first`的开发方式,促进前后端的进一步分离
- 后端采用Python/Django技术实现数据管理,用户登录与信息同步等功能
##  数据库
- 数据库采用免费的关系型数据库mysql,该数据库足够流行(意味着它经过了足够多的考验),完全可以胜任我们的本次项目
- 除了数据库软件本身的功能足够,我们本身已有的数据库知识也主要是关系型数据库的理论,因此最终采用mysql来提供数据管理服务

## api

> api设计是项目功能的重点,良好的接口设计有利于提高开发效率,节约沟通成本,提供可维护性

本项目的所有api都统一在apifox上设计,包括指定参数和响应,编写mock来实现前后端开发,借助于mock,前后端都有所参照,可以更加灵活的开发,项目的api总体符合restful的设计理念,具有简洁明了的特点

- 此外,后端还提供了基于swagger的文档,前端即使不查看后端代码,也可以对后端提供的接口有所了解

- `123.56.72.67:8000/doc/`
  - <img src="https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imageswvMN7ACpkDd8qzX.png" alt="image-20220607201359428" style="zoom:50%;" />
图3.2:后端的swagger文档接口


# 四、API设计 [徐超信]

> - 这部分主要是API的设计，分模块进行介绍，并通过APIfox介绍API的设计理念，使用、测试方法等。
> - 用列表和文档对所有的API进行详细的列举和描述。

## api风格与设计理念

我们采用流行的RESTful api 设计风格,改善我们的api开发效率和规范性

- [RESTful API](https://en.wikipedia.org/wiki/Representational_state_transfer)是目前比较成熟的一套互联网应用程序的API设计理论。

  - > 访问一个网站，就代表了客户端和服务器的一个互动过程。在这个过程中，势必涉及到数据和状态的变化。
    >
    > 互联网通信协议HTTP协议，是一个无状态协议。这意味着，所有的状态都保存在服务器端。因此，**如果客户端想要操作服务器，必须通过某种手段，让服务器端发生"状态转化"（State Transfer）。而这种转化是建立在表现层之上的，所以就是"表现层状态转化"。**
    >
    > 客户端用到的手段，只能是HTTP协议。具体来说，就是HTTP协议里面，四个表示操作方式的动词：GET、POST、PUT、DELETE。它们分别对应四种基本操作：**GET用来获取资源，POST用来新建资源（也可以用于更新资源），PUT用来更新资源，DELETE用来删除资源。**

- 我们在开发项目的api的过程中,尽可能地采用RESTful理念,充分利用了http协议中的四个常用动词来设计api,客户端通过四个HTTP动词，对服务器端资源进行操作，实现"表现层状态转化"

- RESTful API最好做到Hypermedia，即返回结果中提供链接，连向其他API方法，使得用户不查文档，也知道下一步应该做什么。我们的后端的四个模块的基础路由提供了类似的功能,帮助api的使用者更快了解后端的api功能组织

  - ![image-20220607201049797](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesp2Hwvm8NaDX7TtQ.png)
  - 图:4.1

- 尽管RESTful 是一个很好的理念,但是在开发过程中,发现有少量的api较难通过四个动词来贴切地描述api的实际用意,因此,我们结合实际需求,对少数api做了折衷处理

##  详细的api文档

- 附件中的api文档是通过apifox导出
- tables:[英语学习助手_api文档.md (github.com)](https://github.com/MaterialSharing/docs/blob/main/design/英语学习助手_api文档.md)
- swagger:[英语学习助手_api.html (github.com)](https://github.com/MaterialSharing/docs/blob/main/design/英语学习助手_api.html)

---
title: 英语学习助手 v1.0.0
language_tabs:

toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.11"

---

# 英语学习助手

> v1.0.0

# 单词/词典

## GET 获取单词释义

GET /dict/{spelling}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|spelling|path|string| 是 |none|
|search|query|string| 否 |none|

> 返回示例

> 成功

```json
{
  "wordSpelling": "fugiat culpa Excepteur sint",
  "phonetic": "18129225380",
  "basicExplain": "aute nostrud fugiat quis",
  "webMeaning": [
    "reprehenderit",
    "ut dolore Lorem"
  ],
  "forms": {
    "pl": "ea Ut do Lorem culpa",
    "past": null,
    "pastParticiple": null,
    "presentParticiple": null
  }
}
```

```json
{
  "count": 11322,
  "next": "http://127.0.0.1:8000/word/dict/?pager=2&search=",
  "previous": null,
  "results": [
    {
      "wid": 1,
      "spelling": "abandon",
      "phonetic": "əˈbændən",
      "plurality": "NULL",
      "thirdpp": "NULL",
      "present_participle": "NULL",
      "past_tense": "NULL",
      "past_participle": "NULL",
      "explains": "['v. 抛弃，遗弃；（因危险）离开，舍弃；中止，不再有；放弃（信念、信仰或看法）；陷入，沉湎于（某种情感）', 'n. 放任，放纵']"
    },
    {
      "wid": 2,
      "spelling": "abatement ",
      "phonetic": "əˈbeɪtmənt",
      "plurality": "NULL",
      "thirdpp": "NULL",
      "present_participle": "NULL",
      "past_tense": "NULL",
      "past_participle": "NULL",
      "explains": "['n. 减少；消除；减轻']"
    },
    {
      "wid": 3,
      "spelling": "abdomen",
      "phonetic": "ˈæbdəmən",
      "plurality": "abdomens",
      "thirdpp": "NULL",
      "present_participle": "NULL",
      "past_tense": "NULL",
      "past_participle": "NULL",
      "explains": "['n. （人体）腹，腹部；（昆虫）腹部']"
    },
    {
      "wid": 4,
      "spelling": "abide",
      "phonetic": "əˈbaɪd",
      "plurality": "NULL",
      "thirdpp": "abides",
      "present_participle": "abiding",
      "past_tense": "abided或abode",
      "past_participle": "abided或abode",
      "explains": "['v. 遵守（abide by）；容忍，忍受；<旧>居住，逗留；（感情，记忆）始终不渝，持续']"
    },
    {
      "wid": 5,
      "spelling": "abnormal",
      "phonetic": "æbˈnɔːm(ə)l",
      "plurality": "NULL",
      "thirdpp": "NULL",
      "present_participle": "NULL",
      "past_tense": "NULL",
      "past_participle": "NULL",
      "explains": "['adj. 反常的，异常的，变态的；不规则的']"
    }
  ]
}
```

```json
"sorry,there is no explain for the word:annotation,try fuzzy match api? /word/fuzzy/annotation"
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|created!|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» count|integer|false|none||none|
|» next|string|false|none||none|
|» previous|string|false|none||none|
|» results|[[Word](#schemaword)]|false|none||none|
|»» wid|integer|true|none||none|
|»» spelling|string|true|none||none|
|»» phonetic|string|false|none||none|
|»» plurality|string|false|none||none|
|»» thirdpp|string|false|none||none|
|»» present_participle|string|false|none||none|
|»» past_tense|string|false|none||none|
|»» past_participle|string|false|none||none|
|»» explains|string|false|none||none|

## GET 获取单词批注list

GET /note/

- 本接口的主要使用场景在于,显示某个单词的所有批注(spelling=xxx)
- 还提供了指定用户留下的批注(uid=xx)

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|spelling|query|string| 否 |常用,根据拼写得到基于指定单词的相关批注|
|user|query|integer| 否 |不常用|
|size|query|integer| 否 |none|
|page|query|integer| 否 |none|

> 返回示例

> 成功

```json
{
  "count": 42,
  "next": "http://127.0.0.1:8000/word/note/?page=2&size=6&spelling=&user=",
  "previous": null,
  "results": [
    {
      "id": 1,
      "user": null,
      "spelling": "qrsxj",
      "content": "@text",
      "difficulty_rate": 3
    },
    {
      "id": 2,
      "user": null,
      "spelling": "assist",
      "content": "test word note:assist :help (someone), typically by doing a share of the work.",
      "difficulty_rate": 3
    },
    {
      "id": 3,
      "user": null,
      "spelling": "assist",
      "content": "Similar: help aid abet lend a (helping) hand to give assistance to be of use to oblige",
      "difficulty_rate": 3
    },
    {
      "id": 4,
      "user": null,
      "spelling": "qnvxbvg",
      "content": "dolore fugiat incididunt consequat",
      "difficulty_rate": 2
    },
    {
      "id": 5,
      "user": null,
      "spelling": "qzlveehov",
      "content": "@text",
      "difficulty_rate": 3
    },
    {
      "id": 6,
      "user": null,
      "spelling": "vxvo",
      "content": "@text",
      "difficulty_rate": 3
    }
  ]
}
```

```json
{
  "count": 42,
  "next": "http://127.0.0.1:8000/word/note/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "user": null,
      "spelling": "qrsxj",
      "content": "@text",
      "difficulty_rate": 3
    },
    {
      "id": 2,
      "user": null,
      "spelling": "assist",
      "content": "test word note:assist :help (someone), typically by doing a share of the work.",
      "difficulty_rate": 3
    },
    {
      "id": 3,
      "user": null,
      "spelling": "assist",
      "content": "Similar: help aid abet lend a (helping) hand to give assistance to be of use to oblige",
      "difficulty_rate": 3
    },
    {
      "id": 4,
      "user": null,
      "spelling": "qnvxbvg",
      "content": "dolore fugiat incididunt consequat",
      "difficulty_rate": 2
    },
    {
      "id": 5,
      "user": null,
      "spelling": "qzlveehov",
      "content": "@text",
      "difficulty_rate": 3
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 单词下用户添加批注

POST /note/

请求头中:
- 包含用户(uid)
- 单词拼写(spelling)
- 可选的难度评级(1-5)

> Body 请求参数

```json
{
  "id": 21,
  "uid": 96,
  "spelling": "ewlxxqmu",
  "content": "@text",
  "difficulty_rate": 2
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[WordNote](#schemawordnote)| 否 |none|

> 返回示例

> 成功

```json
{
  "data": {
    "userID": "40",
    "noteContent": "in consequat ea"
  }
}
```

```json
{
  "id": 43,
  "user": null,
  "spelling": "vhylrkbk",
  "content": "@text",
  "difficulty_rate": 4
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|Inline|

### 返回数据结构

状态码 **201**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» data|object|false|none||none|
|»» userID|string|true|none||none|
|»» noteContent|string|true|none||none|

## GET 获取单词的平均难度评分

GET /avg-difficulty/{spelling}

- 如果前端使用session登录,请使用平均熟练度`代替`本接口
- 由于难度评分主观性较强,不是特别能反映问题(但是模型字段暂时保留着)
- 我们打算将平均难度以后台统计的熟练度作为衡量指标,更加具有客观性!)

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|spelling|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "spelling": "assist",
  "avg_difficulty": 3.6667
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 模糊匹配单词(拼写形近词)

GET /fuzzy/{spelling}/{start_with}

-可以指定是否要求匹配开头(start_with个字符)
- 关于search(包括正则功能,因为返回类型不再是DRF指定的默认类型(或者说支持search查询的类型,故不可用)
可以到dict api中使用search等DRF的增益功能

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|spelling|path|string| 是 |none|
|start_with|path|integer| 是 |start_with一般会更加常用,故而放置再url中,(当然也可以为例整洁一致移动到query参数中)|
|contain|query|string| 否 |一般不指定为1(除非返回结果过多,同时用户确定某个单词必定包含指定的字母)|
|end_with|query|string| 否 |django有支持直接操做的查询(spelling__endswith);然而,这种规则使用search$正则会更方便|

> 返回示例

> 成功

```json
[
  {
    "id": 1215,
    "spelling": "declare",
    "char_set": "acdelr"
  }
]
```

```json
[
  {
    "id": 12491,
    "spelling": "leader",
    "char_set": "adelr"
  },
  {
    "id": 2663,
    "spelling": "learned",
    "char_set": "adelnr"
  },
  {
    "id": 2667,
    "spelling": "leather",
    "char_set": "aehlrt"
  }
]
```

```json
[
  {
    "id": 6301,
    "spelling": "complacent",
    "char_set_str": "acelmnopt"
  },
  {
    "id": 919,
    "spelling": "complaint",
    "char_set_str": "acilmnopt"
  },
  {
    "id": 6303,
    "spelling": "complaisant",
    "char_set_str": "acilmnopst"
  },
  {
    "id": 6307,
    "spelling": "compliant",
    "char_set_str": "acilmnopt"
  },
  {
    "id": 926,
    "spelling": "compliment",
    "char_set_str": "ceilmnopt"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|[[WordMatcher](#schemawordmatcher)]|false|none||none|
|» id|integer|true|none||none|
|» spelling|string|true|none||none|
|» char_set_str|string|true|none||none|

## PUT 修改单词批注

PUT /note/{pk}/

- 一般情况下不会去用这个接口(市面上较少软件会开放修改评论的功能)
- difficulty-rate字段已经弃用

> Body 请求参数

```json
{
  "uid": 0,
  "spelling": "string",
  "content": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|
|body|body|object| 否 |none|
|» uid|body|integer| 是 |none|
|» spelling|body|string| 是 |none|
|» content|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 1,
  "user": null,
  "spelling": "qrsxj",
  "content": "@text",
  "difficulty_rate": 3
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 查询考纲词汇总数

GET /sum/{examtype}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |4/6/8分别表示cet4,6,neep(研)|

> 返回示例

> 成功

```json
{
  "examtype": "cet6",
  "sum": 51
}
```

```json
{
  "examtype": "cet6",
  "sum": 6000
}
```

```json
{
  "examtype": "cet4",
  "sum": 4500
}
```

```json
{
  "examtype": "neep",
  "sum": 5315
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|[WordReqSum](#schemawordreqsum)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

## GET 获取单词的用户平均熟练度

GET /avg-familiarity/{spelling}

将平均难度以后台统计的熟练度作为衡量指标,更加具有客观性!)
将三种考试类型的学习记录作为统计数据的来源!

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|spelling|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "spelling": "abandon",
  "avg_familiarity": 3,
  "validity:": true,
  "msg": "查询成功"
}
```

```json
{
  "spelling": "assist",
  "avg_familiarity": 3,
  "validity:": false,
  "msg": "没有找到相关记录,默认使用中间值3"
}
```

```json
{
  "spelling": "noita",
  "avg_familiarity": 3,
  "validity:": false,
  "msg": "没有找到相关记录,默认使用中间值3"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

# 提分助手

## PUT 刷新一条学习记录(G)  Copy

PUT /{examtype}/refresh/

> Body 请求参数

```json
{
  "wid": 0,
  "user": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |none|
|body|body|object| 否 |none|
|» wid|body|integer| 否 |none|
|» user|body|integer| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|[Study](#schemastudy)|

# 提分助手/study_aggregate(logged)

## PUT 答题正确/错误,熟练度±1(familiarity_change1)

PUT /study/familiarity/{change}/

> Body 请求参数

```json
{
  "wid": 0,
  "user": 0,
  "examtype": "4"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|change|path|string| 是 |none|
|body|body|object| 否 |none|
|» wid|body|integer| 否 |none|
|» user|body|integer| 否 |none|
|» examtype|body|string| 否 |none|

#### 枚举值

|属性|值|
|---|---|
|» examtype|4|
|» examtype|6|
|» examtype|8|

> 返回示例

> 成功

```json
{
  "id": 3,
  "last_see_datetime": "2022-06-09T11:54:57.562314Z",
  "examtype": "4",
  "familiarity": 2,
  "user": 1,
  "user_name": "Ronald Taylor",
  "wid": 1,
  "spelling": "abandon"
}
```

```json
{
  "id": 3,
  "last_see_datetime": "2022-06-09T11:55:35.550303Z",
  "examtype": "4",
  "familiarity": 4,
  "user": 1,
  "user_name": "Ronald Taylor",
  "wid": 1,
  "spelling": "abandon"
}
```

```json
{
  "msg": "Study not found"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

## PUT 更新/添加一条学习记录(examtype)

PUT /study/refresh/

- 关于熟练度,在刷单词卡片的时候不应该手动更改,
- 但是,每一条学习记录又包含熟练度字段,这可以交给django模型的字段默认值来处理(默认(初始)熟练度为0)
- 熟练度的后续变更应该只通过特定的api(familiarity/)系列进行操作

> Body 请求参数

```json
{
  "wid": 0,
  "examtype": "4"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» wid|body|integer| 否 |客户端将用户当前在学习的单词卡片的wid(单词序号)|
|» examtype|body|string| 否 |科目|

#### 枚举值

|属性|值|
|---|---|
|» examtype|4|
|» examtype|6|
|» examtype|8|

> 返回示例

> 成功

```json
{
  "id": 13,
  "last_see_datetime": "2022-06-09T11:49:10.091174Z",
  "examtype": "8",
  "familiarity": 0,
  "user": 112,
  "user_name": "cxxu",
  "wid": 53,
  "spelling": "acquaintance",
  "msg": "modify the existed obj",
  "ser": "<class 'rest_framework.serializers.SerializerMetaclass'>"
}
```

```json
{
  "id": 20,
  "last_see_datetime": "2022-06-09T11:51:30.646249Z",
  "examtype": "4",
  "familiarity": 0,
  "user": 112,
  "user_name": "cxxu",
  "wid": 53,
  "spelling": "acquaintance",
  "ser": "<class 'scoreImprover.serializer.StudyModelSerializer'>"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|Inline|

### 返回数据结构

## GET 查看学习记录(examtype)

GET /study/

- 由于apiFox中不如DRF自带前端界面直观,注意分页;尤其是查看所有记录的时候!

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user|query|string| 否 |用户id|
|page|query|string| 否 |计算结果较多时,采用改参数翻页|
|examtype|query|string| 否 |考试科目类型|

> 返回示例

> 成功

```json
{
  "count": 20,
  "next": "http://127.0.0.1:8000/improver/study/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "last_see_datetime": "2022-06-04T11:20:21.974167Z",
      "examtype": "4",
      "familiarity": 4,
      "user": 4,
      "user_name": "testScriptUser",
      "wid": 72,
      "spelling": "additional"
    },
    {
      "id": 2,
      "last_see_datetime": "2022-06-04T11:21:42.463210Z",
      "examtype": "8",
      "familiarity": 1,
      "user": 2,
      "user_name": "create0000_pyt_er",
      "wid": 79,
      "spelling": "adjust"
    },
    {
      "id": 3,
      "last_see_datetime": "2022-06-06T07:08:29.546124Z",
      "examtype": "4",
      "familiarity": 4,
      "user": 1,
      "user_name": "Ronald Taylor",
      "wid": 1,
      "spelling": "abandon"
    },
    {
      "id": 4,
      "last_see_datetime": "2022-06-04T12:05:15.371155Z",
      "examtype": "6",
      "familiarity": 4,
      "user": 1,
      "user_name": "Ronald Taylor",
      "wid": 1,
      "spelling": "abandon"
    },
    {
      "id": 5,
      "last_see_datetime": "2022-06-06T05:57:31.894049Z",
      "examtype": "4",
      "familiarity": 3,
      "user": 1,
      "user_name": "Ronald Taylor",
      "wid": 65,
      "spelling": "actress"
    }
  ]
}
```

```json
{
  "count": 6,
  "next": "http://127.0.0.1:8000/improver/study/?examtype=6&page=2",
  "previous": null,
  "results": [
    {
      "id": 4,
      "last_see_datetime": "2022-06-04T12:05:15.371155Z",
      "examtype": "6",
      "familiarity": 4,
      "user": 1,
      "user_name": "Ronald Taylor",
      "wid": 1,
      "spelling": "abandon"
    },
    {
      "id": 8,
      "last_see_datetime": "2022-06-06T06:03:45.236030Z",
      "examtype": "6",
      "familiarity": 3,
      "user": 112,
      "user_name": "cxxu",
      "wid": 645,
      "spelling": "cap"
    },
    {
      "id": 12,
      "last_see_datetime": "2022-06-09T09:45:30.217145Z",
      "examtype": "6",
      "familiarity": 2,
      "user": 112,
      "user_name": "cxxu",
      "wid": 1,
      "spelling": "abandon"
    },
    {
      "id": 15,
      "last_see_datetime": "2022-06-09T09:47:04.915662Z",
      "examtype": "6",
      "familiarity": 0,
      "user": 112,
      "user_name": "cxxu",
      "wid": 70,
      "spelling": "addict"
    },
    {
      "id": 16,
      "last_see_datetime": "2022-06-09T09:47:08.725863Z",
      "examtype": "6",
      "familiarity": 0,
      "user": 112,
      "user_name": "cxxu",
      "wid": 47,
      "spelling": "accustomed"
    }
  ]
}
```

```json
{
  "detail": "Invalid page."
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|[Study](#schemastudy)|

# 提分助手/study_separates

## GET 查看学习记录(G) query

GET /{examtype}/

- 由于apiFox中不如DRF自带前端界面直观,注意分页;尤其是查看所有记录的时候!

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |none|
|user|query|string| 否 |用户id|
|page|query|string| 否 |计算结果较多时,采用改参数翻页|

> 返回示例

> 成功

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "last_see_datetime": "2022-05-15T12:26:16.932885Z",
      "familiarity": 3,
      "user": 20,
      "wid": 1
    },
    {
      "id": 2,
      "last_see_datetime": "2022-05-15T12:26:21.770543Z",
      "familiarity": 4,
      "user": 3,
      "wid": 4
    },
    {
      "id": 3,
      "last_see_datetime": "2022-05-15T12:26:34.939649Z",
      "familiarity": 4,
      "user": 3,
      "wid": 4
    }
  ]
}
```

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "last_see_datetime": "2022-05-15T12:25:30.107155Z",
      "familiarity": 2,
      "user": 4,
      "wid": 5
    },
    {
      "id": 2,
      "last_see_datetime": "2022-05-15T12:25:32.788455Z",
      "familiarity": 2,
      "user": 4,
      "wid": 5
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|[Study](#schemastudy)|

## PUT 答题正确/错误,熟练度±1(familiarity_change1)

PUT /study/{examtype}/familiarity/{change}/

- restful 风格的api不宜使用动词
- 而某某些时候,用动词可以更加贴切的描述api的意图
- 可以采取折衷的方案来命名:将api命名为服务名词(譬如转账服务transction/自增服务)
- 其实,如果希望名词来表征熟练度的变更,可以用penalty/decrement
- 另一方面,使用increment来表针熟练度的提升服务

> Body 请求参数

```json
{
  "wid": 0,
  "user": 0,
  "examtype": "4"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |none|
|change|path|string| 是 |none|
|body|body|object| 否 |none|
|» wid|body|integer| 否 |none|
|» user|body|integer| 否 |none|
|» examtype|body|string| 否 |none|

#### 枚举值

|属性|值|
|---|---|
|» examtype|4|
|» examtype|6|
|» examtype|8|

> 返回示例

> 成功

```json
{
  "id": 6,
  "last_see_datetime": "2022-06-09T12:32:38.740928Z",
  "familiarity": 3,
  "user": 1,
  "user_name": "Ronald Taylor",
  "wid": 1,
  "spelling": "abandon"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 随机抽查一组单词 G (sizeable)

GET /review/{examtype}/{size}

## 每次返回size个单词

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |none|
|size|path|string| 是 |none|

> 返回示例

> 成功

```json
[
  {
    "wordorder": 47,
    "spelling": "njfbckk"
  },
  {
    "wordorder": 7,
    "spelling": "vvrcll"
  },
  {
    "wordorder": 60,
    "spelling": "nkewc"
  }
]
```

```json
[
  {
    "examtype": "cet4",
    "queryset": "word.Cet4WordsReq.objects",
    "ser": "<class 'word.serializer.Cet4WordsReqModelSerializer'>"
  },
  {
    "wordorder": 1909,
    "spelling": "illiterate"
  },
  {
    "wordorder": 2117,
    "spelling": "kind"
  },
  {
    "wordorder": 2991,
    "spelling": "profile"
  },
  {
    "wordorder": 3772,
    "spelling": "structure"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|string|

## GET 检查最近添加的学习记录的单词列表unitable(all users)

GET /neep/timedelta/{unit}/{value}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|unit|path|string| 是 |none|
|value|path|number| 是 |none|

> 返回示例

> 成功

```json
[
  {
    "wid": 79,
    "last_see_datetime": "1986-04-27 19:07:08",
    "user": 2,
    "familiarity": 1,
    "id": 8
  },
  {
    "id": 25,
    "user": 1,
    "last_see_datetime": "1979-11-21 16:45:48",
    "wid": 39,
    "familiarity": 2
  },
  {
    "id": 11,
    "last_see_datetime": "1993-11-13 23:41:29",
    "wid": 63,
    "user": 4,
    "familiarity": 3
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|[[Study](#schemastudy)]|false|none||none|
|» id|integer|false|none||none|
|» wid|integer|false|none||none|
|» last_see_datetime|string|false|none||none|
|» familiarity|integer|false|none||none|
|» user|integer|false|none||none|
|» examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

## PUT 刷新/创建一条学习记录(G) 

PUT /study/{examtype}/

> Body 请求参数

```json
{
  "wid": 0,
  "user": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |考试科目|
|body|body|object| 否 |none|
|» wid|body|integer| 否 |none|
|» user|body|integer| 否 |none|

> 返回示例

> 成功

```json
{
  "id": 19,
  "last_see_datetime": "2022-05-15T15:59:23.958299Z",
  "familiarity": 4,
  "user": 5,
  "wid": 1,
  "examtype": "cet6",
  "msg": "modify the existed obj",
  "ser": "<class 'rest_framework.serializers.SerializerMetaclass'>"
}
```

```json
{
  "id": 26,
  "last_see_datetime": "2022-05-15T16:01:51.810349Z",
  "familiarity": 1,
  "user": 3,
  "wid": 2,
  "examtype": "neep",
  "msg": "modify the existed obj",
  "ser": "<class 'rest_framework.serializers.SerializerMetaclass'>"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|Inline|

### 返回数据结构

状态码 **201**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» id|integer|false|none||none|
|» wid|integer|false|none||none|
|» last_see_datetime|string|false|none||none|
|» familiarity|integer|false|none||none|
|» user|integer|false|none||none|
|» examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

# 用户/login

## DELETE 登出(注销)

DELETE /logout/

> Body 请求参数

```json
{
  "name": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» name|body|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|删除成功|Inline|

### 返回数据结构

## POST 用户登录

POST /dologin/

admin/login/

> Body 请求参数

```json
{
  "account": "string",
  "password": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» account|body|string| 是 |none|
|» password|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "login_status": "success"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

## GET 从session获取当前登录的用户信息

GET /fetch-user/

- 登录成功后,服务端会向客户端发放cookie凭证,用户读取被cookie管理的session,可以提取除响应的用户信息
- 调用本接口不需要任何参数
- 可以获得不敏感的用户数据
- 但是应该确保在登录成功才调用本函数

> 返回示例

> 成功

```json
{
  "uid": 112,
  "nickname": "testNickname",
  "name": "cxxu",
  "status": 0,
  "signin": 0,
  "openid": null,
  "examdate": "2023-08-15",
  "examtype": "6",
  "signupdate": "2022-05-28",
  "schedule": 30
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 新建用户(password)

POST /register/

可以设置密码的api(但对于小程序来说并不常用)

> Body 请求参数

```json
{
  "name": "string",
  "examtype": "string",
  "examdate": "string",
  "password": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[UserSignupPassword](#schemausersignuppassword)| 否 |none|

> 返回示例

> 成功

```json
{
  "uid": 161,
  "name": "cxxu",
  "password_hash": "4cc70c17134c1cc950f9aef2e6b1a8ca",
  "password_salt": "7233",
  "status": 0,
  "signin": 0,
  "openid": null,
  "examdate": "2022-08-28",
  "examtype": "6",
  "signupdate": "2022-06-09",
  "schedule": 30
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功(created)|Inline|

### 返回数据结构

# 用户/Info

## PUT 修改用户信息

PUT /info/{id}/

- 本接口用于修改用户信息
- 包括考试日期,考试类型,
- 具体字段参看请求参数/Body中所定义的

> Body 请求参数

```json
{
  "name": "string",
  "examtype": "string",
  "examdate": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|[UserUpdate](#schemauserupdate)| 否 |none|

> 返回示例

> 成功

```json
{
  "uid": 84,
  "name": "Christopher Johnson",
  "signin": 64,
  "examtype": "6",
  "examdate": "1993-02-17",
  "signupdate": "2007-03-18"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|[User](#schemauser)|

## GET 获取用户的学习计划

GET /info/{pk}/schedule/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "user": 1,
  "schedule": 67
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

## GET 查询用户详情

GET /info/

如果不传入id,则查询所有用户

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|page|query|integer| 否 |查看第几页数据|
|size|query|integer| 否 |本次请求获取多少条记录|
|search|query|string| 否 |支持正则搜索名字|

> 返回示例

> 成功

```json
{
  "uid": 1,
  "nickname": "testNickname",
  "name": "Ronald Taylor",
  "signin": 28,
  "openid": null,
  "examtype": "6",
  "examdate": "2023-01-13",
  "signupdate": "1970-01-01"
}
```

```json
{
  "userNickName": "锺娜",
  "sumSignIn": 23,
  "rankSuperior": null,
  "exameCountdown": null,
  "exameType": 6
}
```

```json
{
  "count": 152,
  "next": "http://127.0.0.1:8000/user/info/?page=2",
  "previous": null,
  "results": [
    {
      "uid": 13,
      "nickname": "testNickname",
      "name": "create_ser_pyt",
      "status": 0,
      "signin": 778,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 3,
      "nickname": "testNickname",
      "name": "testScriptUser",
      "status": 0,
      "signin": 0,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 4,
      "nickname": "testNickname",
      "name": "testScriptUser",
      "status": 0,
      "signin": 0,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 5,
      "nickname": "testNickname",
      "name": "testScriptUser",
      "status": 0,
      "signin": 0,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 31,
      "nickname": "testNickname",
      "name": "create_ser_M_pyt",
      "status": 0,
      "signin": 8,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    }
  ]
}
```

```json
{
  "count": 152,
  "next": "http://127.0.0.1:8000/user/info/?page=2&size=5",
  "previous": null,
  "results": [
    {
      "uid": 13,
      "nickname": "testNickname",
      "name": "create_ser_pyt",
      "status": 0,
      "signin": 778,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 3,
      "nickname": "testNickname",
      "name": "testScriptUser",
      "status": 0,
      "signin": 0,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 4,
      "nickname": "testNickname",
      "name": "testScriptUser",
      "status": 0,
      "signin": 0,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 5,
      "nickname": "testNickname",
      "name": "testScriptUser",
      "status": 0,
      "signin": 0,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    },
    {
      "uid": 31,
      "nickname": "testNickname",
      "name": "create_ser_M_pyt",
      "status": 0,
      "signin": 8,
      "openid": null,
      "examdate": "1970-01-01",
      "examtype": "4",
      "signupdate": "1970-01-01",
      "schedule": 30
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» data|[User](#schemauser)|false|none||none|
|»» uid|integer|true|none||none|
|»» name|string|true|none||none|
|»» signin|integer|true|none||none|
|»» examtype|string|true|none||none|
|»» examdate|string|true|none||none|
|»» signupdate|string|true|none||none|

## POST 新建一个用户(适合于微信小程序授权的方式(无密码))

POST /info/

- 新建一个用户(适合于微信小程序授权的方式(无密码))
- 在login子模块中,有可以设置密码的api(但对于小程序来说并不常用)

> Body 请求参数

```json
{
  "name": "string",
  "examtype": "string",
  "examdate": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[UserSignUp](#schemausersignup)| 否 |none|

> 返回示例

> 成功

```json
{
  "uid": 35,
  "name": "Linda Anderson",
  "signin": 54,
  "examtype": "4",
  "examdate": "1974-06-06",
  "signupdate": "2007-01-25"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|[User](#schemauser)|

## GET 查询指定用户(通过uid查询)详情

GET /info/{id}

如果不传入id,则查询所有用户

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "uid": 1,
  "nickname": "testNickname",
  "name": "Ronald Taylor",
  "status": 0,
  "signin": 27,
  "openid": null,
  "examdate": "2020-01-13",
  "examtype": "4",
  "signupdate": "1970-01-01",
  "schedule": 67
}
```

```json
{
  "detail": "Not found."
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» data|[User](#schemauser)|false|none||none|
|»» uid|integer|true|none||none|
|»» name|string|true|none||none|
|»» signin|integer|true|none||none|
|»» examtype|string|true|none||none|
|»» examdate|string|true|none||none|
|»» signupdate|string|true|none||none|

## PUT 更新用户学习计划

PUT /info/{pk}/

info/schedule/

> Body 请求参数

```json
{
  "user": 0,
  "schedual": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|
|body|body|object| 否 |none|
|» user|body|integer| 是 |none|
|» schedual|body|integer| 是 |none|

> 返回示例

> 成功

```json
{
  "uid": 1,
  "nickname": "testNickname",
  "name": "Ronald Taylor",
  "status": 0,
  "signin": 27,
  "openid": null,
  "examdate": "2020-01-13",
  "examtype": "4",
  "signupdate": "1970-01-01",
  "schedule": 65
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户/star_logged

## GET 查询收藏列表

GET /star-logged/

这个接口主要通过query参数传参;
但是可以配合过滤(query参数来获取有用的信息)

> 返回示例

> 成功

```json
{
  "count": 8,
  "next": "http://127.0.0.1:8000/user/star-logged/?page=2",
  "previous": null,
  "results": [
    {
      "id": 99,
      "spelling": "apple",
      "user": 112
    },
    {
      "id": 85,
      "spelling": "egiunvr",
      "user": 112
    },
    {
      "id": 86,
      "spelling": "app",
      "user": 112
    },
    {
      "id": 92,
      "spelling": "bar",
      "user": 112
    },
    {
      "id": 98,
      "spelling": "bar",
      "user": 112
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» count|string|false|none||none|
|» next|string|false|none||none|
|» previous|null|false|none||none|
|» results|[[Star](#schemastar)]|false|none||none|
|»» id|integer|true|none||收藏条目id|
|»» spelling|string|true|none||单词拼写|
|»» user|integer|true|none||用户id|

## POST 收藏单词

POST /star-logged/

借助于session,(登录状态下,不需要手动传入user id,
正确用法:post:将需要传入的数据写入到body中,发送

> Body 请求参数

```json
{
  "spelling": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» spelling|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 99,
  "spelling": "apple",
  "user": 112
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|[Star](#schemastar)|

### 返回数据结构

## DELETE 删除收藏单词

DELETE /star-logged/

这个接口主要通过query参数传参;
但是可以配合过滤(query参数来获取有用的信息)

> Body 请求参数

```json
{
  "spelling": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» spelling|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "msg": "delete success"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|删除成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» count|string|false|none||none|
|» next|string|false|none||none|
|» previous|null|false|none||none|
|» results|[[Star](#schemastar)]|false|none||none|
|»» id|integer|true|none||收藏条目id|
|»» spelling|string|true|none||单词拼写|
|»» user|integer|true|none||用户id|

## GET 根据收藏id查询收藏详情(deprecated)

GET /star/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户/star(no_log)

## POST 收藏单词

POST /star/

正确用法:post:将需要传入的数据写入到body中,发送
错误用法(get):bad: `user/{uid}/star/{word}`

> Body 请求参数

```json
{
  "user": 0,
  "spelling": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» user|body|integer| 是 |none|
|» spelling|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 5,
  "spelling": "ziuuqgvyyp",
  "user": 1
}
```

```json
{
  "id": 100,
  "spelling": "apple",
  "user": 112
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|[Star](#schemastar)|

## GET 查询收藏列表

GET /star/

这个接口主要通过query参数传参;
但是可以配合过滤(query参数来获取有用的信息)

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user|query|string| 否 |查询用户1所有收藏记录|
|spelling|query|string| 否 |该单词被收藏的情况|
|search|query|string| 否 |正则搜索|

> 返回示例

> 成功

```json
{
  "data": [
    {
      "spelling": "atjxutl"
    },
    {
      "spelling": "shodjrb"
    },
    {
      "spelling": "merg"
    }
  ]
}
```

```json
{
  "next": "dolor do ex in",
  "results": [
    {
      "id": 1,
      "spelling": "qtrd",
      "user": 17
    },
    {
      "id": 8,
      "spelling": "zqgur",
      "user": 11
    }
  ],
  "count": 56,
  "previous": null
}
```

```json
{
  "count": 80,
  "next": "http://127.0.0.1:8000/user/star/?page=2&search=&spelling=&user=",
  "previous": null,
  "results": [
    {
      "id": 1,
      "spelling": "second",
      "user": 13
    },
    {
      "id": 2,
      "spelling": "video",
      "user": 13
    },
    {
      "id": 3,
      "spelling": "defeat",
      "user": 13
    },
    {
      "id": 4,
      "spelling": "subm",
      "user": 22
    },
    {
      "id": 5,
      "spelling": "egiunvr",
      "user": 23
    }
  ]
}
```

```json
{
  "count": 3,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "spelling": "second",
      "user": 13
    },
    {
      "id": 2,
      "spelling": "video",
      "user": 13
    },
    {
      "id": 3,
      "spelling": "defeat",
      "user": 13
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» count|string|false|none||none|
|» next|string|false|none||none|
|» previous|null|false|none||none|
|» results|[[Star](#schemastar)]|false|none||none|
|»» id|integer|true|none||收藏条目id|
|»» spelling|string|true|none||单词拼写|
|»» user|integer|true|none||用户id|

## DELETE 删除收藏单词

DELETE /star/{pk}/

这个接口主要通过path参数传参;

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|
|body|body|object| 否 |none|

> 返回示例

> 成功

```json
{
  "detail": "Not found."
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|string|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|删除成功|Inline|

### 返回数据结构

# 用户/history

## GET 查询用户的查词记录

GET /history/

- 使用query参数进行查询

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user|query|string| 否 |查询用户1的所有查词记录|

> 返回示例

> 成功

```json
{
  "historyList": [
    {
      "wordSpelling": "evh"
    },
    {
      "wordSpelling": "udhrxc"
    }
  ]
}
```

```json
{
  "historyList": []
}
```

```json
{
  "historyList": [
    {
      "user": 3,
      "spelling": "wsbcmtjoxy"
    },
    {
      "user": 5,
      "spelling": "ymksmvknk"
    },
    {
      "user": 4,
      "spelling": "ssuvrl"
    },
    {
      "user": 5,
      "spelling": "ace"
    },
    {
      "user": 3,
      "spelling": "nbxsqlxn"
    }
  ]
}
```

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 7,
      "spelling": "etb",
      "user": 3
    },
    {
      "id": 9,
      "spelling": "jeibevvnpz",
      "user": 3
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» count|integer|false|none||none|
|» next|null|false|none||none|
|» previous|null|false|none||none|
|» results|[object]|false|none||none|
|»» id|integer|true|none||none|
|»» spelling|string|true|none||none|
|»» user|integer|true|none||none|

## POST 添加一条搜索记录

POST /history/

> Body 请求参数

```json
{
  "user": 0,
  "spelling": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[WordSearchHistory](#schemawordsearchhistory)| 否 |none|

> 返回示例

> created!

```json
{
  "user": 1,
  "spelling": "usttkh"
}
```

```json
[
  {
    "spelling": "ztwuwnyoc"
  },
  {
    "spelling": "wxbiq"
  },
  {
    "spelling": "pnvh"
  },
  {
    "spelling": "osbnlhiklw"
  },
  {
    "spelling": "scpaltgo"
  }
]
```

```json
{
  "id": 69,
  "spelling": "fpbioyemt",
  "user": 4
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|created!|[Study](#schemastudy)|

# 用户/extra

## GET 查询学习进度 logged

GET /info/progress/{examtype}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "user": 112,
  "examtype": "4",
  "progress": 15
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» progress|integer|true|none||none|

## PUT 修改考试类型_logged

PUT /info/examtype/

修改考试类型

> Body 请求参数

```json
{
  "examtype": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» examtype|body|string| 否 |none|

> 返回示例

> 成功

```json
{
  "msg": "ok"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|成功|Inline|

### 返回数据结构

## PUT 签到天数加一

PUT /info/{pk}/signin/

> Body 请求参数

```json
{
  "signin": 9009
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|
|body|body|object| 否 |none|
|» signin|body|integer| 是 |none|

> 返回示例

> 成功

```json
{
  "uid": 2,
  "nickname": "testNickname",
  "name": "create0000_pyt_er",
  "signin": 9013,
  "examtype": "4",
  "examdate": "1970-01-01",
  "signupdate": "1970-01-01"
}
```

```json
{
  "uid": 1,
  "nickname": "testNickname",
  "name": "Ronald Taylor",
  "status": 0,
  "signin": 28,
  "openid": null,
  "examdate": "2020-01-13",
  "examtype": "4",
  "signupdate": "1970-01-01",
  "schedule": 65
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» uid|integer|true|none||none|
|» nickname|string|true|none||none|
|» name|string|true|none||none|
|» signin|integer|true|none||none|
|» examtype|string|true|none||none|
|» examdate|string|true|none||none|
|» signupdate|string|true|none||none|

## POST 问题反馈

POST /user/feedback/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "data": "minim laborum dolor commodo"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» data|string|true|none||none|

## GET 当前用户超过多少用户(排名占比)

GET /info/{pk}/rank/

指标为坚持学习的天数

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "rank": 42,
  "percentage": 0.27450980392156865,
  "singin": 28
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 考试时间倒计时

GET /timer-days/

- 原本通过url参数{uid}来传递
- 现在,采用登录状态后的session字段来获取用户信息,在后台自动的处理uid.

> 返回示例

> 成功

```json
{
  "days_remain": 432
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» days_remain|integer|true|none||none|

## GET 查询学习进度_separate

GET /info/{pk}/progress/{examtype}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|
|examtype|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "progress": 448
}
```

```json
{
  "user": 1,
  "examtype": "neep",
  "progress": 4
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» progress|integer|true|none||none|

# 用户/review

## GET 用户的全局复习列表(推荐复习)_separate

GET /info/{pk}/review/global/{examtype}

- 主要依据是熟练度
- 不限制初次学习的时间

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pk|path|string| 是 |none|
|examtype|path|string| 是 |none|

> 返回示例

> 成功

```json
[
  {
    "id": 6,
    "last_see_datetime": "2022-06-09T04:37:37.593018Z",
    "familiarity": 0,
    "user": 4,
    "user_name": "testScriptUser",
    "wid": 2,
    "spelling": "abide"
  },
  {
    "id": 9,
    "last_see_datetime": "2022-05-15T14:17:59.604789Z",
    "familiarity": 4,
    "user": 4,
    "user_name": "testScriptUser",
    "wid": 3,
    "spelling": "abnormal"
  },
  {
    "id": 12,
    "last_see_datetime": "2022-05-15T15:26:30.770387Z",
    "familiarity": 4,
    "user": 4,
    "user_name": "testScriptUser",
    "wid": 4,
    "spelling": "above"
  },
  {
    "id": 14,
    "last_see_datetime": "2022-05-15T15:29:45.367310Z",
    "familiarity": 1,
    "user": 4,
    "user_name": "testScriptUser",
    "wid": 14,
    "spelling": "accidental"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|[[Study](#schemastudy)]|false|none||none|
|» id|integer|false|none||none|
|» wid|integer|false|none||none|
|» last_see_datetime|string|false|none||none|
|» familiarity|integer|false|none||none|
|» user|integer|false|none||none|
|» examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

# 用户/review/login_review

## GET 用户的全局复习列表(推荐复习)_aggregate

GET /info/review/global/

- 主要依据是熟练度
- 不限制初次学习的时间

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|examtype|query|string| 否 |none|

> 返回示例

> 成功

```json
[
  {
    "id": 2,
    "last_see_datetime": "2022-05-15T14:52:16.796170Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 3,
    "last_see_datetime": "2022-05-15T12:26:34.939649Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 11,
    "last_see_datetime": "2022-05-15T15:00:50.451619Z",
    "familiarity": 1,
    "user": 3,
    "wid": 2
  },
  {
    "id": 21,
    "last_see_datetime": "2022-05-16T06:54:04.461780Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 22,
    "last_see_datetime": "2022-05-20T00:18:22.888060Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 23,
    "last_see_datetime": "2022-05-20T00:21:41.204381Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 24,
    "last_see_datetime": "2022-05-20T00:43:53.938043Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 25,
    "last_see_datetime": "2022-05-20T00:44:47.862966Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 26,
    "last_see_datetime": "2022-05-20T00:45:31.044283Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 27,
    "last_see_datetime": "2022-05-20T00:55:46.312834Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 28,
    "last_see_datetime": "2022-05-20T01:00:50.078922Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 29,
    "last_see_datetime": "2022-05-20T01:04:56.426746Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 30,
    "last_see_datetime": "2022-05-20T01:29:39.040639Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  },
  {
    "id": 31,
    "last_see_datetime": "2022-05-20T11:43:27.431639Z",
    "familiarity": 4,
    "user": 3,
    "wid": 4
  }
]
```

```json
[
  {
    "id": 6,
    "last_see_datetime": "2022-06-06T05:57:44.213902Z",
    "examtype": "4",
    "familiarity": 3,
    "user": 112,
    "user_name": "cxxu",
    "wid": 65,
    "spelling": "actress"
  },
  {
    "id": 7,
    "last_see_datetime": "2022-06-06T05:58:40.866844Z",
    "examtype": "4",
    "familiarity": 3,
    "user": 112,
    "user_name": "cxxu",
    "wid": 645,
    "spelling": "cap"
  },
  {
    "id": 10,
    "last_see_datetime": "2022-06-06T08:31:50.723538Z",
    "examtype": "4",
    "familiarity": 1,
    "user": 112,
    "user_name": "cxxu",
    "wid": 85,
    "spelling": "adolescent"
  },
  {
    "id": 11,
    "last_see_datetime": "2022-06-09T03:34:55.600855Z",
    "examtype": "4",
    "familiarity": 2,
    "user": 112,
    "user_name": "cxxu",
    "wid": 1,
    "spelling": "abandon"
  },
  {
    "id": 14,
    "last_see_datetime": "2022-06-09T09:44:42.778349Z",
    "examtype": "4",
    "familiarity": 0,
    "user": 112,
    "user_name": "cxxu",
    "wid": 41,
    "spelling": "account"
  },
  {
    "id": 18,
    "last_see_datetime": "2022-06-09T11:50:34.181141Z",
    "examtype": "4",
    "familiarity": 0,
    "user": 112,
    "user_name": "cxxu",
    "wid": 11,
    "spelling": "abrupt"
  },
  {
    "id": 20,
    "last_see_datetime": "2022-06-09T11:51:30.646249Z",
    "examtype": "4",
    "familiarity": 0,
    "user": 112,
    "user_name": "cxxu",
    "wid": 53,
    "spelling": "acquaintance"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|[[Study](#schemastudy)]|false|none||none|
|» id|integer|false|none||none|
|» wid|integer|false|none||none|
|» last_see_datetime|string|false|none||none|
|» familiarity|integer|false|none||none|
|» user|integer|false|none||none|
|» examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

## GET 获取最近学过的单词列表_aggregate

GET /info/review/recently/

- 目前支持path参数(后期打算废弃)
- 正在开发query参数支持(更加灵活)

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|unit|query|string| 否 |none|
|value|query|string| 否 |如果长时间没有学习,给列表可能为空(尤其是value不够大的时候)|
|examtype|query|string| 否 |考试类型|

> 返回示例

> 成功

```json
[
  {
    "id": 6,
    "last_see_datetime": "2022-06-06T05:57:44.213902Z",
    "examtype": "4",
    "familiarity": 3,
    "user": 112,
    "user_name": "cxxu",
    "wid": 65,
    "spelling": "actress"
  },
  {
    "id": 7,
    "last_see_datetime": "2022-06-06T05:58:40.866844Z",
    "examtype": "4",
    "familiarity": 3,
    "user": 112,
    "user_name": "cxxu",
    "wid": 645,
    "spelling": "cap"
  },
  {
    "id": 10,
    "last_see_datetime": "2022-06-06T08:31:50.723538Z",
    "examtype": "4",
    "familiarity": 1,
    "user": 112,
    "user_name": "cxxu",
    "wid": 85,
    "spelling": "adolescent"
  },
  {
    "id": 11,
    "last_see_datetime": "2022-06-09T03:34:55.600855Z",
    "examtype": "4",
    "familiarity": 2,
    "user": 112,
    "user_name": "cxxu",
    "wid": 1,
    "spelling": "abandon"
  },
  {
    "id": 14,
    "last_see_datetime": "2022-06-09T09:44:42.778349Z",
    "examtype": "4",
    "familiarity": 0,
    "user": 112,
    "user_name": "cxxu",
    "wid": 41,
    "spelling": "account"
  },
  {
    "id": 18,
    "last_see_datetime": "2022-06-09T11:50:34.181141Z",
    "examtype": "4",
    "familiarity": 0,
    "user": 112,
    "user_name": "cxxu",
    "wid": 11,
    "spelling": "abrupt"
  },
  {
    "id": 20,
    "last_see_datetime": "2022-06-09T11:51:30.646249Z",
    "examtype": "4",
    "familiarity": 0,
    "user": 112,
    "user_name": "cxxu",
    "wid": 53,
    "spelling": "acquaintance"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|记录不存在|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|[[Study](#schemastudy)]|false|none||none|
|» id|integer|false|none||none|
|» wid|integer|false|none||none|
|» last_see_datetime|string|false|none||none|
|» familiarity|integer|false|none||none|
|» user|integer|false|none||none|
|» examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

# 数据模型

<h2 id="tocS_Star">Star</h2>

<a id="schemastar"></a>
<a id="schema_Star"></a>
<a id="tocSstar"></a>
<a id="tocsstar"></a>

```json
{
  "id": 0,
  "spelling": "string",
  "user": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|true|none||收藏条目id|
|spelling|string|true|none||单词拼写|
|user|integer|true|none||用户id|

<h2 id="tocS_Study">Study</h2>

<a id="schemastudy"></a>
<a id="schema_Study"></a>
<a id="tocSstudy"></a>
<a id="tocsstudy"></a>

```json
{
  "id": 0,
  "wid": 0,
  "last_see_datetime": "string",
  "familiarity": 0,
  "user": 0,
  "examtype": "4"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|wid|integer|false|none||none|
|last_see_datetime|string|false|none||none|
|familiarity|integer|false|none||none|
|user|integer|false|none||none|
|examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

<h2 id="tocS_UserUpdate">UserUpdate</h2>

<a id="schemauserupdate"></a>
<a id="schema_UserUpdate"></a>
<a id="tocSuserupdate"></a>
<a id="tocsuserupdate"></a>

```json
{
  "name": "string",
  "examtype": "string",
  "examdate": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|name|string|false|none||none|
|examtype|string|false|none||none|
|examdate|string|false|none||none|

<h2 id="tocS_WordMatcher">WordMatcher</h2>

<a id="schemawordmatcher"></a>
<a id="schema_WordMatcher"></a>
<a id="tocSwordmatcher"></a>
<a id="tocswordmatcher"></a>

```json
{
  "id": 0,
  "spelling": "string",
  "char_set_str": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|true|none||none|
|spelling|string|true|none||none|
|char_set_str|string|true|none||none|

<h2 id="tocS_WordNote">WordNote</h2>

<a id="schemawordnote"></a>
<a id="schema_WordNote"></a>
<a id="tocSwordnote"></a>
<a id="tocswordnote"></a>

```json
{
  "user": 0,
  "spelling": "string",
  "content": "string",
  "difficulty_rate": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user|integer|true|none||none|
|spelling|string|true|none||none|
|content|string|true|none||none|
|difficulty_rate|integer|true|none||none|

<h2 id="tocS_ExamType">ExamType</h2>

<a id="schemaexamtype"></a>
<a id="schema_ExamType"></a>
<a id="tocSexamtype"></a>
<a id="tocsexamtype"></a>

```json
{
  "examtype": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|examtype|string|true|none||none|

<h2 id="tocS_DRF_List">DRF_List</h2>

<a id="schemadrf_list"></a>
<a id="schema_DRF_List"></a>
<a id="tocSdrf_list"></a>
<a id="tocsdrf_list"></a>

```json
{
  "count": 0,
  "next": "string",
  "previous": "string",
  "results": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|count|integer|false|none||none|
|next|string|false|none||none|
|previous|string|false|none||none|
|results|[string]|false|none||none|

<h2 id="tocS_WordReqSum">WordReqSum</h2>

<a id="schemawordreqsum"></a>
<a id="schema_WordReqSum"></a>
<a id="tocSwordreqsum"></a>
<a id="tocswordreqsum"></a>

```json
{
  "examtype": "cet4",
  "sum": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|examtype|string|true|none||4/6/8(neep)|
|sum|integer|true|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|cet4|
|examtype|cet6|
|examtype|neep|

<h2 id="tocS_WordUltra">WordUltra</h2>

<a id="schemawordultra"></a>
<a id="schema_WordUltra"></a>
<a id="tocSwordultra"></a>
<a id="tocswordultra"></a>

```json
{
  "wordSpelling": "string",
  "phonetic": "string",
  "basicExplain": "string",
  "webMeaning": [
    "string"
  ],
  "forms": {
    "pl": "string",
    "past": null,
    "pastParticiple": null,
    "presentParticiple": null
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|wordSpelling|string|false|none||none|
|phonetic|string|false|none||none|
|basicExplain|string|false|none||none|
|webMeaning|[string]|false|none||none|
|forms|object|false|none||none|
|» pl|string|true|none||none|
|» past|null|true|none||none|
|» pastParticiple|null|true|none||none|
|» presentParticiple|null|true|none||none|

<h2 id="tocS_User">User</h2>

<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>

```json
{
  "uid": 0,
  "name": "string",
  "signin": 0,
  "examtype": "string",
  "examdate": "string",
  "signupdate": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|uid|integer|true|none||none|
|name|string|true|none||none|
|signin|integer|true|none||none|
|examtype|string|true|none||none|
|examdate|string|true|none||none|
|signupdate|string|true|none||none|

<h2 id="tocS_UserSignUp">UserSignUp</h2>

<a id="schemausersignup"></a>
<a id="schema_UserSignUp"></a>
<a id="tocSusersignup"></a>
<a id="tocsusersignup"></a>

```json
{
  "name": "string",
  "examtype": "string",
  "examdate": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|name|string|true|none||none|
|examtype|string|false|none||none|
|examdate|string|true|none||none|

<h2 id="tocS_WordNote1">WordNote1</h2>

<a id="schemawordnote1"></a>
<a id="schema_WordNote1"></a>
<a id="tocSwordnote1"></a>
<a id="tocswordnote1"></a>

```json
{
  "uid": 0,
  "spelling": "string",
  "content": "string",
  "difficulty_rate": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|uid|integer|true|none||none|
|spelling|string|true|none||none|
|content|string|true|none||none|
|difficulty_rate|integer|false|none||none|

<h2 id="tocS_User_login">User_login</h2>

<a id="schemauser_login"></a>
<a id="schema_User_login"></a>
<a id="tocSuser_login"></a>
<a id="tocsuser_login"></a>

```json
{
  "account": "string",
  "password": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|account|string|true|none||none|
|password|string|true|none||none|

<h2 id="tocS_UserSignupPassword">UserSignupPassword</h2>

<a id="schemausersignuppassword"></a>
<a id="schema_UserSignupPassword"></a>
<a id="tocSusersignuppassword"></a>
<a id="tocsusersignuppassword"></a>

```json
{
  "name": "string",
  "examtype": "string",
  "examdate": "string",
  "password": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|name|string|true|none||none|
|examtype|string|false|none||none|
|examdate|string|true|none||none|
|password|string|true|none||none|

<h2 id="tocS_StudyUpdate">StudyUpdate</h2>

<a id="schemastudyupdate"></a>
<a id="schema_StudyUpdate"></a>
<a id="tocSstudyupdate"></a>
<a id="tocsstudyupdate"></a>

```json
{
  "wid": 0,
  "familiarity": 0,
  "user": 0,
  "examtype": "4"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|wid|integer|false|none||none|
|familiarity|integer|false|none||none|
|user|integer|false|none||none|
|examtype|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|examtype|4|
|examtype|6|
|examtype|8|

<h2 id="tocS_Word">Word</h2>

<a id="schemaword"></a>
<a id="schema_Word"></a>
<a id="tocSword"></a>
<a id="tocsword"></a>

```json
{
  "wid": 0,
  "spelling": "string",
  "phonetic": "əˈpiːl",
  "plurality": "string",
  "thirdpp": "string",
  "present_participle": "string",
  "past_tense": "string",
  "past_participle": "string",
  "explains": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|wid|integer|true|none||none|
|spelling|string|true|none||none|
|phonetic|string|false|none||none|
|plurality|string|false|none||none|
|thirdpp|string|false|none||none|
|present_participle|string|false|none||none|
|past_tense|string|false|none||none|
|past_participle|string|false|none||none|
|explains|string|false|none||none|

<h2 id="tocS_WordSearchHistory">WordSearchHistory</h2>

<a id="schemawordsearchhistory"></a>
<a id="schema_WordSearchHistory"></a>
<a id="tocSwordsearchhistory"></a>
<a id="tocswordsearchhistory"></a>

```json
{
  "user": 0,
  "spelling": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user|integer|true|none||none|
|spelling|string|true|none||none|

<h2 id="tocS_Progress">Progress</h2>

<a id="schemaprogress"></a>
<a id="schema_Progress"></a>
<a id="tocSprogress"></a>
<a id="tocsprogress"></a>

```json
{
  "examtyep": "string",
  "progress": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|examtyep|string|true|none||none|
|progress|integer|true|none||none|

<h2 id="tocS_SearchHistory">SearchHistory</h2>

<a id="schemasearchhistory"></a>
<a id="schema_SearchHistory"></a>
<a id="tocSsearchhistory"></a>
<a id="tocssearchhistory"></a>

```json
{
  "id": 0,
  "spelling": "string",
  "user": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|true|none||none|
|spelling|string|true|none||none|
|user|integer|true|none||none|



# 五、数据库设计 [徐超信]

> 数据库是本项目的重要内容,共有9张表

## 持久化数据

- 本项目中,需要持久化的数据包括
  - 词典(单词的各个属性)
  - 三种考试科目考纲词汇列表
  - 用户信息
  - 用户的学习记录和学习情况
  - 用户的问题反馈记录
  - 用户的收藏
  - 用户的查词记录
  - 用户的评论记录(批注)
  - 等其他附加信息

## 数据库的选择

- 数据库方面,我们希望采用具有如下特点的数据库软件:
  - 当下流行的
  - 易用的
  - 参考资料丰富的
  - 免费的
  - 跨平台的
- 由于我们有关系型数据库的理论基础,对此会更加熟悉一些,因此我们考虑在关系型数据库中选择一款数据库软件
- 在具体选择数据库的时候,我们考虑过
  - postgre数据库(先进,功能完备,django首推的生产环境数据库)
  - mysql数据库(小巧,速度快)
- 两者都是可以免费使用,但基于资料的丰富程度,和现有的教程,我们选择了mysql

## ER关系图

![ER](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesER.svg)
图5.1 ER关系图
## 创建数据库时的考虑



- 将不同考试类型的词汇大纲怎么处理

  - 放在不同表

    - 字段最少(结构最简单)
    - 但是需要管理的表数量变多,而且结构重复,编写接口的时候有一定重复

  - 放在一张表

    - 为每个单词增加字段
      - 一个字段
        - 多个值:一个单词可能属于多个考试考纲中的词汇)(4,6,8,46,68,...)
        - 字段单个值,拆分为多条记录:在一条记录的同一个字段有个取值时,将其拆分为多条记录加以存放
      - 多个字段:
        - 分别设置cet4/cet6/neep字段,如果某个单词属于该字段,那么为其取bool值true(1)

    > - 主属性采用原主键+多值的那个字段构成多字段主键

  - 收藏表和搜索记录表是否分开放

    - 两个表结构相似
  - 但是考虑到各自的可独立扩展性,本项目将其拆分



> 基于如下考虑,我决定不拆分word表(将词形(诸如past tense/presentParticiple/pastParticiple))从而提高查询效率



-  复杂表的优缺点

  - 优点：包含全部字段的表，在查询时避免了连表查询，程序处理起来比方便，有时候某些表会加进一些冗余字段，也就是为了避免连表查询。查询的效率方面有优势。

  -  缺点：如果字段里面有大字段（text,blob)类型的，而且这些字段的访问并不多，这时候放在一起就变成缺点了。 

- 简单表(字段简单的表)

  - 更可能符合更高的范式

  - MYSQL数据库的记录存储是按行存储的，数据块大小又是固定的（16K），**每条记录越小**，存储块内存储的记录就越多。此时应该把大字段拆走，这样**应付大部分小字段的查询时，就能提高效率**。

  - 当需要查询大字段时，此时的关联查询是不可避免的，但也是值得的。

  - 拆分开后，对字段的UPDATE就要UPDATE多个表了

  - 用于查询和展示的 不建议分表， 

  - 若只是存储数据，可以考虑分表。

  

## 各个模块下的表设计

## User用户模块



### 用户表



```sql
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| uid           | int(11)      | NO   | PRI | NULL    | auto_increment |
| name          | varchar(250) | NO   |     | NULL    |                |
| signIn        | int(11)      | NO   |     | NULL    |                |
| examType      | varchar(1)   | NO   |     | NULL    |                |
| examDate      | date         | NO   |     | NULL    |                |
| signUpDate    | date         | NO   |     | NULL    |                |
| openid        | varchar(150) | YES  | UNI | NULL    |                |
| password_hash | varchar(250) | NO   |     | NULL    |                |
| password_salt | varchar(250) | NO   |     | NULL    |                |
| status        | int(11)      | NO   |     | NULL    |                |
| schedule      | int(11)      | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
11 rows in set
```

### 查词记录

```sql
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | bigint(20)  | NO   | PRI | NULL    | auto_increment |
| spelling | varchar(25) | NO   |     | NULL    |                |
| user_id  | int(11)     | NO   | MUL | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set
```

### 单词收藏表

```sql
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | bigint(20)  | NO   | PRI | NULL    | auto_increment |
| spelling | varchar(25) | NO   |     | NULL    |                |
| user_id  | int(11)     | NO   | MUL | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set
```



### 反馈表

- 由于不是所有用户都会做反馈,为了减少冗余,我们将反馈表单独拆分出来

```sql
root@localhost [Sat Jun  4 20:56:41 2022 23 ela4]> desc feed_back;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| content | varchar(255) | NO   |     | NULL    |                |
| date    | datetime(6)  | NO   |     | NULL    |                |
| user_id | int(11)      | NO   | MUL | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
4 rows in set
```





## words(词典/记单词模块)模块

### 单词表

* 词典表

* ```sql
  +--------------------+--------------+------+-----+---------+----------------+
  | Field              | Type         | Null | Key | Default | Extra          |
  +--------------------+--------------+------+-----+---------+----------------+
  | wid                | int(11)      | NO   | PRI | NULL    | auto_increment |
  | spelling           | varchar(255) | NO   |     | NULL    |                |
  | phonetic           | varchar(255) | YES  |     | NULL    |                |
  | plurality          | varchar(255) | YES  |     | NULL    |                |
  | thirdpp            | varchar(255) | YES  |     | NULL    |                |
  | present_participle | varchar(255) | YES  |     | NULL    |                |
  | past_tense         | varchar(255) | YES  |     | NULL    |                |
  | past_participle    | varchar(255) | YES  |     | NULL    |                |
  | explains           | longtext     | YES  |     | NULL    |                |
  +--------------------+--------------+------+-----+---------+----------------+
  9 rows in set (0.32 sec)
  ```

- 字段描述:其中
  - wid作为主键,表示词汇序号
  - thirdpp为单词第三人称单数
  - past_tense为动词过去式
  - past_participle为动词过去分词
  - explains作为单词中文解释

### 词典拼写分析( word_matcher)

```sql
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| spelling     | varchar(255) | NO   |     | NULL    |                |
| char_set_str | varchar(26)  | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
3 rows
```

- 该表辅助模糊匹配算法的实现
- char_set_str是构成单词的字符集合,类型为字符串



### 单词批注

```sql
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| id              | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| content         | varchar(255) | YES  |     | NULL    |                |
| spelling        | varchar(255) | YES  |     | NULL    |                |
| UID             | int(11)      | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set
```

> - 原本想要使用一个`difficalty_rate`难度投票字段,来丰富用户的交互,但是后来发现这样不实用
> - 遂采用后台统计的平均熟练度来表征应该更为准确.

- 此表用户记录用户在单词下的留言批注
- content是留言内容
- spelling是被留言的单词

### 词汇大纲表

> - 在单词(释义)表(词典)之外,我们另外建立了考试大纲词汇的索引数据库(大纲单词索引)
> - 有三张表使用了相同的结构
>

```sql
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| wordOrder | int(11)      | NO   | PRI | NULL    | auto_increment |
| spelling  | varchar(255) | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
2 rows in set
```

- 字段wordOrder用来充当该表的主键
- 原本打算使用spelling直接作为主键,然而,mysql默认不区分大小写,会导致某些词汇发生冲突;
- 虽然可以配置mysql强制区分大小写,但是Django文档指出,这可能会引发意料之外的问题,故采用了需要来作为主键



## scoreImprover(复习&测验)模块

### 学习记录表

> 本表将所有用户的所有考试类型的学习记录都整合起来,方便管理和分析数据

```sql
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| last_see_datetime | datetime(6) | YES  |     | NULL    |                |
| familiarity       | int(11)     | NO   |     | NULL    |                |
| examType          | varchar(1)  | NO   |     | NULL    |                |
| user_id           | int(11)     | NO   | MUL | NULL    |                |
| wid_id            | int(11)     | NO   | MUL | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
6 rows in set (0.17 sec)
```

- 根据ER图表示上看,学习记录是一个多对多的关系,对于每个科目下都可以产生一个学习记录表
- 但是表的结构上看,如果每个科目一个表,那么就会有三张结构一致的表,这显得不那么有利于后台开发
- 所为了方便管理,我们将不同的科目不同用户的学习记录聚合到一张表上并且用一个字段examType来区分每条记录时属于哪个科目下的学习记录

## 数据相关技术

- 我们采用django框架提供的ORM来操作数据,这使得后端代码的更加具有通用性,相对于编写原生的SQL语句,使用更加通用和专业的编程语言会更加开发上的有效率优势和维护优势
- 此外,django提供了强大的数据库迁移功能,当数据模型发生变化时,数据库迁移`migrations&migrate`操作可以将模型的修改同步反映到数据库表的修改
- 数据库迁移的另一大好处是,可以和代码版本控制相互配合,实现整整的整个项目上的版本控制
- 当代码回滚到早期的版本是,数据库结构也需要回滚到相兼容的版本,否则项目可能直接无法运行起来
- 另一方面,django自带的ORM操作还比较初级,我们选用了基于Django的子框架DRF来提高数据库操作相关的编码效率和数据安全性检查,
- 特别是,对于大量数据查询操作返回的结果的分页功能的实现上,使用DRF会比原生的django分页更加合适前后端分离的项目

# 六、微信小程序端的实现 [潘淼森]

> 这部分分模块来描述前端的具体实现，比如：

- vant app 组件+微信小程序

## 6.1 登录登出功能的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。

<img src="https://img-blog.csdnimg.cn/335d26fb8ba74397a42ddcd1db6a39e1.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.1.1



<img src="https://img-blog.csdnimg.cn/07bc0df6722a4d34a41ae4b46028e4eb.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.1.2



<img src="https://img-blog.csdnimg.cn/ab7571f4a11a41ff860c15f37cd5139f.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.1.3



## 6.2 查词功能的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。



1.如果数据库中未找到则显示未找到相关内容

<img src="https://img-blog.csdnimg.cn/b7e5234012314390a4548018f0dcb811.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.2.1
2.如果输入正确

<img src="https://img-blog.csdnimg.cn/011f5a30d6dc49c1af82a6bcbe26d707.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.2.2

<img src="https://img-blog.csdnimg.cn/65ff17ea489d466e9fb73e0bf02e7947.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.2.3
<img src="https://img-blog.csdnimg.cn/3a51c0d4f3854e859c260e7c475876c7.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.2.4
<img src="https://img-blog.csdnimg.cn/e9e9feaa414e458090afbab420ff7c6f.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.2.5


## 6.3 学单词功能的实现

左滑右滑实现翻页，翻到第一页再往前翻会提示

<img src="https://img-blog.csdnimg.cn/51e868097d7e4a5393a72948e187b2a8.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.3.1
<img src="https://img-blog.csdnimg.cn/920924aa1e1b41abbc2f1c74baa1ec86.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.3.2
<img src="https://img-blog.csdnimg.cn/5ab5bd57fdf942cc8ecd05531c67b562.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.3.3
难度评价打分

<img src="https://img-blog.csdnimg.cn/cab3373d433d4b11a48c44abc80b3aca.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.3.4
添加批注

<img src="https://img-blog.csdnimg.cn/291ca656070c401bbcec36370ac4106d.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.3.5
<img src="https://img-blog.csdnimg.cn/a6d922da2aab445f96c434ddb6f41e5f.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.3.6
<img src="https://img-blog.csdnimg.cn/855a8d37be6748b0aa27ce45e9e2f43f.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.3.7





## 6.4 查考纲功能的实现

<img src="https://img-blog.csdnimg.cn/55aabd4ea0304a9390812f3f4a4d1fe5.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.4.1

<img src="https://img-blog.csdnimg.cn/06556ba4c4f746078fbfafb9746fe5c9.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.4.2





<img src="https://img-blog.csdnimg.cn/0cbb554de1724c8988e5772175898d2b.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.4.3


## 6.5 计算ddl功能的实现

<img src="https://img-blog.csdnimg.cn/ab7571f4a11a41ff860c15f37cd5139f.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.5.1


<img src="https://img-blog.csdnimg.cn/5d8a6c3d24c84863bf436418f7aa050b.png" alt="image-20220607201359428" style="zoom:50%;" />

图6.5.2

<img src="https://img-blog.csdnimg.cn/1581772b39d9473b8c3cb50501a08430.png" alt="image-20220607201359428" style="zoom:50%;" />
图6.5.3
## 6.6 反馈建议&在线客服功能的实现

<img src="https://img-blog.csdnimg.cn/d95df938405d4162bb1d950129a6740d.jpeg" alt="image-20220607201359428" style="zoom:20%;" />
图6.6.1
<img src="https://img-blog.csdnimg.cn/8db86656eed0474abb7319fa52eefa45.jpeg" alt="image-20220607201359428" style="zoom:20%;" />
图6.6.2
# 七、英语助手后端的实现[徐超信]

> 这部分也是分模块来展示后端的实现方案。具体参见前面第六部分。

> 这部分分模块来描述后端的具体实现，比如：

## 7.1 查词功能的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。

- 查词功能是本程序的首页模块的功能,类似于词典
- 我们通过python+pandas从有道词典的接口爬取了13k单词,每个单词都具有
  - 中文释义
  - 音标
  - 5中词形(当然,名词没有过去式,动词没有复数,这种情况下都用NULL来填充字段)
  - 他们被存储在数据中,并通过ORM编写响应的查词接口,实现查词功能
- ![在这里插入图片描述](https://img-blog.csdnimg.cn/bbe7f50e67594f1899914dafae0906b0.png)
  图7.2.1:接口效果


## 7.2 学单词功能的实现
![在这里插入图片描述](https://img-blog.csdnimg.cn/a618bcbe31324b218df90b22032b5d4a.png)
图7.2.2
- 学单词功能的实现,首先要获取对应科目的考纲词汇列表,由于列表很长,所以提供了分页功能
- 值得一提的是,后端几乎为所有返会长列表(大数据量)的操作提供了分页参数,因此不在每个接口地反复说明
- 实现本功能用到地接口原理也比较简单,获取考纲列表地接口通过读取对应的科目地词汇数据库表,将他们分页返回
- 在搭配一个刷单词时更新最近刷过(见过面的)卡片的时间(last_see_datetime),用以提供后面计算复习单词列表的基础数据
### 单词平均难度指数的实现
![在这里插入图片描述](https://img-blog.csdnimg.cn/4f267651e3c041a88447cd04b48b4599.png)
图7.2.3
- 该指标是通过计算数据库中所有用户对该单词的熟练度,并计算平均值,以此来计算单词的平均难度指数
- 可以帮助用户参考准确记忆该单词的难度

7.3 复习功能的实现

![在这里插入图片描述](https://img-blog.csdnimg.cn/0bf8da54db6f45818cf502b5c0655e06.png)
图7.3.1
- 用户通过指定科目,获取系统推荐的全书范围内的熟练度不佳的单词列表

![在这里插入图片描述](https://img-blog.csdnimg.cn/2fcf70e6fadc4d9fabb75f1e69607dbb.png)
图7.3.2
- 这是另一种复习模式:根据用户近期学习的词汇,提供复习列表
- 这里使用的是UTC时间,但是不影算法效果
- 客户端可以自行指定`最近`的概念,是最近1天还是最近1小时,甚至可以指定单位和浮点数
- 算法的基本原理比较简单,首先获取用户刷单词卡片的时候的时间(后端提供了响应的刷新时间的接口)
- 然后利用最近见过单词的时间和此时的时间(用户打开复习模块刷题的时刻)做时间差,当时间差处于指定范围内时,响应的记录就会被返回,用户生成复习列表
- 前端同样可以利用本接口开发丰富的复习模式,譬如允许用户输入时间范围.
![在这里插入图片描述](https://img-blog.csdnimg.cn/5a8f3ab2f64c433f8fd4935e18f5902b.png)
图7.3.3
* 这是最后一种复习模式,用户可以将其作为抽查对全书范围内抽取的一组词汇检验,同样式借助于刷题来完成(原型设计中的四种题型)
## 7.4 模糊查词的实现
- 模糊查词(模糊匹配)的专业算法设计复杂的理论和推理知识,如果需要带有智能性,还需要人工智能技术来实现
- 本项目的匹配算法不具备智能性,但是也有一定的灵活性和实用性,具体的实现过程如下
  - django_实现朴素/基本模糊拼写候选/纠错
  - 使用到的拼写数据库支持(一角)
  - ![在这里插入图片描述](https://img-blog.csdnimg.cn/5f9e8eb80d69412582e48f433cfe825c.png)
    - 图7.4.1
  - 计算单词字符集:`char_set`,计算该属性的目的是为了实现单词间字符构成的相似性匹配
  - 处于现实效果的考虑,当用户输入的单词长度不超过4个字符时,我们只返回单词长度相同的并且字符构成一致的单词
  - 对于较长的输入,我们会允许一定比例的字符误差(譬如8个字符串长度的输入,允许波动1~2个字符),这样可以匹配到一些字母记错,字母顺序错误的情况,此外,为了使得长度合理,还我还设置了长度波动范围(也是根据比例波动(譬如25%)),这样,可以匹配到比用户拼写的单词更短一些的词汇,这种情况发生的概率较小,但是不可以完全排除
  - 后端还基于此开发了丰富的query参数,客户端可以以灵活的方式调用该接口,开发出多功能的查词功能
    - 比如,强制匹配前两个字母(startwith=2)
    - 强制匹配终结符(endwith=2)
    - 甚至,后台也提供了正则匹配的功能,但是这不太是本程序的重点目标,遂没有将前端实现出来
- 接口效果:
###  eg0:
![在这里插入图片描述](https://img-blog.csdnimg.cn/4f9b35ca1edc43fba01f0c260f671331.png)
7.4.2
### eg1:
![在这里插入图片描述](https://img-blog.csdnimg.cn/3af4a149f56c40359f688adf88783569.png)
7.4.3
###  eg2
`GEThttp://127.0.0.1:8000/word/fuzzy/fhather/1`
![在这里插入图片描述](https://img-blog.csdnimg.cn/555e35733de84570bd5f40d9fa088e96.png)
7.4.3
> 这部分主要讲点名功能的具体实现方案，可以通过用例图、流程图等来辅助说明。并通过截图来展示效果。
>
> 实现部分不要只有截图，要有文字说明，讲讲这部分实现时采用什么技术，优缺点是什么，实现难点在哪里。
## 7.5 用户中心

### 登录功能方案选型:

> [前端常见登录实现方案 + 单点登录方案 - 掘金 (juejin.cn)](https://juejin.cn/post/6933115003327217671)

- `Cookie + Session` 历史悠久，适合于简单的后端架构，需开发人员自己处理好安全问题。
- `Token` 方案对后端压力小，适合大型分布式的后端架构，但已分发出去的 `token` ，如果想收回权限，就不是很方便了。
- SSO 单点登录，适用于中大型企业，想要统一内部所有产品的登录方式的情况。
- OAuth 第三方登录，简单易用，对用户和开发者都友好，但第三方平台很多，需要选择合适自己的第三方登录平台。

> - 综合比较,我们选择第一种方案,比较符合项目定位
> - 利用session,后端可以充分利用用户的登录状态(从客户端提交过来的cookie中解析出用户信息从而帮助前端以更加简洁的参数就可以调用经过改进后的api)
> - 另一方面,提供身份认证为数据安全提供了基本保障,减少被攻击的可能
#### 登录流程

```mermaid
graph LR
star([start])-->is_logged{is logged?}-->|yes|allow_access[allow the user access the apis]
is_logged --no-->login_required[the api require the user to login]
login_required-->is_success{is success}-->|yes|allow_access
is_success-->|no|login_required
```





# 八、系统测试



## 8.1 单元测试

> 这部分是单元测试的方案，可以列表统计有多少测试，覆盖率是多少。



### 后端测试
  - 后端的测试采用django推荐的unittest来对代码进行测试
  - 在开发过程中,我们适当的使用TDD(测试驱动开发)的方式来编写了一部分api,并且认识到了TDD开发的优势
  - 编写测试需要花费一些实际,但是随着项目的体积的增长,依靠测试带来的便利就回来越显著,我们对自己的代码正确性也心中有底
  - 在编写测试的时候,主要针对以下几个方面:
    - 路由和试图函数的映射是否正确
      - 在这里做测试是因为,随着项目规模的增大,我们的代码越来越复杂,对于每一个接口都要有响应的路由,这就发生后写的路由模式和之前已有的模式发生冲突,或者相互覆盖,导致api调用的时候数据传入到错误的函数中去处理
    - 编写关于视图函数的测试,这时候需要操作临时数据库,或者在测似乎代码中模拟出一些随机的或者特定的数据,总之应该使用能够达到检查目的数据
  - 利用APIfox 来测试接口
    - apifox也提供了简单易用的批量测试接口的功能,可以在线上环境中进行测试,也可以在本地进行测试,甚至支持多线程测试和并发测试,而且统计了接口的调用次数和调用时间,比较直观
    - 本项目在开发过程中就受益于批量测试,帮助我在部分接口缺少测试的时候及时发现问题并解决


## 8.2 集成测试集
* 成测试（Integration Testing），也叫组装测试或联合测试。在单元测试的基础上，将所有模块按照设计要求（如根据结构图）组装成为子系统或系统，进行集成测试

在本项目中,我利用apifox,我定义了若干有步骤之分的测试用例,每个测试用来中可以包含多个来自接口的请求示例,并且可以调整顺序,特别是在测试登录功能的时候,依赖于登录状态的api必须要放在登录后的接口后执行,依次地完对项目地4个模块的有序测试,所有接口,基本全部通过

![image-20220610090324016](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220610090324016.png)

- 通过apifox 进行的批量自动化测试,每个几口可以又多个测试实例

![image-20220610090904377](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220610090904377.png)

- 这是通过apifox的套件测试,批量测试接口下的测试用例,并且测试保证顺序
- 报告测试结果


## 8.3 测试部署及结果

![在这里插入图片描述](https://img-blog.csdnimg.cn/4598744f2c954c0d84e8adc0bd95eb1d.png)

* 我们利用github Actions 来执行自动化测试,主要的内容是,当我从本地将项目push到github上时,我们会自动运行测试,并且将测试结果发送到我的邮箱中,这样我们就可以更加方便的了解项目的测试结果,问题和故障可以及时的得到反馈,而不需要每次在本地跑一遍所有测试,可以节约时间
* 不仅如此,团队中的其他人也可以看到测试结果

# 九、系统部署 [徐超信]


## 自动部署

- 我们通过云主机来部署我们的项目,使得后台服务可以通过公网ip能够访问
- 我们有又利用github+webhook+github Actions实现持续继承和持续交付
- 云端可以及时自动的同步本地的最新项目成果,同时能够经过Actions的检查,依赖于本项目的其他成员就可以直到新的版本情况.
### references

- [【github 自动部署】github实现自动部署 ](https://cloud.tencent.com/developer/article/1893950)

### 操作步骤

- 安装webbook

  - ```bash
    sudo apt-get install webhook
    ```

    

- 编写部署脚本deploy.sh:任务内容

  - 

  ```bash
  # cxxu @ cxxuAli in ~/backEnd on git:main x [17:53:07]
  $ cat deploy.sh
  #! /bin/bash
  cd ~/backEnd/
  #git status
  git pull origin main
  echo `date`
  echo '---------the git pull origin main ran just before---------------'
  
  ```

  强拉版本:

  ```bash
  cd /home/cxxu/backEnd/
  # ls
  # git checkout main
  git reset --hard origin/main
  git log|tail -n 10
  # git pull origin main
  git status |head -n 10
  echo `date`
  echo '----brute force pull done!(by reset --hard to the remote origin/main---)'
  ```

  

- 编写hooks.json:

  - 注意,`execute-command`:是需要运行的脚本的路径(而不是命令,譬如source .deploy.sh)是不正确的

  - `command-working-directory` 是工作目录

    - 我在实验过程中,发现,当`deploy.sh`和工作目录在同一目录下,才生效
    - 此外,为了确保脚本的可用性和正确性,在正式使用前应该手动运行一下脚本文件(可以利用`chmod +x deploy.sh`赋予脚本可执行的权限)

  - ```json
    
    [
      {
        "id": "deploy",
        "execute-command": "./deploy.sh",
        "command-working-directory": "/home/cxxu/backEnd/"
      }
    ]
    ```

- 启动服务(临时性实验)

  - 进入到`hooks.json`所在目录中(或者指定hooks.json的绝对路径)

  - ```bash
     webhook -hooks hooks.json -verbose
    ```

- 实验webhooks连接

  - 用浏览器(或者其他可以发送http请求的客户端)发送get请求`http://123.56.72.67:9000/hooks/deploy/`

  - 这时候检查主机终端,如果能够捕获到请求,并且正确执行相关脚本,那么配置成功

    

- 配置github

  - 如果上述的服务启动可以正常运行,则将上述链接添加到githhub项目仓库的webhook中(settings->webhook)

- 长期运行

  - 将webhook的输出内容重定向到log.txt文件中.

  - ```bash
     nohup webhook -hooks hooks.json -verbose >log.txt &
    ```

  - 将所有输出(包括错误输出重定向到一个文件中)

  - ```bash
    $ nohup webhook -hooks hooks.json -verbose >log.txt 2>&1 &
    [1] 29968
    
    ```

    

> 利用github+webhook,实现基本的自动部署

![image-20220606164228944](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesMqBf4Zu1VRnLovi.png)图:github&webhook

- 查看输出日志

  - ```bash
    # cxxu @ cxxuAli in ~/backEnd on git:main x [18:04:52]
    $ cat log.txt
    [webhook] 2022/06/06 16:44:39 version 2.5.0 starting
    [webhook] 2022/06/06 16:44:39 setting up os signal watcher
    [webhook] 2022/06/06 16:44:39 attempting to load hooks from hooks.json
    [webhook] 2022/06/06 16:44:39 found 1 hook(s) in file
    [webhook] 2022/06/06 16:44:39   loaded: deploy
    [webhook] 2022/06/06 16:44:39 serving hooks on http://0.0.0.0:9000/hooks/{id}
    ```

    



# 十、功能展示 [潘淼森]

- 参看演示视频附件:[video.mp4 (github.com)](https://github.com/MaterialSharing/docs/blob/main/video.mp4)

# 十一、清单 [徐超信,潘淼森]
* 项目github(组织):[MaterialSharing (github.com)](https://github.com/MaterialSharing)
> 这部分列出项目提交的清单，如：
>
> - 前端代码: Front-End
> - 后端代码: backEnd
> - 原型设计文件: docs/design/design_原型操作逻辑1.pptx
> - 项目演示视频: docs/video.mp4
> - 各种流图和思维导图文件: docs/design/
> - ……
>

# 十二、总结 [徐超信,潘淼森]

> 项目的总结，整个项目的感受以及下一步的计划。

[version control - How do I force "git pull" to overwrite local files? - Stack Overflow](https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files)

在开发本项目的过程中,我们收获了很多

- 学习,了解并实践了当下流行的开发技术,体验了规范的和相对完善的开发流程
- 培养了我们的主动学习能力,思考能力以及动手能力,为我们今后的工作学习打下了重要的基础

在开发过程中,我们同样遇到了各种问题

- 由于缺乏产品设计经验以及实战开发经验,我们小组在项目之初进度就较为落后,我们深刻的认识到,需求设计和架构设计一点也不能轻视,轻则拖慢项目开发进展,重则推导重来.
- 小组成员合理分工,沟通协商,团结一致也是分重要,不合理的分工会导致矛盾,缺乏沟通也会导致组内矛盾,影响开发效率和进度,而不团结的队伍也不利于项目的完善
- 此外还有进度安排不签当的任务复杂度估计往往会导致项目开发无法及时完成或者流程不够完善.

# 十二、参考文献 [徐超信,潘淼森]

> 系统所参考的文献或者代码，比如：
>
> - django4:[ Django: The web framework for perfectionists with deadlines https://www.djangoproject.com (google.com)](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiYp9yJ2__3AhW6qVYBHS0TCZgQFnoECBUQAQ&url=https%3A%2F%2Fwww.djangoproject.com%2F&usg=AOvVaw3E6qaJashVeeIx3oahQxD7)
> - Django Rest framework:[ Django REST framework: Home https://www.django-rest-framework.org (google.com)](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi7qJ-Y2__3AhUepVYBHbjiAPEQFnoECAcQAQ&url=https%3A%2F%2Fwww.django-rest-framework.org%2F&usg=AOvVaw0ZGmLSXHw1XKCvqteVn5f-)
> - mysql8:[MySQL :: MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
> - wechat 小程序开发文档:[微信开放文档 (qq.com)](https://developers.weixin.qq.com/miniprogram/dev/framework/)
> - vant3:[Vant 3 - 轻量、可靠的移动端组件库 (youzan.github.io)](https://youzan.github.io/vant/#/zh-CN)
> - uni-app: https://uniapp.dcloud.io/ 
> - [version control - How do I force "git pull" to overwrite local files? - Stack Overflow](https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files)
> - 



