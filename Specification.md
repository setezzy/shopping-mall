## 系统功能

### 访客浏览

<table border='0'>
  <tr>
    <td>功能</td>
    <td>功能点</td>
    <td>输入/操作</td>
    <td>检验点</td>
    <td>测试功能</td>
  </tr>
   <tr>
    <th rowspan="26">访客浏览功能 </th>
    <th rowspan="26">首页浏览</th>
    <td> 浏览 </td>
    <td>首页显示</td>
    <td>图片及文字正常显示</td>
  </tr>
    <tr>
    <td>点击搜索框</td>
    <td>结果显示</td>
	<td>提示登录</td>
  </tr> 
   <tr>
    <td>点击导航栏</td>
    <td>结果显示</td>
	<td>提示登录</td>
  </tr> 
     <tr>
    <td>点击侧边栏</td>
    <td>结果显示</td>
	<td>提示登录</td>
  </tr> 
   <tr>
    <td>点击商品</td>
    <td>结果显示</td>
	<td>提示登录</td>
  </tr> 
  </table>
  
  ### 用户登录/注销
  <table border='0'>
    <tr>
    <td>功能</td>
    <td>功能点</td>
    <td>输入/操作</td>
    <td>检验点</td>
    <td>测试功能</td>
  </tr>
    <tr>
    <th rowspan="10">用户登录/注销</th>
    <th rowspan="3">页面显示</th>
    <th rowspan="3"> </th>
    <td>账号框显示</td>
    <td>正常显示</td>
  </tr> 
    <tr>
    <td>密码框显示</td>
    <td>正常显示</td>
  </tr> 
   <tr>
    <td>登录按钮</td>
    <td>可以点击</td>
  </tr> 
  <tr>
  <th rowspan="5"> 登录</th>
  <td>不输入信息，点击“登录”</td>
  <td>确认功能、结果显示</td>
  <td>无法登录，提示输入账号和密码</td>
  </tr>
  <tr>
  <td>仅输入账号/密码(格式正确)</td>
  <td>确认功能、结果显示</td>
  <td>无法登录，提示输入帐号/密码</td>
  </tr>
     <tr>
    <td>输入错误格式</td>
    <td>文本校验</td>
    <td>无法登录，提示包含非法字符</td>
  </tr>
  <tr>
    <td>输入错误账号/密码</td>
    <td>验证账号信息</td>
    <td>无法登录，提示输入正确帐号/密码</td>
  </tr>
    <tr>
    <td>输入正确账号/密码</td>
    <td>验证账号信息</td>
    <td>登录成功，跳转主页</td>
  </tr>
  <tr>
   <th rowspan="3"> 注销</th>
   <td>点击“注销"</td>
   <td>确认功能、结果显示</td>
   <td>清除信息，返回登录页</td>
  </tr>
</table>

### 查看商品、提交订单
<table border='0'>
    <tr>
    <td>功能</td>
    <td>功能点</td>
    <td>输入/操作</td>
    <td>检验点</td>
    <td>测试功能</td>
  </tr>
    <tr>
    <th rowspan="10">查看商品</th>
    <th rowspan="3">浏览目录</th>
    <td>点击商品一级目录</td>
    <td>结果显示</td>
    <td>显示一级分类下商品列表</td>
  </tr> 
    <tr>
    <td>点击商品二级目录(商品存在)</td>
    <td>结果显示</td>
    <td>显示二级分类下商品列表</td>
  </tr> 
  <tr>
    <td>点击商品二级目录(商品不存在)</td>
    <td>结果显示</td>
    <td>提示商品不存在</td>
  </tr> 
  <tr>
  <th rowspan="7"> 查看商品详情</th>
  <td></td>
  <td>商品图片展示</td>
  <td>图片正常显示</td>
  </tr>
  <tr>
  <td></td>
  <td>商品描述显示</td>
  <td>文字正常显示</td>
  </tr>
   <tr>
    <td></td>
    <td>“加入购物车”按钮</td>
    <td>可以点击</td>
  </tr>
   <tr>
    <td></td>
    <td>“直接购买”按钮</td>
    <td>可以点击</td>
  </tr>
  <tr>
    <td rowspan="2">点击“加入购物车”按钮</td>
    <td rowspan="2">结果显示</td>
    <td>商品库存大于零，提示勾选商品规格，跳转至购物车页</td>
  </tr>
  <tr>
   <td>商品库存为零，提示无法加入</td>
  </tr>
    <tr>
    <td>点击“直接购买”按钮</td>
    <td>结果显示</td>
    <td>跳转至订单页</td>
  </tr>
  <tr>
   <th rowspan="19"> 订单处理</th>
   <td rowspan="7">提交订单</td>
   <td></td>
   <td>“提交订单”按钮</td>
   <td>可以点击</td>
  </tr>
  <tr>
  <td></td>
  <td>收货地址文本框</td>
  <td>正常显示</td>
  </tr>
    <tr>
  <td></td>
  <td>联系人姓名文本框</td>
  <td>正常显示</td>
  </tr>
  <tr>
  <td></td>
  <td>联系人电话文本框</td>
  <td>正常显示</td>
  </tr>
  <tr>
    <td>填写收货地址</td>
    <td>文本验证</td>
	<td>提示文本是否合法</td>
  </tr>
   <tr>
    <td>填写姓名</td>
    <td>文本验证</td>
	<td>提示文本是否合法</td>
  </tr>
     <tr>
    <td>填写联系电话</td>
    <td>文本验证</td>
	<td>提示文本是否合法</td>
  </tr>
  <tr>
  <td rowspan="4">确认订单</td>
   <td></td>
   <td>“确认”按钮</td>
   <td>可以点击</td>
  </tr>
     <tr>
    <td>点击“确认”按钮</td>
    <td>结果显示</td>
	<td>生成订单记录，跳转至结账页</td>
  </tr>
  <tr>
     <td></td>
     <td>“取消”按钮</td>
   <td>可以点击</td>
  </tr>
     <tr>
    <td>点击“取消”按钮</td>
    <td>结果显示</td>
	<td>不做处理</td>
  </tr>
  <tr>
    <td rowspan="5">结账</td>
   <td></td>
   <td>“付款”按钮</td>
   <td>可以点击</td>
     </tr>
    <tr>
    <td></td>
    <td>商品总价显示</td>
	<td>正常显示</td>
  </tr>
     <tr>
    <td>点击“付款”按钮</td>
    <td>结果显示</td>
	<td>跳转至付款页</td>
  </tr>
   <tr>
    <td></td>
    <td>“取消付款”按钮</td>
	<td>可以点击</td>
  </tr>
     <tr>
    <td>点击“取消付款”按钮</td>
    <td>结果显示</td>
	<td>跳转至订单详情页</td>
  </tr>
  <tr>
  <td rowspan="2">查看订单</td>
   <td>浏览订单</td>
   <td>订单详情显示(订单号，日期，商品信息，收货信息，订单状态)</td>
   <td>正常显示</td>
  </tr>
  <tr>
  <td>搜索订单 </td>
  <td>结果显示 </td>
  <td>显示符合条件的订单 </td>
  </tr>
