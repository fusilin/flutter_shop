//const serviceUrl = 'http://test.baixingliangfan.cn/baixing/';
const serviceUrl = 'http://v.jspang.com:8088/baixing/';
const servicePath = {
  'loginWXUrl': 'https://api.weixin.qq.com/sns/oauth2/access_token',
  'loginWXGuiUrl': 'https://api.weixin.qq.com/sns/userinfo',

  'homePageContext': serviceUrl + 'wxmini/homePageContent',
  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten', //商城首页热卖商品拉取
  'getCategory': serviceUrl + 'wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl + 'wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById': serviceUrl + 'wxmini/getGoodDetailById', //根据商品ID获取商品详情信息
};
