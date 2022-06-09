# http协议的头部(header)结构

> - An **HTTP header** is a field of an HTTP **request or response** that passes additional **context and metadata** about the request or response. 
>   - For example, a **request** message can use headers to indicate it's **preferred media formats**, while a **response** can use header to **indicate the media format of the returned body.**
>   -  Headers are case-insensitive, begin at **the start of a line** and **are immediately followed by a `':'` and a header-dependent value.** 
>   - **The value finishes at the next CRLF** or **at the end of the message**.

## references

- [HTTP header - MDN Web Docs Glossary: Definitions of Web-related terms | MDN (mozilla.org)](https://developer.mozilla.org/en-US/docs/Glossary/HTTP_header)

### http头部字段参考列表:

- [HTTP headers - HTTP | MDN (mozilla.org)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)

## HTTP 报文的结构

![image-20220609185839158](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220609185839158.png)

- http报文包括:
  - http首部(至关重要的信息)
  - 空行
  - http报文主体(用户需要的资源信息)



- HTTP 协议的**请求和响应**报文中**必定包含 HTTP 首部**。

- 首部内容为客户端和服务器分别处理请求和响应提供所需要的信息。对于客户端用户来说，这些信息中的大部分内容都无须亲自查看

### HTTP 请求报文

- 在请求中，HTTP 报文由
  - 方法、
  - URI、
  - HTTP 版本、
  - HTTP 首部字段包括(fields)
    - 请求首部字段
    - 通用首部字段
    - 实体首部字段
  - 等部分构成。

![image-20220609190110188](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220609190110188.png)

#### 请求报文实例:

```http
GET / HTTP/1.1
Host: hackr.jp
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/⇒
20100101 Firefox/13.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,⇒
*/*; q=0.8
Accept-Language: ja,en-us;q=0.7,en;q=0.3
Accept-Encoding: gzip, deflate
DNT: 1
Connection: keep-alive
If-Modified-Since: Fri, 31 Aug 2007 02:02:20 GMT
If-None-Match: "45bae1-16a-46d776ac"
Cache-Control: max-age=0

```



### 响应报文的首部

![image-20220609190510752](https://raw.githubusercontent.com/xuchaoxin1375/pictures/main/imagesimage-20220609190510752.png)

- 注意到响应报文在以下组成上和请求报文的不同
  - 状态行
  - 响应首部字段上的不同



#### 响应报文实例

```http
HTTP/1.1 304 Not Modified
Date: Thu, 07 Jun 2012 07:21:36 GMT
Server: Apache
Connection: close
Etag: "45bae1-16a-46d776ac"
```

- 在报文众多的字段当中，HTTP 首部字段包含的信息最为丰富。

> 首部字段同时存在于请求和响应报文内，并涵盖 HTTP 报文相关的内容信息。
>
> 因 HTTP 版本或扩展规范的变化，首部字段可支持的字段内容略有不同。



### HTTP 首部字段

- HTTP 首部字段传递重要信息
- HTTP 首部字段是构成 HTTP 报文的要素之一。
- 在客户端与服务器之间以 HTTP 协议进行通信的过程中，无论是请求还是响应**都会使用首部字段**，它能起到**传递额外重要信息的作用**。
- 使用首部字段是为了给**浏览器和服务器**提供
  - **报文主体大小**、
  - 所使用的语言、
  - **认证信息**等内容。

#### HTTP 首部字段结构

> HTTP 首部字段是由**首部字段名和字段值**构成的，中间用冒号“:”分隔。

- 例如，在 HTTP 首部中以 Content-Type 这个字段来表示报文主体的对象类型。


```http
Content-Type: text/html
```

- 就以上述示例来看，<u>首部字段名为 Content-Type，字符串 text/html是字段值。</u>
- 另外，**单个 HTTP 首部字段**可以**有多个值**，如下所示。

```http
Keep-Alive: timeout=15, max=100
```



### 4 种 HTTP 首部字段类型

> The HTTP and Fetch specifications refer to a number of header categories, including:
>
> - [Request header](https://developer.mozilla.org/en-US/docs/Glossary/Request_header): Headers containing more **information** about the resource to be fetched or about the client itself.
> - [Response header](https://developer.mozilla.org/en-US/docs/Glossary/Response_header): Headers with additional **information** about the response, like its location or about the server itself (name, version, …).
> - [Representation header](https://developer.mozilla.org/en-US/docs/Glossary/Representation_header): **metadata** about the resource in the message body (e.g. **encoding**, **media type**, etc.).
> - [Fetch metadata request header](https://developer.mozilla.org/en-US/docs/Glossary/Fetch_metadata_request_header): **Headers** with **metadata** about the resource in the message body (e.g. encoding, media type, etc.).

**Older versions** of the specification referred to:

- [General header](https://developer.mozilla.org/en-US/docs/Glossary/General_header): Headers applying to both requests and responses but <u>with no relation to the data eventually transmitted in the body.</u>
- [Entity header](https://developer.mozilla.org/en-US/docs/Glossary/Entity_header): Headers containing more information about the body of the entity, like its content length or its MIME-type (this is <u>a superset of what are now referred to as</u> **the Representation metadata headers**)



- HTTP 首部字段**根据实际用途**被分为以下 4 种类型。
- 通用首部字段（General Header Fields）
  - 请求报文和响应报文两方都会使用的首部
- 请求首部字段（Request Header Fields）
  - 从客户端向服务器端发送请求报文时使用的首部。
  - 补充了请求的**附加内容、客户端信息、响应内容相关优先级**等信息。
- 响应首部字段（Response Header Fields）
  - 从服务器端向客户端返回响应报文时使用的首部。
  - 补充了响应**的附加内容，也会要求客户端附加额外的内容信息**。
- 实体首部字段（Entity Header Fields）
  - **针对**请求报文和响应报文的**实体部分使用的首部**。
  - 补充了资**源内容更新时间**等**与实体有关的信息**。

