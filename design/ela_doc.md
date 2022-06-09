---
title: 基于微信小程序的英语学习系统
author:
  - 徐超信(1935010102)
  - 潘淼森(1912190529)

description: |
  我们开发了一个基于微信小程序的英语学习助手，
  它前端采用微信小程序，后端采用Python/Django，
  实现了英语词汇的学习和复习功能
---

文档可以使用markdown编写，用[Pandoc](https://pandoc.org/)转成PDF、html或者word等格式。

# 一、项目介绍 [徐超信,潘淼森]

## 背景

> 介绍为什么要做这个项目，它解决了什么问题，实现了什么功能。

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

> 介绍项目主要有哪些功能需求，需要实现什么样的功能。可以结合思维导图、用例图等进行说明。

![image-20220608105755588](https://s2.loli.net/2022/06/08/17u62v9icUIaOeD.png)

![image-20220608105853314](https://s2.loli.net/2022/06/08/aWivhRq3yEz6rJA.png)

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
  - 文档编写
- 潘淼森:
  - 前端小程序的开发与测试

# 二、界面原型设计 [徐超信]

> - 根据前面的功能需求分析，分模块介绍每部分的原型设计。
>
>   - 包括界面的具体细节、跳转关系以及实现说明等。
>
>   - 此部分应按照模块来进行组织，
>     - 比如第一部分用户管理，其中包含了用户登录、注册、信息查看、修改等等，
>     - 把这部分的界面设计及跳转关系统一放在一张图上。
>
>
>
>   - 除了设计图之外，应该用语言详细说明自己的设计理念，为什么要这么设计，有什么优缺点，实现的难度如何等等。
>

> 结合上述功能设计,我们将原型设计为对应的四个模块,采用`墨刀工具进行设计`

## 首页

![首页设计](https://img-blog.csdnimg.cn/ea9e2431c925449fa1b05c3d9c6079db.png)
- 用户可以在首页提供的查词框中输入单词进行查词
- 查词框下面是一个轮播图,获取通过bing的图片接口,获取精美图片,为学习带来一点视觉上的享受
- 我们将单词的解释分为两层,第一层仅仅提供单词的音标和简单的解释,这一般能够满足主要的需求;此外,我们在第一层中配置了一个进一步查询单词的词形变化的按钮,点击该按钮,会跳转到第二层,这一层提供了更详细的解释,包括单词的词性等等
- 此外,还提供了收藏该的单词的按钮,点击该按钮,会将该单词添加到收藏列表中

![image-20220608181908470](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220608181908470.png)

- 轮播图下面安排了用户当前的学习科目和学习进度,用户点击继续学习,便可以进入学习模式



![请添加图片描述](https://img-blog.csdnimg.cn/06d87c57851d462da531acf846027e5b.png)

- 对于拼写错误的单词,后台会尝试通过匹配算法推荐一些形近词
  - 对于记忆不清的单词来说,这会很有用,用户也可以利用该接口查找形近词
  - 事实上,后端可以提供正则匹配/通配符等高级功能(尽管已经很少用到了)





## 学单词

![在这里插入图片描述](https://img-blog.csdnimg.cn/9205722daed04e0093be2f8cdfa7b137.png)

- 学单词模块,也就是本应用的核心模块
- 用户可以在该模块的主菜单页选择记忆模式(包括简洁模式和交流模式(也叫常规模式))
  - 默认的,记忆模式是常规模式
- 然后选择自己的考试类型(对应的词书)
- 其中,简洁模式包含内容弄个较少,只有音标和基本的解释,已经一个查询单词详情解释的按钮和收藏按钮
- 而另一个模式(交流模式中),除了包含简洁模式中的相关功能,还提供了基于后台数据分析的`所有用户平均熟练度指标`(也被称为`难度等级`)
- `我的观点`则是反映本人的当前对于该词汇的熟练度

![请添加图片描述](https://img-blog.csdnimg.cn/ae7cf0f2d90347eca6e0c959d96b1fd5.png)

- 这是用户点击单词详情和收藏后分别的出现的响应结果

![请添加图片描述](https://img-blog.csdnimg.cn/e47c3386c0444de6a6508c497189118b.png)

- 这是用户在交流模式下,提交自己的记忆技巧(简称为`批注`)
- 提交成功,则反馈一个`提交成功`的标识给用户


## 复习与测验

![请添加图片描述](https://img-blog.csdnimg.cn/8bc5e7ec92304ff0b9563342c3f2b74b.png)

- 复习&测验也是本应用的主要功能,能够帮助用户检查自己的记忆效果(掌握程度),帮助用户对自己的学习成果有更加客观的把握
- 我们提供了多样化的复习策略和题型,包括中文选词,拼写组合,拼写填空和全拼默写
- 对于答错的题目,页面会切换到正确答案的解释页面
- 对于答对的题目,页面会切换到下一题
- 注:问题提交答案的方式:
  - 用户选中一个选项后,(被自动提交),后台自动判断正确性,根据正确性切换对应的页面
  - 上述流程表示的是中文选词的答题过程

![请添加图片描述](https://img-blog.csdnimg.cn/a1eaba552a494f09a42457c4c43fac65.png)

- 这是拼写填空题型下的答题过程





## 我的

![请添加图片描述](https://img-blog.csdnimg.cn/4e96e13bd2f342eab9a19ac8d6a8c188.png)



- 这是`我的(用户中心)`模块,用于借助于微信平台的登录授权功能方便的注册登录到本系统
  - 后台通过获取微信提供的信息头像和昵称的信息创建一个用户记录
  - 该记录也作为登录状态保持(session)的value
  - 后台将会凭借session来判断和区别用户
- 登录成功后,小程序拉取必要的同步数据,并且做一定的数据计算和转换,得到签到天数,户龄
- 还包括考试倒计时/单词收藏列表和查词记录/反馈与建议的提交入口



![请添加图片描述](https://img-blog.csdnimg.cn/dfb8484b4cfb48b0946d4a4ebdec51a9.png)

- 用户点击我的->收藏列表,可以看到之前做过的单词收藏,(这些单词可能是用户自认为容易混淆意思/难以拼写/品读正确的单词)

- 用户点击某个条目后,可以跳转到响应的词典解释页面

- 用户点击星号`star`,可以取消掉对某个单词的收藏,程序会向用户发送一个确认询问,当用户确认取消,才真正将对应的单词从收藏列表中移除,否则,操作被取消

  

![image-20220609081939578](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220609081939578.png)

- 这是进入`单词搜索记录`的流程,UI和操作逻辑基本和`收藏列表`一致

## 墨刀在线预览(可交互)

- https://modao.cc/app/Zq2TY5o8rd1a7cROgqSHwe 《EnglishLearningAsistant》 (页面附带多种状态)
- https://modao.cc/app/xg43top2raoiorN4gHVgF 《ELA_morePages》 

# 三、系统架构设计 [徐超信]

> 这部分主要是对系统各部分的架构设计，和前面界面设计不同，
>
> - 这部分侧重于功能设计。
>
> - 架构设计应按照从总体到局部、从粗到细的顺序分小节进行描述。
>
>   - 首先，描述系统的整体架构，
>     - 包括前端、后端、API、数据库、消息队列等各个部分的大致结构，
>       - 可用示意图来进行描述，并详细说明每部分的具体作用，
>       - 以及为什么这么设计，其优缺点是什么。
>   - 然后，分小节分别介绍各个部分。
>     - 比如前端包含什么模块，这些**模块的关系如何**，这些模块为什么这么设计，优缺点是什么。
>     - 后端等也是如此。
>   - 最后，对每个模块给出实现的方案，
>     - 比如采用什么框架、
>     - **什么技术来实现**。



## 前端

- 前端我们分为四个功能模块
- 第一个模块是工具性模块,提供查词功能和形近词推荐功能
- 第二个模块是学单词模块(核心),并且具有两种模式可供选择,可以满足用户不同的学习风格
- 第三个模块是承接第二个模块,也是核心模块,用户可以复习和检测自己的学习效果;并提供了多样的复习策略和复习题型,也能更加全面的检测对单词的掌握情况
- 第四个模块是用户中心,属于不太常用但又不可或缺的模块,用户可以通过本模块获取自己的总体的学习情况和学习痕迹(打卡天数/收藏列表/查词记录列表/...),用户也是在该模块中反馈问题给程序后台

![logic](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imageslogic.svg)

## 后端

- > 后端对应前端,创建了4个功能模块,每个功能模块中在进一步细分

  - 为了实现灵活性,独立性,使用前后端分离的方式渐渐称为主流,本项目中,我们采用前后端分离的开发模式,并且借助于apifox做接口设计和对接,前后端可以有自己实际开发进度
  - 

### 用户中心

#### 登录功能方案选型:

> [前端常见登录实现方案 + 单点登录方案 - 掘金 (juejin.cn)](https://juejin.cn/post/6933115003327217671)

- `Cookie + Session` 历史悠久，适合于简单的后端架构，需开发人员自己处理好安全问题。
- `Token` 方案对后端压力小，适合大型分布式的后端架构，但已分发出去的 `token` ，如果想收回权限，就不是很方便了。
- SSO 单点登录，适用于中大型企业，想要统一内部所有产品的登录方式的情况。
- OAuth 第三方登录，简单易用，对用户和开发者都友好，但第三方平台很多，需要选择合适自己的第三方登录平台。

> - 综合比较,我们选择第一种方案,比较符合项目定位
> - 利用session,后端可以充分利用用户的登录状态(从客户端提交过来的cookie中解析出用户信息从而帮助前端以更加简洁的参数就可以调用经过改进后的api)
> - 另一方面,提供身份认证为数据安全提供了基本保障,减少被攻击的可能



## api

> api设计是项目功能的重点,良好的接口设计有利于提高开发效率,节约沟通成本,提供可维护性

- api风格:我们采用流行的RESTful api 设计风格,改善我们的api开发效率和规范性

  - [RESTful API](https://en.wikipedia.org/wiki/Representational_state_transfer)是目前比较成熟的一套互联网应用程序的API设计理论。

    - > 访问一个网站，就代表了客户端和服务器的一个互动过程。在这个过程中，势必涉及到数据和状态的变化。
      >
      > 互联网通信协议HTTP协议，是一个无状态协议。这意味着，所有的状态都保存在服务器端。因此，**如果客户端想要操作服务器，必须通过某种手段，让服务器端发生"状态转化"（State Transfer）。而这种转化是建立在表现层之上的，所以就是"表现层状态转化"。**
      >
      > 客户端用到的手段，只能是HTTP协议。具体来说，就是HTTP协议里面，四个表示操作方式的动词：GET、POST、PUT、DELETE。它们分别对应四种基本操作：**GET用来获取资源，POST用来新建资源（也可以用于更新资源），PUT用来更新资源，DELETE用来删除资源。**

  - 我们在开发项目的api的过程中,尽可能地采用RESTful理念,充分利用了http协议中的四个常用动词来设计api,客户端通过四个HTTP动词，对服务器端资源进行操作，实现"表现层状态转化"

  - RESTful API最好做到Hypermedia，即返回结果中提供链接，连向其他API方法，使得用户不查文档，也知道下一步应该做什么。我们的后端的四个模块的基础路由提供了类似的功能,帮助api的使用者更快了解后端的api功能组织

    - ![image-20220607201049797](https://s2.loli.net/2022/06/07/p2Hwvm8NaDX7TtQ.png)
    - 此外,后端还提供了基于swagger的文档,前端即使不查看后端代码,也可以对后端提供的接口有所了解
      - `123.56.72.67:8000/doc/`
      - <img src="https://s2.loli.net/2022/06/07/wvMN7ACpkDd8qzX.png" alt="image-20220607201359428" style="zoom:50%;" />

  - 尽管RESTful 是一个很好的理念,但是在开发过程中,发现有少量的api较难通过四个动词来贴切地描述api的实际用意,因此,我们结合实际需求,对少数api做了折衷处理

- 我们的后端框架采用的django,该框架容易入门,参考资料较为丰富.但是为了更好的开发出符合restful 风格的api,我们采用了一个流行的子框架(DRF),该框架将一些平时常用/重复的逻辑抽象出来,使得我们可以更加高效的开发出比较规范的结构

## 数据库

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







# 四、API设计 [徐超信]

> - 这部分主要是API的设计，分模块进行介绍，并通过APIfox介绍API的设计理念，使用、测试方法等。
>- 用列表和文档对所有的API进行详细的列举和描述。

# 五、数据库设计 [徐超信]

> 这部分主要是数据库方面的设计。
>
> 首先，详细描述自己系统中需要持久化的数据以及需要缓存的数据等，根据数据的特点确定自己的数据库方案（采用什么数据库及其原因）。
>
> 其次，结合ER图、列表等对自己的数据库中的数据进行详细描述，都有哪些表，保存了哪些数据，为什么要这么设计。
>
> 最后，详细描述所使用的数据库相关技术，比如ORM、工具以及具体的使用方式。
>

# 六、微信小程序端的实现 [潘淼森]

> 这部分分模块来描述前端的具体实现，比如：

## 6.1 登录登出功能的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。

<img src="https://img-blog.csdnimg.cn/335d26fb8ba74397a42ddcd1db6a39e1.png" alt="image-20220607201359428" style="zoom:50%;" />





<img src="https://img-blog.csdnimg.cn/07bc0df6722a4d34a41ae4b46028e4eb.png" alt="image-20220607201359428" style="zoom:50%;" />





<img src="https://img-blog.csdnimg.cn/ab7571f4a11a41ff860c15f37cd5139f.png" alt="image-20220607201359428" style="zoom:50%;" />





## 6.2 查词功能的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。



1.如果数据库中未找到则显示未找到相关内容

<img src="https://img-blog.csdnimg.cn/b7e5234012314390a4548018f0dcb811.png" alt="image-20220607201359428" style="zoom:50%;" />

2.如果输入正确

<img src="https://img-blog.csdnimg.cn/011f5a30d6dc49c1af82a6bcbe26d707.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/65ff17ea489d466e9fb73e0bf02e7947.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/3a51c0d4f3854e859c260e7c475876c7.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/e9e9feaa414e458090afbab420ff7c6f.png" alt="image-20220607201359428" style="zoom:50%;" />



## 6.3 学单词功能的实现

左滑右滑实现翻页，翻到第一页再往前翻会提示

<img src="https://img-blog.csdnimg.cn/51e868097d7e4a5393a72948e187b2a8.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/920924aa1e1b41abbc2f1c74baa1ec86.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/5ab5bd57fdf942cc8ecd05531c67b562.png" alt="image-20220607201359428" style="zoom:50%;" />

难度评价打分

<img src="https://img-blog.csdnimg.cn/cab3373d433d4b11a48c44abc80b3aca.png" alt="image-20220607201359428" style="zoom:50%;" />

添加批注

<img src="https://img-blog.csdnimg.cn/291ca656070c401bbcec36370ac4106d.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/a6d922da2aab445f96c434ddb6f41e5f.png" alt="image-20220607201359428" style="zoom:50%;" />

<img src="https://img-blog.csdnimg.cn/855a8d37be6748b0aa27ce45e9e2f43f.png" alt="image-20220607201359428" style="zoom:50%;" />







## 6.4 查考纲功能的实现

<img src="https://img-blog.csdnimg.cn/55aabd4ea0304a9390812f3f4a4d1fe5.png" alt="image-20220607201359428" style="zoom:50%;" />



<img src="https://img-blog.csdnimg.cn/06556ba4c4f746078fbfafb9746fe5c9.png" alt="image-20220607201359428" style="zoom:50%;" />







<img src="https://img-blog.csdnimg.cn/0cbb554de1724c8988e5772175898d2b.png" alt="image-20220607201359428" style="zoom:50%;" />



## 6.5 计算ddl功能的实现

<img src="https://img-blog.csdnimg.cn/ab7571f4a11a41ff860c15f37cd5139f.png" alt="image-20220607201359428" style="zoom:50%;" />



<img src="https://img-blog.csdnimg.cn/5d8a6c3d24c84863bf436418f7aa050b.png" alt="image-20220607201359428" style="zoom:50%;" />



<img src="https://img-blog.csdnimg.cn/1581772b39d9473b8c3cb50501a08430.png" alt="image-20220607201359428" style="zoom:50%;" />

## 6.6 反馈建议&在线客服功能的实现

<img src="https://img-blog.csdnimg.cn/d95df938405d4162bb1d950129a6740d.jpeg" alt="image-20220607201359428" style="zoom:20%;" />

<img src="https://img-blog.csdnimg.cn/8db86656eed0474abb7319fa52eefa45.jpeg" alt="image-20220607201359428" style="zoom:20%;" />



# 七、英语助手后端的实现[徐超信]

> 这部分也是分模块来展示后端的实现方案。具体参见前面第六部分。

> 这部分分模块来描述后端的具体实现，比如：

## 7.1 查词功能的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。

## 7.2 学单词功能的实现

## 7.3 复习功能的实现

> 这部分主要讲点名功能的具体实现方案，可以通过用例图、流程图等来辅助说明。并通过截图来展示效果。
>
> 实现部分不要只有截图，要有文字说明，讲讲这部分实现时采用什么技术，优缺点是什么，实现难点在哪里。

# 八、系统测试

> 这部分主要讲系统的测试方案，不要简单贴图，要写出具体的自动测试方案。可以前后端分开来写。
>

## 8.1 单元测试

> 这部分是单元测试的方案，可以列表统计有多少测试，覆盖率是多少。
>

## 8.2 集成测试

## 8.3 测试部署及结果

> 这部分可以先如何部署到GitHub或其它系统，如何在开发时利用测试来保证正确率的，测试结果如何。
>

# 九、系统部署 [徐超信]

- 我们通过云主机来部署我们的项目,使得后台服务可以通过公网ip能够访问

## 自动部署

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

- 编写hooks.json:

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

![image-20220606164228944](https://s2.loli.net/2022/06/06/MqBf4Zu1VRnLovi.png)图:github&webhook

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

> 项目演示视频: ela/docs/videos目录

# 十一、清单 [徐超信,潘淼森]

> 这部分列出项目提交的清单，如：
>
> - 前端代码: ela/forntend项目
> - 后端代码: ela/backend项目
> - 原型设计文件: ela/docs/design目录
> - 项目演示视频: ela/docs/videos目录
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



