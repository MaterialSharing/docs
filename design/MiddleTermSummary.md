---
marp: true
---
<style>
   h1 {
  color: rgb(0, 26, 255);
}

h2 {
  border: solid 2px blue;
  background-color: rgba(255, 192, 203, 0.562);
  border-radius: 15px;
}
h1,
h2,
h3,
h4,
span {
  text-align: center;
  margin: 0.2rem;
  margin-top: 0.1rem;
}

/* img[src*="#thumbnail"] {
   width:50px;
   height:100px;
}
img[src~="thumbnail"] {
   width:150px;
   height:100px;
} */
/* img[src~="bordered"] {
   border: 1px solid black;
} */

ul {
  box-sizing: border-box;
  /* border:solid 1px blue; */
  padding: inherit;
  margin: 0 auto;
  /* max-height:90%; */
}
li {
  box-sizing: border-box;
  /* max-height:98%; */
  /* position:relative; */
  /* border:solid 1px; */
  border-radius: 0.5rem;
  list-style: inside;
  text-align: left;
  margin-left: 2rem;
  padding: 0.5rem;
}
section {
  border: dotted;
  padding: 0.2rem;
  /* max-height:90vh; */
  /* height:700px; */
  /* display:flex;
  flex-flow:wrap;
  align-items:center;
  justify-content:center; */
}
blockquote,
ul,
section,
img,
p,
div {
  overflow: auto;
  box-sizing: border-box;
  max-height: 98%;
}
/* li ul{
  border:solid 1px
} */
citation {
  background: aqua;
}
section p{
   margin:auto
}
img {
  box-sizing: border-box;
  max-height: 75vh;
  /* max-height:570px; */
  border: solid 1px red;
  margin: auto;
  border-radius: 1rem;
  object-fit: contain;
  /* float:right; */
  /* width:260px; */
  /* height:600px; */
}
code {
  color: red;
  text-decoration: underline wavy blue 1px;
}
</style>

# 期中小结(英语学习助手ELA)
- by:潘淼森 徐超信
___
## 后端框架
___
### django

- 通过查阅官方文档,我们发现django的文档比较全面,相关教程比较丰富,而且语言相对容易,符合本项目的需求

### 后台管理

- [Site administration | Django site admin](http://127.0.0.1:8000/admin/)
- Django apps:
  - ![image-20220415085920526](https://s2.loli.net/2022/04/15/w5kAL4Babu7xEPi.png)

___
## 数据库设计

![image-20220415083836522](https://s2.loli.net/2022/04/15/6D8EvftKGlikrBW.png)
___
## 词典数据库
___
### 数据获取

- 调用接口,根据考纲词汇列表,将单词释义爬取到本地
  - 制作了54份excel小词典
  - 然后导入到mysql的数据库word表中由后端提供释义服务
  - ![image-20220415082422505](https://s2.loli.net/2022/04/15/jNpOm5zDIsU4JKP.png)

- 通过(python+pandas)实现

line1

line2

line3



___
### 格式化数据填充到数据库

- ![image-20220413211523230](https://s2.loli.net/2022/04/13/lTfQZ4co2rFWgip.png)
___
## API design apifox

- https://www.apifox.cn/apidoc/shared-69ffdf70-8152-45e7-8d2e-8eb24107f870

![image-20220415084318130](https://s2.loli.net/2022/04/15/fdEYSwCgZXOh25J.png)
___


part1 END!(●'◡'●)


___


## 前端

___

首页

![微信图片_202204150948473](https://s2.loli.net/2022/04/15/QtEn4FDGupdeso3.png)
___

记单词

![微信图片_202204150948472](https://s2.loli.net/2022/04/15/XsjihqLa5WgOuVo.png)



___

选择对应的科目

![image-20220415101116551](https://s2.loli.net/2022/04/15/ZXhBqdj3MDEuly7.png)
___

![微信图片_20220415094847](https://s2.loli.net/2022/04/15/f3ctwVU6AFkoLav.png)

___



提分助手::考试大纲

![微信图片_202204150948471](https://s2.loli.net/2022/04/15/d3Ge4ZguqjBDlzC.png)

___



我的


![微信图片_20220415095708](https://s2.loli.net/2022/04/15/FB1Q3yuxXU7aPWS.png)


___

end!😶‍🌫️

asdf

sdf

asdf

