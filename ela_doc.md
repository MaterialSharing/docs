---
title: 基于微信小程序的课堂点名系统
author:
  - 张三(1912190318)
  - 李四(1912190319)
  - 王五(1912190320)
description: |
  我们开发了一个基于微信小程序的课程点名系统，
  它前端采用微信小程序，后端采用Python/Flask，
  实现了XXXX功能
---

文档可以使用markdown编写，用[Pandoc](https://pandoc.org/)转成PDF、html或者word等格式。

# 一、项目介绍 [张三、李四、王五]

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

## 项目需求分析

> 介绍项目主要有哪些功能需求，需要实现什么样的功能。可以结合思维导图、用例图等进行说明。
>

## 计划和分工

> 介绍大致的开发计划以及每个人的分工。

- 徐超信:
  - 数据库设计
  - 后端开发接口开发与测试
  - 后端服务部署
  - 文档编写
- 盘淼森:
  - 前端小程序的开发与测试

# 二、界面原型设计 [徐超信]

> 根据前面的功能需求分析，分模块介绍每部分的原型设计。包括界面的具体细节、跳转关系以及实现说明等。
>
> 此部分应按照模块来进行组织，比如第一部分用户管理，其中包含了用户登录、注册、信息查看、修改等等，把这部分的界面设计及跳转关系统一放在一张图上。
>
> 除了设计图之外，应该用语言详细说明自己的设计理念，为什么要这么设计，有什么优缺点，实现的难度如何等等。

- https://modao.cc/app/JUQ6ZAl4rcklsj2jT450yX 《EnglishLearningAsistant》 
- https://modao.cc/app/xg43top2raoiorN4gHVgF 《ELA_morePages》 

# 三、系统架构设计 [徐超信]

> 这部分主要是对系统各部分的架构设计，和前面界面设计不同，这部分侧重于功能设计。
>
> 架构设计应按照从总体到局部、从粗到细的顺序分小节进行描述。
>
> 首先，描述系统的整体架构，包括前端、后端、API、数据库、消息队列等各个部分的大致结构，可用示意图来进行描述，并详细说明每部分的具体作用，以及为什么这么设计，其优缺点是什么。
>
> 然后，分小节分别介绍各个部分。比如前端包含什么模块，这些模块的关系如何，这些模块为什么这么设计，优缺点是什么。后端等也是如此。
>
> 最后，对每个模块给出实现的方案，比如采用什么框架、什么技术来实现。



# 四、API设计 [徐超信]

> 这部分主要是API的设计，分模块进行介绍，并通过APIfox介绍API的设计理念，使用、测试方法等。用列表和文档对所有的API进行详细的列举和描述。
>

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
>

## 6.1 用户管理的实现

> 这部分是用户管理模块，如登录、注册、修改等功能的具体实现。这里应该重点将实现时考虑的因素，使用的算法以及这样做的优缺点，最后可以通过界面的截图来展示实现效果。
>

## 6.2 点名功能的实现

> 这部分主要讲点名功能的具体实现方案，可以通过用例图、流程图等来辅助说明。并通过截图来展示效果。
>
> 实现部分不要只有截图，要有文字说明，讲讲这部分实现时采用什么技术，优缺点是什么，实现难点在哪里。
>

# 七、点名后端的实现[徐超信]

> 这部分也是分模块来展示后端的实现方案。具体参见前面第六部分。
>

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

> 这部分主要写系统的部署方案，采用了什么样的部署方案（docker？虚拟机？云平台？），有没有自动部署等方案以及具体的步骤和使用方法。

- 我们通过云主机来部署我们的项目,使得后台服务可以通过公网ip能够访问

# 十、功能展示 [张三、李四、王五]

> 基本的功能展示，可以用视频来展示。如果贴图，请尽量将相同模块的图拼接在一起以减少空间占用。
>

# 十一、清单 [张三、李四、王五]

> 这部分列出项目提交的清单，如：
>
> - 前端代码: ela/forntend项目
> - 后端代码: ela/backend项目
> - 原型设计文件: ela/docs/design目录
> - 项目演示视频: ela/docs/videos目录
> - ……
>

# 十二、总结 [张三、李四、王五]

> 项目的总结，整个项目的感受以及下一步的计划。

在开发本项目的过程中,我们收获了很多

- 学习,了解并实践了当下流行的开发技术,体验了规范的和相对完善的开发流程
- 培养了我们的主动学习能力,思考能力以及动手能力,为我们今后的工作学习打下了重要的基础

在开发过程中,我们同样遇到了各种问题

- 由于缺乏产品设计经验以及实战开发经验,我们小组在项目之初进度就较为落后,我们深刻的认识到,需求设计和架构设计一点也不能轻视,轻则拖慢项目开发进展,重则推导重来.
- 小组成员合理分工,沟通协商,团结一致也是分重要,不合理的分工会导致矛盾,缺乏沟通也会导致组内矛盾,影响开发效率和进度,而不团结的队伍也不利于项目的完善
- 此外还有进度安排不签当的任务复杂度估计往往会导致项目开发无法及时完成或者流程不够完善.

# 十二、参考文献 [张三、李四、王五]

> 系统所参考的文献或者代码，比如：
>
> - django4:[ Django: The web framework for perfectionists with deadlines https://www.djangoproject.com (google.com)](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiYp9yJ2__3AhW6qVYBHS0TCZgQFnoECBUQAQ&url=https%3A%2F%2Fwww.djangoproject.com%2F&usg=AOvVaw3E6qaJashVeeIx3oahQxD7)
> - Django Rest framework:[ Django REST framework: Home https://www.django-rest-framework.org (google.com)](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi7qJ-Y2__3AhUepVYBHbjiAPEQFnoECAcQAQ&url=https%3A%2F%2Fwww.django-rest-framework.org%2F&usg=AOvVaw0ZGmLSXHw1XKCvqteVn5f-)
> - mysql8:[MySQL :: MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
> - wechat 小程序开发文档:[微信开放文档 (qq.com)](https://developers.weixin.qq.com/miniprogram/dev/framework/)
> - vant3:[Vant 3 - 轻量、可靠的移动端组件库 (youzan.github.io)](https://youzan.github.io/vant/#/zh-CN)
> - uni-app: https://uniapp.dcloud.io/ 