</table>

### 销售商管理

<table border="0">
 <tr>
    <td>功能</td>
    <td>功能点</td>
    <td>输入/操作</td>
    <td>检验点</td>
    <td>测试功能</td>
  </tr> 
  <tr>
 <th rowspan="8">商品管理</th>
 <th rowspan="8">商品信息设置</th>
 <td></td>
 <td>“编辑”按钮</td>
 <td>可以点击</td>
 </tr>
 <tr>
<td>点击“编辑”按钮</td>
<td>结果显示</td>
<td>跳转至编辑商品页</td>
</tr>
 <tr>
<td></td>
<td>商品类别多选框</td>
<td>可以点击</td>
</tr>
 <tr>
<td>勾选某类别</td>
<td>结果显示</td>
<td>显示选中类别</td>
</tr>
 <tr>
<td></td>
<td>商品库存文本框</td>
<td>可输入</td>
</tr>
 <tr>
<td>输入库存</td>
<td>文本验证</td>
<td>提示是否合法</td>
</tr>
 <tr>
<td></td>
<td>“确认”按钮</td>
<td>可以点击</td>
</tr>
 <tr>
<td>点击“确认”按钮</td>
<td>结果显示</td>
<td>修改成功，显示商品信息</td>
</tr>
<tr>
<th rowspan="8">订单管理 </th>
<th rowspan="2"> 确认发货</th>
<td></td>
<td>“确认发货”按钮</td>
<td>可以点击</td>
</tr>
 <tr>
<td>点击“确认发货”按钮</td>
<td>结果显示</td>
<td>提示操作成功，商品状态变为“已发货”</td>
</tr>
<tr>
<th rowspan="2">订单驳回</th>
<td></td>
<td>“驳回”按钮</td>
<td>可以点击</td>
</tr>
 <tr>
<td>点击“驳回”按钮</td>
<td>结果显示</td>
<td>提示操作成功，商品状态变为“已驳回”</td>
</tr>
</table>


### 后台管理

<table border="0">
 <tr>
    <td>功能</td>
    <td>功能点</td>
    <td>输入/操作</td>
    <td>检验点</td>
    <td>测试功能</td>
  </tr> 
<tr>
<th rowspan="11">用户管理 </th>
<th>查看用户</th>
<td></td>
<td>用户信息显示</td>
<td>信息正常显示</td>
</tr>
<tr>
<th rowspan="8"> 添加用户</th>
<td></td>
<td>“添加”按钮</td>
<td>可以点击</td>
</tr>
 <tr>
<td>点击“添加”按钮</td>
<td>结果显示</td>
<td>跳转至编辑页</td>
</tr>
 <tr>
<td></td>
<td>用户角色下拉框</td>
<td>可以选择用户角色</td>
</tr>
 <tr>
<td></td>
<td>用户名文本框</td>
<td>可以输入</td>
</tr>
 <tr>
<td></td>
<td>用户密码域</td>
<td>可以输入</td>
</tr>
 <tr>
<td>选中用户角色</td>
<td>结果显示</td>
<td>显示选中的用户角色</td>
</tr>
 <tr>
<td>编辑用户名</td>
<td>文本验证</td>
<td>提示是否合法</td>
</tr>
 <tr>
<td>编辑用户密码</td>
<td>文本验证</td>
<td>提示是否合法</td>
</tr>
<tr>
<th rowspan="2">删除用户</th>
<td></td>
<td>“删除”按钮</td>
<td>可以点击</td>
</tr>
 <tr>
<td>点击“删除”按钮</td>
<td>结果显示</td>
<td>刷新页面，相应用户记录删除</td>
</tr>
</table>

