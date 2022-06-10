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

