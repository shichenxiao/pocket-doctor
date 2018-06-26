/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : mysql01

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-06-25 16:07:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blogId` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `text` longtext,
  `md` longtext,
  `comment` varchar(255) DEFAULT NULL,
  `star` int(10) DEFAULT NULL,
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog
-- ----------------------------

-- ----------------------------
-- Table structure for `clique`
-- ----------------------------
DROP TABLE IF EXISTS `clique`;
CREATE TABLE `clique` (
  `cliqueID` int(11) NOT NULL AUTO_INCREMENT COMMENT '‘帮’的Id',
  `Cuerid` int(11) NOT NULL,
  `Cfactionid` int(11) NOT NULL COMMENT '属于哪个帮',
  `cliqueName` varchar(50) NOT NULL COMMENT '帮内帖子名字',
  `cliqueArticle` varchar(800) NOT NULL COMMENT '帖子内容',
  `visited` varchar(500) NOT NULL COMMENT '查看量',
  `cdate` varchar(200) NOT NULL,
  `cimage` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cliqueID`),
  KEY `factioncliqueid` (`Cfactionid`),
  KEY `userce` (`Cuerid`),
  CONSTRAINT `factioncliqueid` FOREIGN KEY (`Cfactionid`) REFERENCES `faction` (`factionID`),
  CONSTRAINT `userce` FOREIGN KEY (`Cuerid`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clique
-- ----------------------------
INSERT INTO `clique` VALUES ('1', '1', '2', '宝宝嗓子红肿', '宝宝现在三岁2个月，喉咙肿大有一年多了。今年九月月之前，主要是张嘴呼吸打鼾，鼻子不通气。今天九月份之后，感冒咳嗽一直持续到现在11月份，晚上12点左右还是会咳几次，每天晚上刚睡着后就流好多汗，睡一个小时左右才不流，每天晚上一样，打鼾鼻子不通气，下半夜睡觉不踏实，早上喝牛奶会吐持续了一个月，有时候吃饭也会吐，像喷泉一样喷出来。去医院开了药没有效果。 开了一些感冒消炎类药。想问一下那位医生最擅长这方面，最好是长沙的医生。', '122', '2017-01-02', 'http://www.dengta120.com/uploadfile/2017/1229/20171229051017400.jpg');
INSERT INTO `clique` VALUES ('2', '2', '2', '鼻子干疼干疼的，是不是很严重', '经常都是干疼干疼的，有时候还会有血丝，这是不是鼻炎，会不会很严重了？\r\n经常都是干疼干疼的，有时候还会有血丝，这是不是鼻炎，会不会很严重了？\r\n经常都是干疼干疼的，有时候还会有血丝，这是不是鼻炎，会不会很严重了？\r\n经常都是干疼干疼的，有时候还会有血丝，这是不是鼻炎，会不会很严重了？\r\n', '112', '2017-01-03', 'http://www.dengta120.com/uploadfile/2017/1229/20171229051017400.jpg');
INSERT INTO `clique` VALUES ('3', '3', '2', '持续性低频耳鸣好烦人啊', '\r\n一个月了，去了好多医院，吃了好多药，一点改善都没有，晚上吃安眠药都睡不了几个小时。\r\n\r\n有同样的病友吗？你们怎么对付的？', '200', '2017-02-21', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/ic0jEvWaJW2*4DKw2Rb*gmXtzw*322.mF8CsR6SAwS4!/r/dEIBAAAAAAAA');
INSERT INTO `clique` VALUES ('4', '3', '2', '哪个医院可以看两岁宝宝耳鼻喉科', '大家好，两岁宝宝流鼻涕，鼻子不通气，用嘴呼吸，晚上症状严重影响睡觉，咳嗽呕吐。请问除了北京儿童医院耳鼻喉科 别的医院能看吗？挂号好难 哪个医院靠谱又能挂上号？', '33', '2017-02-13', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/kFQV7LBZ57g1X7f4c8dC97fenTZ8kmfzzoUM8iCzSyc!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('5', '2', '2', '首大耳鼻喉医院和首都医科大学有关系吗', '\r\n现在套路太多，我们农村人挣钱不容易，怕被忽悠了。谢谢哪位给予解答。', '39', '2017-02-18', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/ZvV.qP1s1F8wmpqXZyE8hgH.AhKXOdWMm5rIr3nConw!/r/dC8BAAAAAAAA');
INSERT INTO `clique` VALUES ('6', '1', '2', '鼻子干燥', '\r\n鼻子干燥疼用过好多方法都不轻怎么治疗', '103', '2017-02-15', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/sF8FOnB7P3kBk1VvLjLtmr*.uGUJ1ab9G8xf2aB292I!/r/dFYAAAAAAAAA');
INSERT INTO `clique` VALUES ('7', '2', '2', '谁做过洗耳朵啊，坐标北京', '请问哪里做洗耳朵，便宜点的，网上人家说几十块钱，花300挂个专家号没意义，我就想挂个便宜号做个电耳镜，耳朵清洗\r\n', '104', '2017-03-23', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/kFQV7LBZ57g1X7f4c8dC97fenTZ8kmfzzoUM8iCzSyc!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('8', '2', '2', '鼻甲肥大，哪家医院能治好啊？', '\r\n鼻甲肥大，有治好的吗？', '', '2017-03-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/.aG3dsjw3gdKI1AOICu2oAqUzZagIlexuPGv1RB8JRo!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('9', '3', '2', '耳朵进纸了，而且也有中耳炎', '耳朵进纸了，取出来痛不痛？', '46', '2017-03-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/mQDwwYDYJQTIZHm9SQKj4.2K9tJzqoeS29H4Wo73baU!/r/dDMBAAAAAAAA');
INSERT INTO `clique` VALUES ('10', '4', '2', '听力检测需要多少钱？', '\r\n本人听力有问题，想去医院做听力检测，但不知道需要多少钱，有谁知道的可以说一下吗？\r\n\r\n本人听力有问题，想去医院做听力检测，但不知道需要多少钱，有谁知道的可以说一下吗？\r\n\r\n本人听力有问题，想去医院做听力检测，但不知道需要多少钱，有谁知道的可以说一下吗？\r\n\r\n本人听力有问题，想去医院做听力检测，但不知道需要多少钱，有谁知道的可以说一下吗？\r\n\r\n本人听力有问题，想去医院做听力检测，但不知道需要多少钱，有谁知道的可以说一下吗？\r\n本人听力有问题，想去医院做听力检测，但是不知道需要多少钱，有谁知道的可以说一下吗？', '79', '2017-04-02', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/jsqphsnnxZ6mfRJfCo1*oNQSJlSSLKYbzdwk.MBSYG8!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('11', '5', '1', '请看下图，两小腿上出现了一些红点，不痛不痒是什么问题？', '请看下图，两小腿上出现了一些红点，不痛不痒是什么问题？', '51', '2017-04-13', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/8s4EuMpUtHIIkvnsW61IdXsu5896ER9rctVjcGbS2Vg!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('12', '6', '1', '怎么回事啊 一片片的 还痒', '这是怎么回事啊 肚子腿上都有 还痒', '86', '2017-04-18', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/BHEYb6torVJa5q.uKsnltTknD4THK33z3O6EVZJuOhU!/r/dFYAAAAAAAAA');
INSERT INTO `clique` VALUES ('13', '7', '1', '\r\n\r\n\r\n\r\n\r\n\r\n求助，扁平疣怎么治，治疗一直没有效果 ', '手上和脚上都有，不痛不痒的，就是看着有点渗人', '119', '2017-04-28', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/T1NRfx*WAhSP8otAhovakzLxtQW*mTRLuFOfC6Ep7KQ!/r/dC0BAAAAAAAA');
INSERT INTO `clique` VALUES ('14', '8', '1', '过敏反应或闭口吗？？', '脸上抹了上海雪花膏就开始泛红 还有点痒 之前面膜过敏好了 现在又红了 不知是过敏还是闭口类的 求解', '104', '2017-05-14', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/JBWOJYOWCvm27NrJ.Xid0xqlAMifBxL47LKnPLgY1tM!/r/dC8BAAAAAAAA');
INSERT INTO `clique` VALUES ('15', '9', '1', '我也不知道这是什么鲜', '这是什么病呀帮帮我看看', '113', '2017-05-20', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/MaS3p.59TqUjvIn7AF8vws*7I4ZCCGUsIr4sI2plxJI!/r/dFYAAAAAAAAA');
INSERT INTO `clique` VALUES ('16', '10', '2', '有人做过会厌肿物的手术吗？？？？', '有人做过这种手术或者正在生这种病吗？复发率高吗', '192', '2017-06-22', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/jZNmgORXRyjPPiLWBJWkR0huFSVS0k4XJctrD4PFNKk!/r/dDMBAAAAAAAA');
INSERT INTO `clique` VALUES ('17', '11', '2', '声带接触性肉芽肿，治不好，烦？', '有没有声带肉芽肿的，手术后又复发，烦有没有治好的朋友？', '165', '2017-06-11', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/w5STHQBOWQKfJWH6UJyOPPJTeH*s5bAwLk5DZgc0uvk!/r/dFkAAAAAAAAA');
INSERT INTO `clique` VALUES ('18', '12', '2', '嗓子疼的难受，到晚上的时候', '现在咽炎白天的时候，还好点，就是咳嗽厉害，到晚上睡觉的时候，嗓子疼的不舒服，还咳嗽', '49', '2017-07-20', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/yr7W195lQnKFxVGjfkU*yZVSwdtEzFBzKTbmAPBdhZA!/r/dC8BAAAAAAAA');
INSERT INTO `clique` VALUES ('19', '1', '2', '有哪里治神经性耳鸣最好的医院 ', '有人用水针激活耳神经的疗法呢?我神经性耳鸣7个月了', '156', '2017-07-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/.a.vBPZvv1gxG7rtLALqm6N2TymA6FVSLgsuN4rgktY!/r/dDABAAAAAAAA');
INSERT INTO `clique` VALUES ('20', '23', '2', '轻度鼻中偏曲需要动手术吗?', '轻度的，需要动手术吗?就是看着有点歪，暂时不影响呼吸', '133', '2017-08-23', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/jsDd2zpL*ur6p51eDhl9VzwCbq3hZWOXBwki5RstJuQ!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('21', '1', '3', '有股骨头坏死的朋友吗？', '\r\n本人股骨头坏死一年多了，在广西看过好几家医院都 没有治好，还有一家医院让我换假的，我不想换，怎么办。有没有治好的朋友？', '165', '2017-03-10', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/u1r*Aqg7kboMJ8Gl2MkQI1DpjA*tGtnfioOzyBVIpBI!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('22', '2', '3', '腰疼', '腰疼', '137', '2017-08-16', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/jZNmgORXRyjPPiLWBJWkR0huFSVS0k4XJctrD4PFNKk!/r/dDMBAAAAAAAA');
INSERT INTO `clique` VALUES ('23', '3', '3', '坐久了屁股疼，是不是有问题', '坐久了屁股疼，是不是有问题', '73', '2017-08-09', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/HlFGN.5F59SRtO*GLAFx0b2lzCGfcMVw7OQ1xzUFan4!/r/dFYAAAAAAAAA');
INSERT INTO `clique` VALUES ('24', '4', '3', '胸里面骨头疼', '胸里面骨头疼', '54', '2017-09-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/a8yyDc1ACSZKqvtR7rsoiE5LfRBuNcIc9fEA7rNEWnM!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('25', '5', '3', '神经性牙疼是什么情况？', '神经性牙疼是什么情况？', '55', '2017-09-23', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/oP2o7oyPBhjJnz7DVNTt7xHiBD4DzWPEnbMwT0cY0Rw!/r/dDMBAAAAAAAA');
INSERT INTO `clique` VALUES ('26', '6', '3', '骨头疼啊，谁能告诉我', '骨头疼啊，谁能告诉我', '87', '2017-09-09', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/5O1b06UsU6xT*YuvlwjM36SGoj24iCFCEiEhXp02aHM!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('27', '7', '3', '最近脚脖子时不时疼', '最近脚脖子时不时疼', '37', '2017-09-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/jsDd2zpL*ur6p51eDhl9VzwCbq3hZWOXBwki5RstJuQ!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('28', '8', '3', '有神经痛 这一说么', '有神经痛 这一说么', '41', '2017-09-23', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/.a.vBPZvv1gxG7rtLALqm6N2TymA6FVSLgsuN4rgktY!/r/dDABAAAAAAAA');
INSERT INTO `clique` VALUES ('29', '9', '3', '牙疼有什么特效方法？', '牙疼有什么特效方法？', '83', '2017-10-13', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/w5STHQBOWQKfJWH6UJyOPPJTeH*s5bAwLk5DZgc0uvk!/r/dFkAAAAAAAAA');
INSERT INTO `clique` VALUES ('30', '1', '3', '成人正常的提问是多少', '成人正常的提问是多少', '45', '2017-10-15', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/yr7W195lQnKFxVGjfkU*yZVSwdtEzFBzKTbmAPBdhZA!/r/dC8BAAAAAAAA');
INSERT INTO `clique` VALUES ('31', '2', '4', '腱鞘炎有什么偏方治疗', '中医能治疗吗，后者谁知道的偏方也行', '64', '2017-10-14', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/6UMTh4eKWfkfQ.SaCsmTsugCpbNRRXWq*.MqOqls3.Q!/r/dC0BAAAAAAAA');
INSERT INTO `clique` VALUES ('32', '3', '4', '腰椎肩盘突出可根治吗', '腰椎肩盘突出可以根治吗？怎么根治？怎么办可以减轻？', '156', '2017-10-03', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/b*ar3zQT.OTJAroV6eo7coHhG72F4TVFdXZH.brMfKk!/r/dDMBAAAAAAAA');
INSERT INTO `clique` VALUES ('33', '4', '4', '帮忙看看，右脚突出了一块', '右脚脚跟右侧面突出来啦一块。摸起来像骨头，不疼不痒，只是感觉跟左脚不一样怪怪的，！以前练跳远的', '127', '2017-10-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/JYKAn3rnqgB00TLtOkNEYjfegQPM2.rZUY.tZa9iqZw!/r/dPIAAAAAAAAA');
INSERT INTO `clique` VALUES ('34', '5', '4', '鲫鱼怎么吃可以抗衰老', '怎么做菜可以最大的发挥功效？\r\n[原料]黄芪15克，鲫鱼3条(约重500克)，猪瘦肉200克，豆腐、粉丝各150克，莴笋叶100克，化猪油75克，生姜15克，葱10克，料酒30毫升，白糖、精盐各5克，炒枳壳、味精、胡椒粉各2克，醋3克，鲜汤2000毫升。\r\n\r\n　　[制法]\r\n\r\n　　1、将鲫鱼去鳃、鳞，剖去内脏，片成5厘米见方、0.3厘米厚的鱼片(鱼刺弃之不用);猪瘦肉去筋膜，洗净沥水切片;豆腐切块;粉条水发后切段;莴笋叶洗净择好。以上各料全部装盘，围于火锅四周。\r\n\r\n　　2、用干净纱布包上黄芪、炒枳壳，入沙罐中，注入清水，熬2次，每次15分钟，收药液待用。\r\n\r\n　　3、锅置火上，下猪油烧至六成热，下姜片，煸出香味，放盐、胡椒粉、醋、料酒、白糖等，加入汤烧开，撇去浮沫，再下药液，烧开之后，倒入火锅中，烫食各种原料，饮汤。\r\n\r\n　　[用法] 直接食用或配餐均宜。\r\n\r\n　　[功效] 补气健胃，美容润颜之功效。\r\n\r\n　　[主治] 脾虚所至的食欲不振、消化不良、便溏泄泻。以及气虚所致的气短乏力、胃下垂、脱肛等症。女人常食可美容润肤。\r\n\r\n　　[按语]黄芪益气补阳、摄血行滞、固表止汗。将其同鲫鱼合食，可补气健胃、美容抗衰。\r\n\r\n收藏收藏0\r\n赞赞0\r\n回复 举报\r\n\r\n高级模式\r\n将鲫鱼去鳃、鳞，剖去内脏，片成5厘米见方、0.3厘米厚的鱼片(鱼刺弃之不用);猪瘦肉去筋膜，洗净沥水切片;豆腐切块;粉条水发后切段;莴笋叶洗净择好。以上各料全部装盘，围于火锅四周。\r\n', '158', '2017-10-11', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/HlFGN.5F59SRtO*GLAFx0b2lzCGfcMVw7OQ1xzUFan4!/r/dFYAAAAAAAAA');
INSERT INTO `clique` VALUES ('35', '6', '4', '我母亲天天晚上腿抽筋睡不着', '我母亲腿抽筋十来年，时好时犯，最近半年天天晚上抽筋睡不好，什么原因啊，看了周围好多医生没确定病因，怎么治疗应该去哪里的哪个大夫就诊呢', '112', '2017-11-01', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/u1r*Aqg7kboMJ8Gl2MkQI1DpjA*tGtnfioOzyBVIpBI!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('36', '7', '4', '曹清华胶囊可以治腰椎间盘突出吗？', '我妈有腰椎间盘突出，右腿内侧痛，去医院做过保守治疗，也食过很多药，效果不佳，听人说曹清华胶囊可以，是真的吗，有些人说是假的，到底是真，是假', '73', '2017-11-09', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/PFCyzGIG*yl2lWAJrC7xSazDOqmcMQxhB0bCmKvaaDU!/r/dPIAAAAAAAAA');
INSERT INTO `clique` VALUES ('37', '8', '4', '求帮助，有类似情况的朋友吗？', '我老妈有腰椎间盘突出，近期右大腿内侧痛得利害，特别走路用力的时候，请问这是腰椎间盘突出的影响吗？用什么药治疗', '54', '2017-11-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/OGay8P5Jadwjse8N2M43s4Xv9GIJn0jUvy1L3WYD8pw!/r/dFUAAAAAAAAA');
INSERT INTO `clique` VALUES ('38', '9', '4', '啥时候能好，痛苦迷茫 ', '脚踝被班车门门轴和台阶间夹伤，拍片CT未骨折，做核磁发现韧带损失关节积液骨髓水肿，40天未完全制动，没打石膏，很少走路，现在又打上石膏了，目前打了7天，在吃西乐葆（女，28岁）', '55', '2017-11-21', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/MZyEZC*gMe3T96ZYuuW7Ah5RPfr3ce9qLAXcWiOvPfw!/r/dDABAAAAAAAA');
INSERT INTO `clique` VALUES ('39', '12', '4', '原来骨折后牛奶不能多喝！', '研究1、瑞典乌普萨拉大学的科学家最近有这样一项研究，然后发现，那些每天喝3杯或者3杯以上牛奶的人骨折的可能性更大，发生骨折的可能性比每天喝奶量在3杯以下的人增加了50%。研究2、还有一项研究发现，50岁以上的美国女性，髋骨骨折的比例位基本上可以排第一位，而在美国，人均摄取的牛奶和乳制品基本上也是排在全球第一的，很多的孩子在生长过程中不喝水只喝牛奶。而其他骨折高比例的国家，在欧洲和南太平洋(澳洲和新西兰)，同样在日常生活中也会喝很多的牛奶。', '84', '2017-11-22', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/TELz4.uHd8VV2pyz1LDqZhI7ekKFbnQLEP0XehBmRMc!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('40', '11', '4', '现在弯一会腰都特疼，咋回事？', '难道是撸多了？去年去地里干了一天的农活，两个星期腰直不起来，哎。废了！', '55', '2017-11-27', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/bM5DkdqeDzHPo4z.W9pMrsnvG.j3QwcoUAB5WJSem0o!/r/dEABAAAAAAAA');
INSERT INTO `clique` VALUES ('41', '2', '5', '治疗毛孔粗大的几个小偏方', '治疗毛孔粗大的几个小偏方', '148', '2017-12-01', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/iorQAFNWIm2aEzRcBgF.VjDd22MKhAu5yZXqfxTJ*5w!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('42', '1', '5', '皮肤干燥的小偏方', '每天只用一次洁面剂，由于干性皮肤特别缺水及容易因干燥而脱皮，因此可选用些含蜜糖、牛奶和维生素E等成分的洁面剂。但洁面剂不宜多用，每天一次就好，早上起床只用温水洗脸便可。', '113', '2017-12-29', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/ul9V63iihYDqEZerC50*6at0Si8sB.VYhcDZX.jBJlc!/r/dEMBAAAAAAAA');
INSERT INTO `clique` VALUES ('43', '23', '5', '祛斑缩毛孔的生活小偏方', '土豆美白面膜 土豆中含有丰富的维生素，可以促进皮肤细胞生长，保持皮肤光泽，漂白皮下黑色素，不仅可以美白嫩肤，而且可以减退夏日晒斑。\r\n\r\n　　1.土豆洗净并去皮切块，放进榨汁器中榨汁。\r\n\r\n　　2.在该容器中倒入三分之一杯新鲜牛奶，并拌入面粉，制成糊状，即可作为面膜使用。\r\n\r\n　　3.敷于脸上，20分钟后洗净。 ', '173', '2017-12-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/vG1jwlxI3d7ZDzSvobQqLJRCFV0anJqVJEU7jS*i5W4!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('44', '23', '5', '祛斑缩毛孔的生活小偏方', '菊花美颜\r\n\r\n　　菊花内含有丰富的香精油、菊色素，可有效抑制皮肤黑色素的产生，柔化表皮细胞。\r\n\r\n　　方法一：可将菊花制成花粥内服;\r\n\r\n　　方法二：可捣烂与蛋清拌匀敷面，能美白肌肤。', '134', '2017-12-09', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/UBA4xrXGC48spRXUb9bmWnuUjHbQC3zVEnHijoR.2ls!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('45', '5', '5', '治疗毛孔粗大的小偏方', '德国黑啤\r\n\r\n　　取一只干净的小碗倒入啤酒。将药用棉纱浸入啤酒约3分钟，取出棉纱，稍稍拧一下然后敷在脸上约半个小时，如果棉纱中的水分被吸干，可以按照前两步浸泡后再敷3次。取下棉纱后，你会惊喜地发现，皮肤变得紧致了，毛孔也缩小了。\r\n', '149', '2017-12-01', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/4uBrk4Qdtx8SgrnTUVoHruC8uWl.9C*VxCE.LlirDes!/r/dEYBAAAAAAAA');
INSERT INTO `clique` VALUES ('46', '5', '5', '偏方美容又奇效。。。', '时下，每逢问到靓女们的养颜心得，十个有九个都说全靠靓汤所赐。\r\n\r\n　　美国营养学家在对6万人的饮食状况良好与否的抽样调查结果显示，那些营养达标者，正是经常喝多种高质量汤的人。中医古籍记载的食疗方中，食药共熬的汤方占40%左右。以下介绍几种靓汤供女性参考。\r\n\r\n　　皮肤灰暗，睡眠好：虫草老龟冬虫夏草与老龟一起炖汤饮用，有补肺益肾、止血化痰、健脾安神、美白皮肤的功效，是女性四季适宜的补品。\r\n\r\n　　月经调，皮肤粗糙：红枣乌鸡汤\r\n红枣自古以来是补血佳品，而乌鸡更能益气、滋阴，经常服用可以调节月经紊乱，同时还可以滋养肌肤，起到美容功效。\r\n\r\n　　脾胃不和，满脸痘痘：土茯苓老清热解毒、健脾胃。土茯苓的味道比较重，所以在烹调时应通过调味来进行遮盖。\r\n\r\n　　眼皮沉重，头痛失眠：天麻乳鸽汤;天麻对于头疼眩晕、肢体麻木效果特别好，而乳鸽营养丰富，口感滑嫩，经常服用对于工作压力太大、用脑过度的女性来说，效果很好。\r\n\r\n　　工作忙碌，压力过大：西洋参甲西洋参温和，适合多数人进补之用，四季皆宜。而甲鱼的滋补功效尽人皆知，可以补气养阴、清火、养胃，对于那些工作繁忙、压力过大的白领女性特别适合\r\n\r\n', '121', '2017-12-19', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/ZEYZRuys8*d5IdZvBOLUNoIGw0GyYr*2BaorN9KfNis!/r/dFkAAAAAAAAA');
INSERT INTO `clique` VALUES ('47', '7', '5', '参杞酒可以预防皮肤老化', '[配方] 党参、枸杞子各25克，米酒500毫升。\r\n\r\n　　[制法] 将党参拍裂切片，枸杞子洗净，晾干，共置容器中，加入米酒，密封，浸泡7天后，过滤去渣。即成。\r\n\r\n　　[功用] 补气健脾、养肝益胃。\r\n\r\n　　[主治] 脾胃气虚、血虚萎黄、食欲不振、肢体倦怠、腰酸头晕等症。\r\n\r\n　　[用法] 口服每次服10%26mdash;15毫升，日服3次。\r\n\r\n　　[附记] 引自《民间百病良方》。感冒发热者慎服', '137', '2017-12-18', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/PFCyzGIG*yl2lWAJrC7xSazDOqmcMQxhB0bCmKvaaDU!/r/dPIAAAAAAAAA');
INSERT INTO `clique` VALUES ('48', '6', '5', '桂圆酒让你告诉皮肤粗糙', '[配方] 桂圆肉250克.构杞子120克，当归、菊花各30克，白酒3500毫升。\r\n\r\n　　[制法] 将前4味，入布袋，置容器中，加入白酒，密封，浸泡30天后，过滤去渣，即成。\r\n\r\n　　[功用] 养血润肤、滋补肝肾。\r\n\r\n　　[主治] 身体虚弱、皮肤粗糙、老化等。\r\n\r\n　　[用法] 口服。每次服10%26mdash;15毫升，日服 2次。\r\n\r\n　　[附记] 引自《药酒汇编》。身体强壮、内热甚者忌服', '61', '2017-12-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/OGay8P5Jadwjse8N2M43s4Xv9GIJn0jUvy1L3WYD8pw!/r/dFUAAAAAAAAA');
INSERT INTO `clique` VALUES ('49', '4', '5', '治疗麦粒肿的民间偏方', '取新鲜鸭跖草茎1寸长许二段，洗净，用手挟持呈45度角，置于酒精灯(或蜡烛)火上燃烧上段草茎，即可见下段有小珠泡沫液体滴出，用瓶贮存备用。\r\n\r\n　　用法：将滴下的液体，涂于患处及周围。每日3-5次。涂药后，患处即觉舒适。一般两天可痊愈。\r\n\r\n　　按：麦粒肿虽系小恙，但有时很顽固，容易复发。笔者用新鲜鸭跖草液治疗，效果很好，可根治不复发。\r\n', '43', '2017-12-24', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/4FvU07PaJODTFLYe6CQPQ75bvRiVFF39pW4PpUr2a3s!/r/dEcBAAAAAAAA');
INSERT INTO `clique` VALUES ('50', '3', '5', '夏季是红眼病流行时期，这里介绍2则防治红眼病的偏方', '　1.木贼草(笔壳草或笔筒草)15克、苦瓜250克(干苦瓜125克)煎汤(中老年人1次服用量)。先将鲜苦瓜洗净剖开去瓤，切成小薄片，木贼草切成3~5厘米长的短节，两味同时放入瓦锅，注入清水，文火煎至两碗，将渣滤去服用。早晚各1次，3天1个疗程，可治愈。\r\n\r\n　　2.桑叶(或菊花)、蒲公英各60克，煎水当茶饮。也可冷却后用来洗眼睛。此方服用7天左右可痊愈。\r\n', '85', '2017-12-21', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/BzRAK6IZ3bl3zoa0ZjwsATGN0h0FAPZdMWCXxl5BNK0!/r/dFYAAAAAAAAA');
INSERT INTO `clique` VALUES ('51', '2', '6', '润肤养颜祛斑一招搞定', '合蜂蜜汤\r\n\r\n　　配料：百合30克，白芷10克，香附子10克，白芍20克，糯米20克，蜂蜜50毫升。\r\n\r\n　　制法：百合、白芷、香附、白芍、糯米等五味，加水500毫升，煮取汁200毫升;再加水煎，取汁200毫升。2次汁混合搅拌后，和入蜂蜜，调匀食用。\r\n\r\n　　功能：养颜消斑，祛风除湿。\r\n\r\n　　本膳用白芍，柔肝敛肝;香附，疏肝理气;白芷，祛风养颜;百合，养肺滋阴;糯米，和中养颜;加上蜂蜜，可润肠泽肤、防治黄褐斑。', '121', '2018-01-01', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/vG1jwlxI3d7ZDzSvobQqLJRCFV0anJqVJEU7jS*i5W4!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('52', '1', '6', '方法四：雷射牙齿美白', '利用较高浓度的漂白剂(H2O2)，并通过特殊物质强化过氧化氢的漂白作用，将齿内有机色素漂白至亲水性无色素结构，达到安全美白的疗效。一次疗程3小时，可以在短时间内达到美白牙齿的效果。虽然使用过氧化氢药物可美白牙齿，但多多少少对牙齿本身和牙齿周围的软组织有伤害。美白后牙齿和软组织的不适大约过一周就可恢复正常。', '103', '2018-01-04', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/MZyEZC*gMe3T96ZYuuW7Ah5RPfr3ce9qLAXcWiOvPfw!/r/dDABAAAAAAAA');
INSERT INTO `clique` VALUES ('53', '9', '6', '方法三：活性牙齿漂白', '借着个人牙齿漂白牙托，放入10%的碳酸盐过氧化氢，将它牢牢地套在牙齿上，随着药物作用时间的增长，牙齿的颜色会渐渐地变淡、变白。这种方法操作简单，消费者可以自己在家做，可以自行决定要漂白牙齿的颗数、要漂白的次数和每次漂白的时间。但是，它的疗程较长，约2周的时间，才能达到一般患者想要的美白效果。另外，药物本身对牙齿，对软组织多少都有伤害，最好还是在牙医指导下做。', '112', '2018-01-06', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/PFCyzGIG*yl2lWAJrC7xSazDOqmcMQxhB0bCmKvaaDU!/r/dPIAAAAAAAAA');
INSERT INTO `clique` VALUES ('54', '7', '6', '牙齿美白方法二：超音波', '超音波洗牙主要是针对清除牙齿部分，牙结石容易造成牙菌斑的堆积，造成牙龈炎、。在治疗的同时，齿颈部、邻接面的结石去除掉了，牙齿也会有的表现。厚层的染色，借着超音波洗牙，也可以去除大部分。但是在牙齿有凹洞，有沟槽，或是邻接面的地方，染色是不易清除的。', '89', '2018-01-09', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/oQK7B.acFlh.zxhQFI2pHEphbeS7Ay7DQjI5I.arGow!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('55', '8', '6', '牙牙齿美白方法一：借助牙粉 ', '现在市面上有很多牙粉销售，你可以试着买回家使用。在使用一个星期之后，会有明显的效果。如果你本身牙的颜色就属于偏黄的话，可能就要到各牙医诊所请求帮助。', '121', '2018-01-18', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/QZnHnXD9MU.MWPf1vF7BL1VPEfa20ka9cJE.dmE3rbE!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('56', '6', '6', '槽牙黑心了怎么回事？', '槽牙黑心了，嚼硬的食物 有点酸酸的感觉，要去看牙科么？', '82', '2018-01-12', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/t5T4FBBNsX4bfm8IKRqTV8XDxX37a8d1KsRehRhsI10!/r/dGYBAAAAAAAA');
INSERT INTO `clique` VALUES ('57', '6', '6', '什么牙膏能白牙？？？', '现在牙齿黄黄的，偶尔抽烟，用什么牙膏好？', '67', '2018-01-15', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/arwkfgZLK1YfeO*7ghyMbkLAl0snOvq3tHNXhJ3fkuo!/r/dC0BAAAAAAAA');
INSERT INTO `clique` VALUES ('58', '5', '6', '牙齿的保健方法！！！', '牙齿的保健方法！！！', '88', '2018-01-18', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/ui3sc35h3TPr7YSx92EAOWAJnO6jYK9jUCRI8i2XloQ!/r/dIMAAAAAAAAA');
INSERT INTO `clique` VALUES ('60', '4', '6', '洗牙对牙齿不好呢？', '想去洗洗牙不知道好不好', '66', '2018-01-21', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/Zo*8d7LKwKd5DWTuqhRnGOO19s5R1e8dFScG1lzhJB8!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('61', '3', '7', '枸杞的食谱推荐 二、枸杞菜猪肝汤', '猪肝100克 枸杞菜300克 食盐 姜 料酒 淀粉 白醋 植物油猪肝洗净后切薄片，用清水和白醋浸泡15分钟，漂洗干净，用料酒、淀粉和1/2小勺盐抓拌均匀，姜切丝，猪肝腌制片刻，枸杞洗净，锅中倒入清水，大火烧开后放入姜丝、淋入植物油、滑入猪肝煮熟，放入枸杞菜滚煮片刻加1/2小勺盐调味即可。', '8', '2018-01-22', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/tLuchJjZtRyUInxzMyWY1Q1QXUK4xFT6VoT4QWYmj9Y!/r/dDIBAAAAAAAA');
INSERT INTO `clique` VALUES ('62', '3', '7', '枸杞的食谱推荐 一、枸杞粥', '白米1杯，山药300克，枸杞2大匙，水8杯。白米洗净沥干，山药去皮洗净切小块。锅中加水8杯煮开，放入白米、山药、枸杞续煮至滚时稍搅拌，改中小火熬煮30分钟即成。此粥能滋补肝肾，益精明目。适用于糖尿病以及肝肾阴虚所致的头晕目眩、视力减退、腰膝酸软、阳痿、遗精等症。肝炎患者服用枸杞粥，则有保肝护肝、促使肝细胞再生的良效', '9', '2018-01-23', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/zbwbofPK.CiAMQYiVvDJvY7VfJ9QSf.anq1iot24SIE!/r/dEUBAAAAAAAA');
INSERT INTO `clique` VALUES ('63', '2', '7', '枸杞神奇的治病功效 十', '\r\n10.妊娠呕吐：枸杞子、黄芩各50克。置带盖瓷缸内，以沸水冲浸，待温时频频饮服，喝完后可再用沸水冲，以愈为度。', '16', '2018-01-24', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/OFImX5skrJnxkbCSylZm1SebDqEf3vCG*7AV1g10448!/r/dDEBAAAAAAAA');
INSERT INTO `clique` VALUES ('64', '1', '7', '引起腰肌劳损的原因有哪些呢?', '2.急性腰扭伤后及长期反复的腰肌劳损。', '6', '2018-01-28', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/mv2DO9WCgaZC0TYtUjuUl5Y3IbyBSTTCS0ZSSslvF9o!/r/dDIBAAAAAAAA');

-- ----------------------------
-- Table structure for `cliquecomment`
-- ----------------------------
DROP TABLE IF EXISTS `cliquecomment`;
CREATE TABLE `cliquecomment` (
  `cliqueCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `cuserid` int(11) NOT NULL,
  `commentArtile` varchar(800) DEFAULT NULL,
  `commentclique` int(11) NOT NULL,
  `commentdate` char(200) DEFAULT '2018-06-24 07:08:00',
  PRIMARY KEY (`cliqueCommentID`),
  KEY `cliqueuserid` (`cuserid`),
  KEY `cfid` (`commentclique`),
  CONSTRAINT `cfid` FOREIGN KEY (`commentclique`) REFERENCES `clique` (`cliqueID`),
  CONSTRAINT `cliqueuserid` FOREIGN KEY (`cuserid`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cliquecomment
-- ----------------------------
INSERT INTO `cliquecomment` VALUES ('1', '1', '嗓子听喝点菊花茶，有那种糖浆的比较好喝，适合小孩子', '1', '2018-06-13 00:00:00');
INSERT INTO `cliquecomment` VALUES ('2', '2', '应该是上火了，没什么大事的', '2', '2018-06-12 06:00:00');
INSERT INTO `cliquecomment` VALUES ('3', '3', '去医院看看吧', '3', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('4', '4', '去北京首都儿童医院，那里看病挺好的', '4', '2018-06-03 00:05:00');
INSERT INTO `cliquecomment` VALUES ('5', '5', '应该首大耳鼻喉医院', '5', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('6', '6', '多喝点水', '6', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('7', '7', '去垂杨柳医院', '7', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('8', '8', '去垂杨柳医院看看', '8', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('9', '9', '把手纸掏出来', '9', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('10', '10', '各个医院的价钱不一样', '10', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('11', '1', '没什么大毛病。抹点皮炎平药膏就行了。', '11', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('12', '1', '抹点花露水', '12', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('13', '2', '去医院做检查', '13', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('14', '3', '先暂停使用吧', '14', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('15', '4', '皮肤病', '15', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('16', '5', '没有过', '16', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('17', '6', '不是，问问别人吧', '17', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('18', '7', '抢沙发', '18', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('19', '8', '抢沙发', '19', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('20', '9', '应该不用', '20', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('21', '10', '没有', '21', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('22', '11', '没有', '22', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('23', '12', '当然了', '23', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('24', '1', '去医院拍个片子吧', '24', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('25', '2', '不清楚', '25', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('26', '1', '应该是着凉了，贴点狗皮膏药', '26', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('27', '2', '扭着了吧？去医院拍个片子', '27', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('28', '3', '是的，有，我男朋友有时候也那样', '28', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('29', '4', '没有，抹点牙膏，嚼个花椒试试', '29', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('30', '5', '不告诉你', '30', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('31', '6', '没有，建议你最早做手术', '31', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('32', '1', '不可以，尽量避免着凉、干活太重', '32', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('33', '2', '不知道', '33', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('34', '3', '百度一下', '34', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('35', '4', '那应该去医院啊', '35', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('36', '5', '可以，但是效果不太显著', '36', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('37', '6', '我以前有过这样的情况', '37', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('38', '1', '慢慢等吧，总会好的', '38', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('39', '2', '谁说的，我觉得不科学啊', '39', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('40', '3', '贴个膏药吧', '40', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('41', '4', '用用浴盐试试', '41', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('42', '5', '用用空气加湿器', '42', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('43', '6', '并没有很好的办法，这个就是天生的', '43', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('44', '26', '喝水', '11', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('45', '26', '不知道', '1', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('46', '26', '不知道', '4', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('47', '26', '不知', '1', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('48', '26', '去医院吧', '11', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('49', '26', '去医院吧', '13', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('50', '26', '去医院吧', '12', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('51', '26', '不知道', '11', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('52', '26', '去医院', '14', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('53', '26', '不知道', '12', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('54', '26', '不可以', '32', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('55', '26', '不用吧', '20', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('56', '26', '呵', '22', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('57', '26', '没有', '21', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('58', '26', '敷面膜', '43', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('59', '26', '去医院', '42', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('60', '26', '不是', '23', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('61', '26', '请输入评论', '14', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('62', '26', '请输入评论', '14', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('63', '26', '皮肤', '15', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('64', '26', '这个不知道', '34', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('65', '26', '恩', '53', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('66', '26', '不知道', '13', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('67', '26', '去医院', '22', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('68', '26', '去医院吧', '33', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('69', '26', '去医院吧', '33', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('70', '26', '是吧', '23', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('71', '26', '恩', '23', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('72', '26', '不知道', '42', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('73', '26', '恩', '43', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('74', '26', '是吧', '2', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('75', '26', '谢了', '61', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('76', '26', '恩', '61', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('77', '26', '不知道', '1', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('78', '26', '去医院吧', '1', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('79', '26', '可以', '32', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('80', '26', '百度', '34', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('81', '26', '去医院', '1', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('82', '26', '1', '22', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('83', '26', '1', '23', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('84', '26', '1', '11', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('85', '26', '+1', '42', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('86', '27', '不知道', '2', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('87', '27', '没有', '31', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('88', '27', '1', '52', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('89', '27', '1', '33', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('90', '27', '1', '32', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('91', '27', '1', '22', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('92', '27', '1', '23', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('93', '27', '1', '2', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('94', '27', '1', '61', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('95', '27', '2', '33', '2018-06-06 00:00:00');
INSERT INTO `cliquecomment` VALUES ('96', '27', '1', '12', '2018-06-06 00:00:00');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `blogId` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `date`
-- ----------------------------
DROP TABLE IF EXISTS `date`;
CREATE TABLE `date` (
  `doctorDate_id` int(11) NOT NULL AUTO_INCREMENT,
  `date1` varchar(33) DEFAULT NULL,
  `date2` varchar(33) DEFAULT NULL,
  `date3` varchar(33) DEFAULT NULL,
  `date4` varchar(33) DEFAULT NULL,
  PRIMARY KEY (`doctorDate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of date
-- ----------------------------
INSERT INTO `date` VALUES ('1', '2018-05-04', '2018-07-09', '2018-07-11', '2018-12-20');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DOid` int(11) NOT NULL,
  `Dname` varchar(20) NOT NULL,
  `Ddirection` varchar(500) NOT NULL,
  `specialty` varchar(500) NOT NULL,
  `orderNum` int(50) DEFAULT NULL,
  `curreentNum` int(50) DEFAULT NULL,
  `Pic` varchar(500) NOT NULL,
  `goods` int(100) DEFAULT NULL,
  `DoctorDate` int(11) NOT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `DOCOffi` (`DOid`),
  KEY `yuyueriqi` (`DoctorDate`),
  CONSTRAINT `DOCOffi` FOREIGN KEY (`DOid`) REFERENCES `office` (`officeID`),
  CONSTRAINT `yuyueriqi` FOREIGN KEY (`DoctorDate`) REFERENCES `date` (`doctorDate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '1', '周慧敏', '周慧敏，女，主任医师，教授，内分泌血液科主任，博士，硕士研究生导师。从事内分泌血液专业近20年，擅长对糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗效果显著。获河北省科技进步二等奖1项、三等奖1项，河北省卫生厅科技进步一等奖1项、三等奖1项。发表论文10余篇，撰写专著2部。', '糖尿病及并发症干细胞移植治疗、糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '38', '0');
INSERT INTO `doctor` VALUES ('2', '2', '葛雪茹', '葛雪茹，女，内分泌血液科主任医师、教授，国务院特殊津贴专家，河北省内科学会委员，河北省血液学会副主任委员，河北省中西医结合血液学会常务委员。从事内科学工作40余年，擅长治疗各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症。发表医学论文76篇，参编著作1部，获得省部级、省厅级科技进步奖6项，协作奖2项。', '	\r\n各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症、糖尿病、内分泌性高血压、血液系统疾病及疑难杂症的诊治', '100', '28', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/UrhSSUL2jW180GcbCygQ*piaQLE9lCF.aa60GN.dvH0!/r/dFUBAAAAAAAA', '20', '0');
INSERT INTO `doctor` VALUES ('3', '4', '韩旭', '工作至今，能熟练处理妇科常见病和疑难病例，研究方向为妇科肿瘤及盆底障碍性疾病的诊治，擅长针对子宫肌瘤、卵巢肿瘤、不孕症和子宫内膜癌、子宫颈癌、卵巢癌等疾病的经阴道和宫腹腔镜等途径的微创手术。', '糖尿病', '100', '43', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/yNnjMNU4RupZN8VjBZiYhLtflIBydHpWUyTvCyAwlhc!/r/dPIAAAAAAAAA', '10', '0');
INSERT INTO `doctor` VALUES ('4', '5', '任庆云', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/hEfmshjbsFTJdNr6UwuGIgpJrZgbSMf84U.VdbnZlF0!/r/dPIAAAAAAAAA', '123', '0');
INSERT INTO `doctor` VALUES ('5', '6', '刘连祥', '刘连祥，男，主任医师，教授，熟悉全身各系统疾病的普通X线诊断和CT、MR诊断，对消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断有较深的研究。获省科技二等奖一项、三等奖四项。', '消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断、医学影像诊断，全身各系统普通X线、CT和MR诊断', '100', '54', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '53', '0');
INSERT INTO `doctor` VALUES ('6', '51', '李慧敏', '李慧敏，女，主任医师，教授，内分泌血液科主任，博士，硕士研究生导师。从事内分泌血液专业近20年，擅长对糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗效果显著。获河北省科技进步二等奖1项、三等奖1项，河北省卫生厅科技进步一等奖1项、三等奖1项。发表论文10余篇，撰写专著2部。', '糖尿病及并发症干细胞移植治疗、糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '38', '0');
INSERT INTO `doctor` VALUES ('7', '52', '葛雪', '内分泌血液科主任医师、教授，国务院特殊津贴专家，河北省内科学会委员，河北省血液学会副主任委员，河北省中西医结合血液学会常务委员。从事内科学工作40余年，擅长治疗各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症。发表医学论文76篇，参编著作1部，获得省部级、省厅级科技进步奖6项，协作奖2项。', '各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症、糖尿病、内分泌性高血压、血液系统疾病及疑难杂症的诊治', '100', '90', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/UrhSSUL2jW180GcbCygQ*piaQLE9lCF.aa60GN.dvH0!/r/dFUBAAAAAAAA', '23', '0');
INSERT INTO `doctor` VALUES ('8', '54', '韩旭辉', '主任医师，教授，放射科主任，医学博士，硕士研究生导师。中华医学会河北省放射学会委员，石家庄市放射学会副主任委员。从事医学影像诊断工作20余年，有丰富的临床经验，近年来开展的非创伤性CT血管造影技术应用于肺动脉栓塞的CTA诊断、颈椎病椎动脉狭窄的CTA诊断及茎突过长综合征的三维CT重建技术、四肢与脊柱骨折的三维CT重建等技术在国内处于先进水平。开展肝、肾、胰腺及肺部肿瘤的三期增强螺旋CT扫描技术，明显提高了肿瘤的诊断水平。承担国家级、省级科研课题4项，发表学术论文40余篇。', '非创伤性CT血管造影技术应用于肺动脉栓塞的CTA诊断、颈椎病椎动脉狭窄的CTA诊断及茎突过长综合征的三维CT重建技术、四肢与脊柱骨折的三维CT重建等、放射诊断，MR诊断，恶性肿瘤的经皮射频消融治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/rOzls8tBS7HT57Ae78NF3hLG7xf.vKK5wYon8ZG5Tys!/r/dMgAAAAAAAAA', '88', '0');
INSERT INTO `doctor` VALUES ('9', '55', '任庆', '主任医师，教授，熟悉全身各系统疾病的普通X线诊断和CT、MR诊断，对消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断有较深的研究。获省科技二等奖一项、三等奖四项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '66', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/yNnjMNU4RupZN8VjBZiYhLtflIBydHpWUyTvCyAwlhc!/r/dPIAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('10', '56', '刘恋', '主任医师，教授，熟悉全身各系统疾病的普通X线诊断和CT、MR诊断，对消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断有较深的研究。获省科技二等奖一项、三等奖四项。', '消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断、医学影像诊断，全身各系统普通X线、CT和MR诊断', '100', '78', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/UrhSSUL2jW180GcbCygQ*piaQLE9lCF.aa60GN.dvH0!/r/dFUBAAAAAAAA', '32', '0');
INSERT INTO `doctor` VALUES ('11', '81', '张辉', '教授，内分泌血液科主任，博士，硕士研究生导师。从事内分泌血液专业近20年，擅长对糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗效果显著。获河北省科技进步二等奖1项、三等奖1项，河北省卫生厅科技进步一等奖1项、三等奖1项。发表论文10余篇，撰写专著2部。', '糖尿病及并发症干细胞移植治疗、糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗', '100', '12', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/O94sURZHt2wiIRZOvIJ8CoexlucUSsNJtolI3dAjYE8!/r/dF4BAAAAAAAA', '32', '0');
INSERT INTO `doctor` VALUES ('12', '82', '李茹', '女，内分泌血液科主任医师、教授，国务院特殊津贴专家，河北省内科学会委员，河北省血液学会副主任委员，河北省中西医结合血液学会常务委员。从事内科学工作40余年，擅长治疗各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症。发表医学论文76篇，参编著作1部，获得省部级、省厅级科技进步奖6项，协作奖2项。', '各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症、糖尿病、内分泌性高血压、血液系统疾病及疑难杂症的诊治', '100', '33', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '99', '0');
INSERT INTO `doctor` VALUES ('13', '84', '韩锡侯', '中华医学会河北省放射学会委员，石家庄市放射学会副主任委员。从事医学影像诊断工作20余年，有丰富的临床经验，近年来开展的非创伤性CT血管造影技术应用于肺动脉栓塞的CTA诊断、颈椎病椎动脉狭窄的CTA诊断及茎突过长综合征的三维CT重建技术、四肢与脊柱骨折的三维CT重建等技术在国内处于先进水平。开展肝、肾、胰腺及肺部肿瘤的三期增强螺旋CT扫描技术，明显提高了肿瘤的诊断水平。承担国家级、省级科研课题4项，发表学术论文40余篇。', '非创伤性CT血管造影技术应用于肺动脉栓塞的CTA诊断、颈椎病椎动脉狭窄的CTA诊断及茎突过长综合征的三维CT重建技术、四肢与脊柱骨折的三维CT重建等、放射诊断，MR诊断，恶性肿瘤的经皮射频消融治疗', '100', '12', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/OzlOisV70Dqo3OjbMf0vRVIV5YnCwI4CK.YZdC54DOI!/r/dPMAAAAAAAAA', '80', '0');
INSERT INTO `doctor` VALUES ('14', '85', '任云', '教授，熟悉全身各系统疾病的普通X线诊断和CT、MR诊断，对消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断有较深的研究。获省科技二等奖一项、三等奖四项。', '消化系统的X线诊断和呼吸系统、肝胆的CT诊断以及中枢神经系统、肝胆的磁共振诊断、医学影像诊断，全身各系统普通X线、CT和MR诊断', '100', '80', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '120', '0');
INSERT INTO `doctor` VALUES ('15', '96', '周辉', '教授，内分泌血液科主任，博士，硕士研究生导师。从事内分泌血液专业近20年，擅长对糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗效果显著。获河北省科技进步二等奖1项、三等奖1项，河北省卫生厅科技进步一等奖1项、三等奖1项。发表论文10余篇，撰写专著2部。', '糖尿病及并发症干细胞移植治疗、糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗', '100', '80', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/ze6k62WL946XUhAtnzqeLfSJSmP*iwPgF1aFBKpwqp0!/r/dAQBAAAAAAAA', '44', '0');
INSERT INTO `doctor` VALUES ('16', '97', '葛亚如', '内分泌血液科主任医师、教授，国务院特殊津贴专家，河北省内科学会委员，河北省血液学会副主任委员，河北省中西医结合血液学会常务委员。从事内科学工作40余年，擅长治疗各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症。发表医学论文76篇，参编著作1部，获得省部级、省厅级科技进步奖6项，协作奖2项。', '各类贫血、血小板减少、白细胞减少、白血病、淋巴瘤、过敏性紫癜及内科疑难杂症、糖尿病、内分泌性高血压、血液系统疾病及疑难杂症的诊治', '100', '90', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '42', '0');
INSERT INTO `doctor` VALUES ('17', '99', '韩叙', '工作至今，能熟练处理妇科常见病和疑难病例，研究方向为妇科肿瘤及盆底障碍性疾病的诊治，擅长针对子宫肌瘤、卵巢肿瘤、不孕症和子宫内膜癌、子宫颈癌、卵巢癌等疾病的经阴道和宫腹腔镜等途径的微创手术。', '糖尿病', '100', '43', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '32', '0');
INSERT INTO `doctor` VALUES ('18', '100', '王晴纯', '放射科主任，医学博士，硕士研究生导师。中华医学会河北省放射学会委员，石家庄市放射学会副主任委员。从事医学影像诊断工作20余年，有丰富的临床经验，近年来开展的非创伤性CT血管造影技术应用于肺动脉栓塞的CTA诊断、颈椎病椎动脉狭窄的CTA诊断及茎突过长综合征的三维CT重建技术、四肢与脊柱骨折的三维CT重建等技术在国内处于先进水平。开展肝、肾、胰腺及肺部肿瘤的三期增强螺旋CT扫描技术，明显提高了肿瘤的诊断水平。承担国家级、省级科研课题4项，发表学术论文40余篇。', '非创伤性CT血管造影技术应用于肺动脉栓塞的CTA诊断、颈椎病椎动脉狭窄的CTA诊断及茎突过长综合征的三维CT重建技术、四肢与脊柱骨折的三维CT重建等、放射诊断，MR诊断，恶性肿瘤的经皮射频消融治疗', '100', '54', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/UrhSSUL2jW180GcbCygQ*piaQLE9lCF.aa60GN.dvH0!/r/dFUBAAAAAAAA', '112', '0');
INSERT INTO `doctor` VALUES ('19', '107', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '90', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '34', '0');
INSERT INTO `doctor` VALUES ('20', '117', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '69', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('21', '127', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '44', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '22', '0');
INSERT INTO `doctor` VALUES ('22', '137', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '54', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '111', '0');
INSERT INTO `doctor` VALUES ('23', '147', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '12', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '175', '0');
INSERT INTO `doctor` VALUES ('24', '157', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '90', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '245', '0');
INSERT INTO `doctor` VALUES ('25', '167', '陈宝昌', '教授，儿科主任，硕士生导师，河北省儿科学会青年委员，石家庄市围产学会委员。从事儿科临床、教学、科研工作20多年，曾在河北省儿童医院从事儿科临床工作10余年，对儿科多种疾病的诊疗有丰富的临床经验，对小儿危重症的抢救、各种感染性疾病的诊疗均由独到之处，擅长小儿急救、新生儿消化、呼吸系统等疾病的治疗。在国家级刊物发表论文30余篇，著作4部，获河北医学科技优秀成果奖二等奖4项，三等奖1项。', '儿科疾病，新生儿各种疾病的诊疗，极低出生体重儿的救治及新生儿机械通气，小儿急救、新生儿消化、呼吸系统等疾病的治疗', '100', '88', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/BKGv9JwKJ71A7xGW0F3Xrofw*5k5ZOnCAur.uGaXd44!/r/dJUAAAAAAAAA', '123', '0');
INSERT INTO `doctor` VALUES ('26', '11', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '80', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('27', '21', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '11', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('28', '71', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '21', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('29', '86', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '22', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('30', '101', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '12', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('31', '111', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '33', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('32', '121', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '12', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('33', '131', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '8', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('34', '141', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '12', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '98', '0');
INSERT INTO `doctor` VALUES ('35', '151', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '32', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '33', '0');
INSERT INTO `doctor` VALUES ('36', '161', '田军海', '田君海，男，耳鼻咽喉科主任医师，副教授，医学硕士，河北省耳鼻咽喉科学会青年委员。从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及头颈科学等方面的工作，对眩晕疾病的治疗有深入研究。发表论文及专著２０余篇。', '从事耳鼻咽喉头颈外科的基础研究和临床工作及教学２０余年。曾在武汉协和医院、中国医学科学院肿瘤医院等进修学习。目前主要研究和开展有关鼻科学、耳科学及眩晕疾病的治疗有深入研究。', '100', '33', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/Hfi.2WI3F5808uXfYLuJx8G9CF4xg9KFSNwbHrH4Unc!/r/dPMAAAAAAAAA', '20', '0');
INSERT INTO `doctor` VALUES ('37', '12', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('38', '22', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('39', '42', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('40', '72', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('41', '87', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('42', '102', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('43', '112', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('44', '122', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('45', '132', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('46', '142', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('47', '152', '霍晓辉', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('48', '162', '田军海', '霍晓辉，男，主任医师，教授，消化内科主任，医学硕士，留日专家。擅长食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '消化系统常见病，溃疡性结肠炎、胰腺炎、肝硬化、及胃癌、结肠癌、肝癌等的化疗、介入治疗，食道、胃肠道和肝胆疾病的诊断和治疗，以及胃镜、结肠镜以及十二指肠镜下的诊断和治疗', '100', '50', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '90', '0');
INSERT INTO `doctor` VALUES ('49', '13', '袁振云', '女，急诊科副主任医师，副教授，医学博士，硕士研究生导师，国外留学专家，共产党员。主持河北省科技厅课题2项、河北省卫生厅课题3项、河北省留学人员科技活动项目择优资助经费课题1项。获河北省医学科技进步二等奖1项，获河北科技成果1项，获国家实用新型发明专利1项。发表论文20余篇，其中SCI收录2篇。参编专著1部。长期从事危重病急救专业工作，临床经验丰富，对各种中毒、危重病、急性脑血管病诊治有独到之处。', '各种中毒及急、危、重症的抢救', '100', '45', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '122', '0');
INSERT INTO `doctor` VALUES ('50', '23', '李庆威', '男，副主任医师，副教授，急诊科副主任，从事急诊工作20余年，擅长各种心律失常、心力衰竭、高血压危象、休克、脑卒中、眩晕、腹痛、上消化道出血等疾病的诊治，尤其是对心脑血管意外、昏迷、中毒等危重患者的救治有独到的见解，多次成功救治危重患者。担任省级课题1项，在省内外期刊发表论文多篇。撰写脑血管病专著一部。', '擅长各种心律失常、心力衰竭、高血压危象、休克、脑卒中、眩晕、腹痛、上消化道出血等疾病的诊治，尤其是对心脑血管意外、昏迷、中毒等危重患者的救治有独到的见解，多次成功救治危重患者。', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '40', '0');
INSERT INTO `doctor` VALUES ('51', '43', '季文强', '季文强，男，副主任医师、副教授。急诊科主任，长期从事危重病急救专业工作，临床经验丰富，每年组织抢救上千例危重病人，擅长心肺脑复苏，各种中毒及急、危、重症的救治。发表论文10余篇，现任河北省医学会急诊学分会委员。', '心肺脑复苏，各种中毒及急、危、重症的救治', '100', '45', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '56', '0');
INSERT INTO `doctor` VALUES ('52', '73', '蒋向明', '男，急诊科副主任医师，副教授，从事急诊、外科和骨科临床工作20余年，擅长手外伤、四肢骨折脱位、重度颅脑损伤的诊治，尤其是对车祸、高空坠落等各种原因导致的多发伤、复合伤、腹部急危重症的急救、诊断和治疗有丰富的临床经验，担任省级课题2项，在省内外期刊发表论文多篇。', '创伤急救，中西医结合治疗骨髓炎、化脓性关节炎等', '100', '2', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '78', '0');
INSERT INTO `doctor` VALUES ('53', '88', '袁振云', '女，急诊科副主任医师，副教授，医学博士，硕士研究生导师，国外留学专家，共产党员。主持河北省科技厅课题2项、河北省卫生厅课题3项、河北省留学人员科技活动项目择优资助经费课题1项。获河北省医学科技进步二等奖1项，获河北科技成果1项，获国家实用新型发明专利1项。发表论文20余篇，其中SCI收录2篇。参编专著1部。长期从事危重病急救专业工作，临床经验丰富，对各种中毒、危重病、急性脑血管病诊治有独到之处。', '各种中毒及急、危、重症的抢救', '100', '45', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '122', '0');
INSERT INTO `doctor` VALUES ('54', '103', '李庆威', '男，副主任医师，副教授，急诊科副主任，从事急诊工作20余年，擅长各种心律失常、心力衰竭、高血压危象、休克、脑卒中、眩晕、腹痛、上消化道出血等疾病的诊治，尤其是对心脑血管意外、昏迷、中毒等危重患者的救治有独到的见解，多次成功救治危重患者。担任省级课题1项，在省内外期刊发表论文多篇。撰写脑血管病专著一部。', '擅长各种心律失常、心力衰竭、高血压危象、休克、脑卒中、眩晕、腹痛、上消化道出血等疾病的诊治，尤其是对心脑血管意外、昏迷、中毒等危重患者的救治有独到的见解，多次成功救治危重患者。', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '40', '0');
INSERT INTO `doctor` VALUES ('55', '113', '季文强', '季文强，男，副主任医师、副教授。急诊科主任，长期从事危重病急救专业工作，临床经验丰富，每年组织抢救上千例危重病人，擅长心肺脑复苏，各种中毒及急、危、重症的救治。发表论文10余篇，现任河北省医学会急诊学分会委员。', '心肺脑复苏，各种中毒及急、危、重症的救治', '100', '45', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '56', '0');
INSERT INTO `doctor` VALUES ('56', '123', '蒋向明', '男，急诊科副主任医师，副教授，从事急诊、外科和骨科临床工作20余年，擅长手外伤、四肢骨折脱位、重度颅脑损伤的诊治，尤其是对车祸、高空坠落等各种原因导致的多发伤、复合伤、腹部急危重症的急救、诊断和治疗有丰富的临床经验，担任省级课题2项，在省内外期刊发表论文多篇。', '创伤急救，中西医结合治疗骨髓炎、化脓性关节炎等', '100', '2', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '78', '0');
INSERT INTO `doctor` VALUES ('57', '133', '袁振云', '女，急诊科副主任医师，副教授，医学博士，硕士研究生导师，国外留学专家，共产党员。主持河北省科技厅课题2项、河北省卫生厅课题3项、河北省留学人员科技活动项目择优资助经费课题1项。获河北省医学科技进步二等奖1项，获河北科技成果1项，获国家实用新型发明专利1项。发表论文20余篇，其中SCI收录2篇。参编专著1部。长期从事危重病急救专业工作，临床经验丰富，对各种中毒、危重病、急性脑血管病诊治有独到之处。', '各种中毒及急、危、重症的抢救', '100', '45', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '122', '0');
INSERT INTO `doctor` VALUES ('58', '143', '李庆威', '男，副主任医师，副教授，急诊科副主任，从事急诊工作20余年，擅长各种心律失常、心力衰竭、高血压危象、休克、脑卒中、眩晕、腹痛、上消化道出血等疾病的诊治，尤其是对心脑血管意外、昏迷、中毒等危重患者的救治有独到的见解，多次成功救治危重患者。担任省级课题1项，在省内外期刊发表论文多篇。撰写脑血管病专著一部。', '擅长各种心律失常、心力衰竭、高血压危象、休克、脑卒中、眩晕、腹痛、上消化道出血等疾病的诊治，尤其是对心脑血管意外、昏迷、中毒等危重患者的救治有独到的见解，多次成功救治危重患者。', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '40', '0');
INSERT INTO `doctor` VALUES ('59', '153', '季文强', '季文强，男，副主任医师、副教授。急诊科主任，长期从事危重病急救专业工作，临床经验丰富，每年组织抢救上千例危重病人，擅长心肺脑复苏，各种中毒及急、危、重症的救治。发表论文10余篇，现任河北省医学会急诊学分会委员。', '心肺脑复苏，各种中毒及急、危、重症的救治', '100', '45', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '56', '0');
INSERT INTO `doctor` VALUES ('60', '163', '蒋向明', '男，急诊科副主任医师，副教授，从事急诊、外科和骨科临床工作20余年，擅长手外伤、四肢骨折脱位、重度颅脑损伤的诊治，尤其是对车祸、高空坠落等各种原因导致的多发伤、复合伤、腹部急危重症的急救、诊断和治疗有丰富的临床经验，担任省级课题2项，在省内外期刊发表论文多篇。', '创伤急救，中西医结合治疗骨髓炎、化脓性关节炎等', '100', '2', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '78', '0');
INSERT INTO `doctor` VALUES ('61', '14', '孙武装', '	孙武装，男，主任医师，教授，呼吸内科主任，硕士研究生导师，河北省中西医结合学会呼吸分会及石家庄市医学会呼吸分会会员。主要从事慢性阻塞性肺病的基础及临床研究、肺部疾病介入治疗研究。目前主持及参与的省级课题七项。从事临床工作多年，在呼吸系统疾病诊治方面有丰富的临床经验。', '治疗慢性支气管炎、肺心病、哮喘、肺部肿瘤、肺间质病及危重病人抢救等，应用气管镜诊断及介入治疗各种呼吸疾病', '100', '59', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '321', '0');
INSERT INTO `doctor` VALUES ('62', '24', '李新玲', '女，主任医师，教授，从医30多年来，工作踏实、服务热情，为了提高诊疗水平，从不计较个人得失，待病人如亲人，受到患者广泛赞誉，连续多年被评为卫生系统先进工作者。对呼吸危重病、肺血管疾病、支气管哮喘等疾病的诊断和治疗有较深的造诣。', '急慢性胸、肺、血管疾病、支气管哮喘等疾病的诊断和治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/UrhSSUL2jW180GcbCygQ*piaQLE9lCF.aa60GN.dvH0!/r/dFUBAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('63', '44', '孙武装', '	孙武装，男，主任医师，教授，呼吸内科主任，硕士研究生导师，河北省中西医结合学会呼吸分会及石家庄市医学会呼吸分会会员。主要从事慢性阻塞性肺病的基础及临床研究、肺部疾病介入治疗研究。目前主持及参与的省级课题七项。从事临床工作多年，在呼吸系统疾病诊治方面有丰富的临床经验。', '治疗慢性支气管炎、肺心病、哮喘、肺部肿瘤、肺间质病及危重病人抢救等，应用气管镜诊断及介入治疗各种呼吸疾病', '100', '59', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '321', '0');
INSERT INTO `doctor` VALUES ('64', '74', '李新玲', '女，主任医师，教授，从医30多年来，工作踏实、服务热情，为了提高诊疗水平，从不计较个人得失，待病人如亲人，受到患者广泛赞誉，连续多年被评为卫生系统先进工作者。对呼吸危重病、肺血管疾病、支气管哮喘等疾病的诊断和治疗有较深的造诣。', '急慢性胸、肺、血管疾病、支气管哮喘等疾病的诊断和治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/9KUh2hQcIVes6D*oPUTg4GTYunfx.NKUhb2b9sRjocc!/r/dFUBAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('65', '89', '孙武装', '	孙武装，男，主任医师，教授，呼吸内科主任，硕士研究生导师，河北省中西医结合学会呼吸分会及石家庄市医学会呼吸分会会员。主要从事慢性阻塞性肺病的基础及临床研究、肺部疾病介入治疗研究。目前主持及参与的省级课题七项。从事临床工作多年，在呼吸系统疾病诊治方面有丰富的临床经验。', '治疗慢性支气管炎、肺心病、哮喘、肺部肿瘤、肺间质病及危重病人抢救等，应用气管镜诊断及介入治疗各种呼吸疾病', '100', '59', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '321', '0');
INSERT INTO `doctor` VALUES ('66', '104', '李新玲', '女，主任医师，教授，从医30多年来，工作踏实、服务热情，为了提高诊疗水平，从不计较个人得失，待病人如亲人，受到患者广泛赞誉，连续多年被评为卫生系统先进工作者。对呼吸危重病、肺血管疾病、支气管哮喘等疾病的诊断和治疗有较深的造诣。', '急慢性胸、肺、血管疾病、支气管哮喘等疾病的诊断和治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/9KUh2hQcIVes6D*oPUTg4GTYunfx.NKUhb2b9sRjocc!/r/dFUBAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('67', '114', '孙武装', '	孙武装，男，主任医师，教授，呼吸内科主任，硕士研究生导师，河北省中西医结合学会呼吸分会及石家庄市医学会呼吸分会会员。主要从事慢性阻塞性肺病的基础及临床研究、肺部疾病介入治疗研究。目前主持及参与的省级课题七项。从事临床工作多年，在呼吸系统疾病诊治方面有丰富的临床经验。', '治疗慢性支气管炎、肺心病、哮喘、肺部肿瘤、肺间质病及危重病人抢救等，应用气管镜诊断及介入治疗各种呼吸疾病', '100', '59', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '321', '0');
INSERT INTO `doctor` VALUES ('68', '124', '李新玲', '女，主任医师，教授，从医30多年来，工作踏实、服务热情，为了提高诊疗水平，从不计较个人得失，待病人如亲人，受到患者广泛赞誉，连续多年被评为卫生系统先进工作者。对呼吸危重病、肺血管疾病、支气管哮喘等疾病的诊断和治疗有较深的造诣。', '急慢性胸、肺、血管疾病、支气管哮喘等疾病的诊断和治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/9KUh2hQcIVes6D*oPUTg4GTYunfx.NKUhb2b9sRjocc!/r/dFUBAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('69', '134', '孙武装', '	孙武装，男，主任医师，教授，呼吸内科主任，硕士研究生导师，河北省中西医结合学会呼吸分会及石家庄市医学会呼吸分会会员。主要从事慢性阻塞性肺病的基础及临床研究、肺部疾病介入治疗研究。目前主持及参与的省级课题七项。从事临床工作多年，在呼吸系统疾病诊治方面有丰富的临床经验。', '治疗慢性支气管炎、肺心病、哮喘、肺部肿瘤、肺间质病及危重病人抢救等，应用气管镜诊断及介入治疗各种呼吸疾病', '100', '59', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '321', '0');
INSERT INTO `doctor` VALUES ('70', '144', '李新玲', '女，主任医师，教授，从医30多年来，工作踏实、服务热情，为了提高诊疗水平，从不计较个人得失，待病人如亲人，受到患者广泛赞誉，连续多年被评为卫生系统先进工作者。对呼吸危重病、肺血管疾病、支气管哮喘等疾病的诊断和治疗有较深的造诣。', '急慢性胸、肺、血管疾病、支气管哮喘等疾病的诊断和治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/9KUh2hQcIVes6D*oPUTg4GTYunfx.NKUhb2b9sRjocc!/r/dFUBAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('71', '154', '孙武装', '	孙武装，男，主任医师，教授，呼吸内科主任，硕士研究生导师，河北省中西医结合学会呼吸分会及石家庄市医学会呼吸分会会员。主要从事慢性阻塞性肺病的基础及临床研究、肺部疾病介入治疗研究。目前主持及参与的省级课题七项。从事临床工作多年，在呼吸系统疾病诊治方面有丰富的临床经验。', '治疗慢性支气管炎、肺心病、哮喘、肺部肿瘤、肺间质病及危重病人抢救等，应用气管镜诊断及介入治疗各种呼吸疾病', '100', '59', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '321', '0');
INSERT INTO `doctor` VALUES ('72', '164', '李新玲', '女，主任医师，教授，从医30多年来，工作踏实、服务热情，为了提高诊疗水平，从不计较个人得失，待病人如亲人，受到患者广泛赞誉，连续多年被评为卫生系统先进工作者。对呼吸危重病、肺血管疾病、支气管哮喘等疾病的诊断和治疗有较深的造诣。', '急慢性胸、肺、血管疾病、支气管哮喘等疾病的诊断和治疗', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/9KUh2hQcIVes6D*oPUTg4GTYunfx.NKUhb2b9sRjocc!/r/dFUBAAAAAAAA', '21', '0');
INSERT INTO `doctor` VALUES ('73', '15', '赵增仁', '男，主任医师，教授，博士生导师。河北医科大学第一医院副院长兼任普通外科主任。中国医师协会外科医师分会委员；河北省医师协会血管外科医师分会主任委员；河北省医学会外科分会副主任委员；河北省医学会血管外科分会副主任委员；河北省抗癌协会胃癌、大肠癌专业委员会常委、乳腺癌专业委员会常委、河北省中西医结合学会大肠肛门病学会副主任委员；国家自然基金委评委；科技部国际合作项目技术评审专家；科技部科技进步奖评审专家。', '普外系统常见疾病的诊断，胃肠肿瘤及乳腺肿瘤的手术治疗', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '172', '0');
INSERT INTO `doctor` VALUES ('74', '25', '张峰', '男，主任医师，教授，副院长，普通外科学科主任，医学博士,硕士研究生导师，享受国务院特殊津贴，河北省新世纪“三三三人才工程”第二次人选。担任河北省医学会、医师协会外科学分会副主任委员,河北省医学会理事会理事，河北省中西医结合外科专业委员会副主任委员。《中国烧伤创疡》杂志编委，《医学与哲学杂志临床决策》编委，《中国新药与临床》杂志编委，《河北医科大学学报》编委，《中国微创外科》杂志编委。', '肝胆、胰脾外科产疾病的诊治及手术、能完成电视腹腔镜胆囊切除术、充填式无张力疝修补术等高新技术', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '89', '0');
INSERT INTO `doctor` VALUES ('75', '45', '姜海波', '现任河北省人民医院普外一科(腺体外科)副主任医师，副教授，医学博士，硕士研究生导师。曾于2011-2012年在美国德克萨斯大学MD 安德森癌症中心留学深造。擅长乳腺癌、甲状腺癌的规范化诊治，尤其是早期乳腺癌的诊断和治疗以及乳腺癌术前新辅助化疗。除常规乳腺癌根治手术外，擅长乳房肿瘤整形和微创、美容手术，以及乳房再造手术。', '	擅长乳腺癌、甲状腺癌的规范化诊治，尤其是早期乳腺癌的诊断和治疗以及乳腺癌术前新辅助化疗。除常规乳腺癌根治手术外，擅长乳房肿瘤整形和微创、美容手术，以及乳房再造手术。', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '36', '0');
INSERT INTO `doctor` VALUES ('76', '75', '李卫', '王跃欣，男，副主任医师，副教授，医学硕士，擅长各种乳房疾病，乳房疼痛，乳房肿块，乳头溢液，甲状腺的良恶性肿瘤，甲亢，甲状腺肿瘤，开展了乳癌改良根治术与乳癌保乳手术和甲状腺癌保留功能的根治手术。', '	各种乳房疾病，乳房疼痛，乳房肿块，乳头溢液，甲状腺的良恶性肿瘤，甲亢，甲状腺肿瘤，开展了乳癌改良根治术与乳癌保乳手术和甲状腺癌保留功能的根治手术', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '65', '0');
INSERT INTO `doctor` VALUES ('77', '90', '赵增仁', '男，主任医师，教授，博士生导师。河北医科大学第一医院副院长兼任普通外科主任。中国医师协会外科医师分会委员；河北省医师协会血管外科医师分会主任委员；河北省医学会外科分会副主任委员；河北省医学会血管外科分会副主任委员；河北省抗癌协会胃癌、大肠癌专业委员会常委、乳腺癌专业委员会常委、河北省中西医结合学会大肠肛门病学会副主任委员；国家自然基金委评委；科技部国际合作项目技术评审专家；科技部科技进步奖评审专家。', '普外系统常见疾病的诊断，胃肠肿瘤及乳腺肿瘤的手术治疗', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '172', '0');
INSERT INTO `doctor` VALUES ('78', '105', '张峰', '男，主任医师，教授，副院长，普通外科学科主任，医学博士,硕士研究生导师，享受国务院特殊津贴，河北省新世纪“三三三人才工程”第二次人选。担任河北省医学会、医师协会外科学分会副主任委员,河北省医学会理事会理事，河北省中西医结合外科专业委员会副主任委员。《中国烧伤创疡》杂志编委，《医学与哲学杂志临床决策》编委，《中国新药与临床》杂志编委，《河北医科大学学报》编委，《中国微创外科》杂志编委。', '肝胆、胰脾外科产疾病的诊治及手术、能完成电视腹腔镜胆囊切除术、充填式无张力疝修补术等高新技术', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '89', '0');
INSERT INTO `doctor` VALUES ('79', '115', '姜海波', '现任河北省人民医院普外一科(腺体外科)副主任医师，副教授，医学博士，硕士研究生导师。曾于2011-2012年在美国德克萨斯大学MD 安德森癌症中心留学深造。擅长乳腺癌、甲状腺癌的规范化诊治，尤其是早期乳腺癌的诊断和治疗以及乳腺癌术前新辅助化疗。除常规乳腺癌根治手术外，擅长乳房肿瘤整形和微创、美容手术，以及乳房再造手术。', '	擅长乳腺癌、甲状腺癌的规范化诊治，尤其是早期乳腺癌的诊断和治疗以及乳腺癌术前新辅助化疗。除常规乳腺癌根治手术外，擅长乳房肿瘤整形和微创、美容手术，以及乳房再造手术。', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '36', '0');
INSERT INTO `doctor` VALUES ('80', '125', '李卫', '王跃欣，男，副主任医师，副教授，医学硕士，擅长各种乳房疾病，乳房疼痛，乳房肿块，乳头溢液，甲状腺的良恶性肿瘤，甲亢，甲状腺肿瘤，开展了乳癌改良根治术与乳癌保乳手术和甲状腺癌保留功能的根治手术。', '	各种乳房疾病，乳房疼痛，乳房肿块，乳头溢液，甲状腺的良恶性肿瘤，甲亢，甲状腺肿瘤，开展了乳癌改良根治术与乳癌保乳手术和甲状腺癌保留功能的根治手术', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/KZyaXMWl8rPkFFBM9uNkZkbyx0gleqWoxRfhMTIxIcU!/r/dGcBAAAAAAAA', '65', '0');
INSERT INTO `doctor` VALUES ('81', '135', '赵增仁', '男，主任医师，教授，博士生导师。河北医科大学第一医院副院长兼任普通外科主任。中国医师协会外科医师分会委员；河北省医师协会血管外科医师分会主任委员；河北省医学会外科分会副主任委员；河北省医学会血管外科分会副主任委员；河北省抗癌协会胃癌、大肠癌专业委员会常委、乳腺癌专业委员会常委、河北省中西医结合学会大肠肛门病学会副主任委员；国家自然基金委评委；科技部国际合作项目技术评审专家；科技部科技进步奖评审专家。', '普外系统常见疾病的诊断，胃肠肿瘤及乳腺肿瘤的手术治疗', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '172', '0');
INSERT INTO `doctor` VALUES ('82', '145', '张峰', '男，主任医师，教授，副院长，普通外科学科主任，医学博士,硕士研究生导师，享受国务院特殊津贴，河北省新世纪“三三三人才工程”第二次人选。担任河北省医学会、医师协会外科学分会副主任委员,河北省医学会理事会理事，河北省中西医结合外科专业委员会副主任委员。《中国烧伤创疡》杂志编委，《医学与哲学杂志临床决策》编委，《中国新药与临床》杂志编委，《河北医科大学学报》编委，《中国微创外科》杂志编委。', '肝胆、胰脾外科产疾病的诊治及手术、能完成电视腹腔镜胆囊切除术、充填式无张力疝修补术等高新技术', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '89', '0');
INSERT INTO `doctor` VALUES ('83', '26', '何荣海', '何荣海，男，副主任医师，副教授，心脏外科主任，从事心脏外科工作20多年，曾在北京阜外医院及及欧洲心脏外科中心进修学习，熟练掌握先天性心脏病、瓣膜性心脏病、冠脉搭桥、主动脉夹层、心脏肿瘤等的外科诊治及手术，并且能熟练掌握先心病缺损封堵术、主动脉夹层支架的微创介入治疗，擅长心脏疾病的微创、介入、复合治疗。', '各种先天性心脏病，心脏瓣膜疾病，冠心病，心脏肿瘤，心包疾病，胸主动脉瘤等诊治及手术治疗，并开展了微创小切口心脏手术，冠脉搭桥手术等', '100', '35', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/CHPr7N1NUExRQ9lPeLlkio*ETkS72uanGGEpVTRLJPw!/r/dFsBAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('84', '46', '刘彬', '毕业于中国医学科学院阜外心血管病医院心外科，师从孙立忠教授获医学博士学位；首都医科大学附属北京安贞医院师从刘迎龙主任完成博士后研究。擅长成人、小儿相关的各种心脏手术，自工作至今完成心脏手术2000余台。擅长冠状动脉搭桥、瓣膜置换术，Bentall（主动脉根部置换）术、主动脉夹层手术、先天性房室间隔缺损、动脉导管未闭、二尖瓣置换等。', '先天性心脏病、冠心病、瓣膜性心脏病、主动脉夹层、胸部主动脉瘤、腹主动脉瘤', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/VYlTrNIXfwIdU6tsOfzonqdzPnB0XFbPl1htKHSzIIU!/r/dPMAAAAAAAAA', '115', '0');
INSERT INTO `doctor` VALUES ('85', '76', '张池林', '医学博士，科主任，毕业于北京协和医学院，在国家心血管病中心、阜外心血管病医院学习工作5年，先后在王欣、杨克明教授指导下进行心血管外科临床培训，共参加心脏手术2000余例，独立完成手术700余例，病种包括各种复杂型先天性心脏病、冠心病搭桥手术、瓣膜病及大血管疾病。共发表论文10余篇，其中3篇被SCI收录。', '心脏外科及介入心脏病学专家，冠脉搭桥、瓣膜置换或修复手术、房、室间隔缺损介入封堵或腋下切口及小切口手术，各种先心病根治或姑息手术；冠心病心梗，心绞痛介入手术', '100', '58', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/Q9Kej*KqKXNZyB1UaXNb7mbnljhuiJq50oHhaFCcqsc!/r/dMgAAAAAAAAA', '256', '0');
INSERT INTO `doctor` VALUES ('86', '91', '何荣海', '何荣海，副主任医师，副教授，心脏外科主任，从事心脏外科工作20多年，曾在北京阜外医院及及欧洲心脏外科中心进修学习，熟练掌握先天性心脏病、瓣膜性心脏病、冠脉搭桥、主动脉夹层、心脏肿瘤等的外科诊治及手术，并且能熟练掌握先心病缺损封堵术、主动脉夹层支架的微创介入治疗，擅长心脏疾病的微创、介入、复合治疗。', '各种先天性心脏病，心脏瓣膜疾病，冠心病，心脏肿瘤，心包疾病，胸主动脉瘤等诊治及手术治疗，并开展了微创小切口心脏手术，冠脉搭桥手术等', '100', '35', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/CHPr7N1NUExRQ9lPeLlkio*ETkS72uanGGEpVTRLJPw!/r/dFsBAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('87', '106', '刘彬', '毕业于中国医学科学院阜外心血管病医院心外科，师从孙立忠教授获医学博士学位；首都医科大学附属北京安贞医院师从刘迎龙主任完成博士后研究。擅长成人、小儿相关的各种心脏手术，自工作至今完成心脏手术2000余台。擅长冠状动脉搭桥、瓣膜置换术，Bentall（主动脉根部置换）术、主动脉夹层手术、先天性房室间隔缺损、动脉导管未闭、二尖瓣置换等。', '先天性心脏病、冠心病、瓣膜性心脏病、主动脉夹层、胸部主动脉瘤、腹主动脉瘤', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/VYlTrNIXfwIdU6tsOfzonqdzPnB0XFbPl1htKHSzIIU!/r/dPMAAAAAAAAA', '115', '0');
INSERT INTO `doctor` VALUES ('88', '116', '张池林', '医学博士，科主任，毕业于北京协和医学院，在国家心血管病中心、阜外心血管病医院学习工作5年，先后在王欣、杨克明教授指导下进行心血管外科临床培训，共参加心脏手术2000余例，独立完成手术700余例，病种包括各种复杂型先天性心脏病、冠心病搭桥手术、瓣膜病及大血管疾病。共发表论文10余篇，其中3篇被SCI收录。', '心脏外科及介入心脏病学专家，冠脉搭桥、瓣膜置换或修复手术、房、室间隔缺损介入封堵或腋下切口及小切口手术，各种先心病根治或姑息手术；冠心病心梗，心绞痛介入手术', '100', '58', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/Q9Kej*KqKXNZyB1UaXNb7mbnljhuiJq50oHhaFCcqsc!/r/dMgAAAAAAAAA', '256', '0');
INSERT INTO `doctor` VALUES ('89', '126', '何荣海', '何荣海，副主任医师，副教授，心脏外科主任，从事心脏外科工作20多年，曾在北京阜外医院及及欧洲心脏外科中心进修学习，熟练掌握先天性心脏病、瓣膜性心脏病、冠脉搭桥、主动脉夹层、心脏肿瘤等的外科诊治及手术，并且能熟练掌握先心病缺损封堵术、主动脉夹层支架的微创介入治疗，擅长心脏疾病的微创、介入、复合治疗。', '各种先天性心脏病，心脏瓣膜疾病，冠心病，心脏肿瘤，心包疾病，胸主动脉瘤等诊治及手术治疗，并开展了微创小切口心脏手术，冠脉搭桥手术等', '100', '35', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/CHPr7N1NUExRQ9lPeLlkio*ETkS72uanGGEpVTRLJPw!/r/dFsBAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('90', '136', '刘彬', '毕业于中国医学科学院阜外心血管病医院心外科，师从孙立忠教授获医学博士学位；首都医科大学附属北京安贞医院师从刘迎龙主任完成博士后研究。擅长成人、小儿相关的各种心脏手术，自工作至今完成心脏手术2000余台。擅长冠状动脉搭桥、瓣膜置换术，Bentall（主动脉根部置换）术、主动脉夹层手术、先天性房室间隔缺损、动脉导管未闭、二尖瓣置换等。', '先天性心脏病、冠心病、瓣膜性心脏病、主动脉夹层、胸部主动脉瘤、腹主动脉瘤', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/VYlTrNIXfwIdU6tsOfzonqdzPnB0XFbPl1htKHSzIIU!/r/dPMAAAAAAAAA', '115', '0');
INSERT INTO `doctor` VALUES ('91', '146', '张池林', '医学博士，科主任，毕业于北京协和医学院，在国家心血管病中心、阜外心血管病医院学习工作5年，先后在王欣、杨克明教授指导下进行心血管外科临床培训，共参加心脏手术2000余例，独立完成手术700余例，病种包括各种复杂型先天性心脏病、冠心病搭桥手术、瓣膜病及大血管疾病。共发表论文10余篇，其中3篇被SCI收录。', '心脏外科及介入心脏病学专家，冠脉搭桥、瓣膜置换或修复手术、房、室间隔缺损介入封堵或腋下切口及小切口手术，各种先心病根治或姑息手术；冠心病心梗，心绞痛介入手术', '100', '58', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/Q9Kej*KqKXNZyB1UaXNb7mbnljhuiJq50oHhaFCcqsc!/r/dMgAAAAAAAAA', '256', '0');
INSERT INTO `doctor` VALUES ('92', '156', '何荣海', '何荣海，副主任医师，副教授，心脏外科主任，从事心脏外科工作20多年，曾在北京阜外医院及及欧洲心脏外科中心进修学习，熟练掌握先天性心脏病、瓣膜性心脏病、冠脉搭桥、主动脉夹层、心脏肿瘤等的外科诊治及手术，并且能熟练掌握先心病缺损封堵术、主动脉夹层支架的微创介入治疗，擅长心脏疾病的微创、介入、复合治疗。', '各种先天性心脏病，心脏瓣膜疾病，冠心病，心脏肿瘤，心包疾病，胸主动脉瘤等诊治及手术治疗，并开展了微创小切口心脏手术，冠脉搭桥手术等', '100', '35', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/CHPr7N1NUExRQ9lPeLlkio*ETkS72uanGGEpVTRLJPw!/r/dFsBAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('93', '166', '刘彬', '毕业于中国医学科学院阜外心血管病医院心外科，师从孙立忠教授获医学博士学位；首都医科大学附属北京安贞医院师从刘迎龙主任完成博士后研究。擅长成人、小儿相关的各种心脏手术，自工作至今完成心脏手术2000余台。擅长冠状动脉搭桥、瓣膜置换术，Bentall（主动脉根部置换）术、主动脉夹层手术、先天性房室间隔缺损、动脉导管未闭、二尖瓣置换等。', '先天性心脏病、冠心病、瓣膜性心脏病、主动脉夹层、胸部主动脉瘤、腹主动脉瘤', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/VYlTrNIXfwIdU6tsOfzonqdzPnB0XFbPl1htKHSzIIU!/r/dPMAAAAAAAAA', '115', '0');
INSERT INTO `doctor` VALUES ('94', '27', '孔志刚', '大学毕业后一直在省三院骨科工作，在近二十年的临床工作中成绩显著，1996年4月入选香港新闻出版社出版的《世界名医大全》（中国卷），1996年8月编入《当代中国科学家与发明家大词典》第三卷。', '脊柱，四肢及骨盆骨折的诊断与治疗，陈旧性骨折，骨不连，骨髓炎的诊断与治疗。', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/nediXmQTcpBX9.JPNBQO0aDVJlKG.KJO2Vh8zYJiacw!/r/dAQBAAAAAAAA', '37', '0');
INSERT INTO `doctor` VALUES ('95', '47', '张志国', '工作中、努力钻研业务，有丰富的骨伤科临床经验，能独立解决本专业复杂、疑难问题及高难度手术，对脂肪栓塞综合征这一死亡率很高的严重骨科并发症积累了丰富的临床经验，取得了良好疗效。', '四肢、脊柱骨折脱位、脊柱损伤、陈旧性跟骨骨折、严重踝关节损伤、骨折不连接等。', '100', '66', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/nediXmQTcpBX9.JPNBQO0aDVJlKG.KJO2Vh8zYJiacw!/r/dAQBAAAAAAAA', '38', '0');
INSERT INTO `doctor` VALUES ('96', '77', '张治国', '工作中、努力钻研业务，有丰富的骨伤科临床经验，能独立解决本专业复杂、疑难问题及高难度手术，对脂肪栓塞综合征这一死亡率很高的严重骨科并发症积累了丰富的临床经验，取得了良好疗效。', '四肢疑难复杂骨折及骨折不愈合的冶疗，老年骨质疏松骨折的冶疗', '100', '25', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/Q9Kej*KqKXNZyB1UaXNb7mbnljhuiJq50oHhaFCcqsc!/r/dMgAAAAAAAAA', '146', '0');
INSERT INTO `doctor` VALUES ('97', '92', '孙梁', '大学毕业后一直在省三院骨科工作，在近二十年的临床工作中成绩显著，1996年4月入选香港新闻出版社出版的《世界名医大全》（中国卷），1996年8月编入《当代中国科学家与发明家大词典》第三卷。', '	脊柱及四肢创伤、骨与软组织肿瘤、脊柱与关节疾病的诊断与治疗', '100', '84', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/TkdeGrL4A6S*m3EMBQGBZ.KTEkxH91XSIncS2gmRHDs!/r/dFYBAAAAAAAA', '55', '0');
INSERT INTO `doctor` VALUES ('98', '28', '冯志强', '男，主治医师，擅长: 牙齿及牙列缺损的各种修复。', '口腔颌面部创伤、牙及牙槽外科、口腔颌面部肿瘤', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/TkdeGrL4A6S*m3EMBQGBZ.KTEkxH91XSIncS2gmRHDs!/r/dFYBAAAAAAAA', '144', '0');
INSERT INTO `doctor` VALUES ('99', '48', '潘祥峰', '在口腔粘膜病方面为临床开发了环磷酰胺冲击治疗口腔粘膜性疾病，填补了国家空白，获河北省卫生厅二等奖。对口腔内科根尖硬组织疾病有较深研究，曾发表《牙科用三维小视野照射CT（3DX）在口腔内科中的应用研究》的论文，对采用口内法X线牙片不明确诊断的口腔硬组织病变进行三维立体观察，为确定病变组织摸索了诊断手段。曾根据老年牙病现状，撰写了《老人齿科特点与治疗设计》教学讲座。', '牙髓--牙周联合病变患牙的保存，修复 牙髓病，尖周病的诊断和治疗，复杂根管治疗术，老年牙病，口腔粘膜病的诊断和综合治疗', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/nediXmQTcpBX9.JPNBQO0aDVJlKG.KJO2Vh8zYJiacw!/r/dAQBAAAAAAAA', '98', '0');
INSERT INTO `doctor` VALUES ('100', '78', '候小微', '1991年毕业于河北医科大学口腔系，1997年取得硕士学位，2001-2006年在日本松本齿科大学研修和在日本信州大学学习并获得博士学位。2009年在北京大学口腔医院特诊科进修。多次被评为“院级优秀医生”，在国内外杂志发表专业论文20余篇，获省级科技进步奖2项。', '各类牙体病保存活髓治疗，髓底穿通保留患牙，牙体牙髓疾病，以及大面积缺损牙残根残冠的保存感染根管的治疗，现代根管治疗术', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '89', '0');
INSERT INTO `doctor` VALUES ('101', '93', '冯志强', '男，主治医师，擅长: 牙齿及牙列缺损的各种修复。', '口腔颌面部创伤、牙及牙槽外科、口腔颌面部肿瘤', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/TkdeGrL4A6S*m3EMBQGBZ.KTEkxH91XSIncS2gmRHDs!/r/dFYBAAAAAAAA', '144', '0');
INSERT INTO `doctor` VALUES ('102', '108', '潘祥峰', '在口腔粘膜病方面为临床开发了环磷酰胺冲击治疗口腔粘膜性疾病，填补了国家空白，获河北省卫生厅二等奖。对口腔内科根尖硬组织疾病有较深研究，曾发表《牙科用三维小视野照射CT（3DX）在口腔内科中的应用研究》的论文，对采用口内法X线牙片不明确诊断的口腔硬组织病变进行三维立体观察，为确定病变组织摸索了诊断手段。曾根据老年牙病现状，撰写了《老人齿科特点与治疗设计》教学讲座。', '牙髓--牙周联合病变患牙的保存，修复 牙髓病，尖周病的诊断和治疗，复杂根管治疗术，老年牙病，口腔粘膜病的诊断和综合治疗', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/Q9Kej*KqKXNZyB1UaXNb7mbnljhuiJq50oHhaFCcqsc!/r/dMgAAAAAAAAA', '98', '0');
INSERT INTO `doctor` VALUES ('103', '118', '候小微', '1991年毕业于河北医科大学口腔系，1997年取得硕士学位，2001-2006年在日本松本齿科大学研修和在日本信州大学学习并获得博士学位。2009年在北京大学口腔医院特诊科进修。多次被评为“院级优秀医生”，在国内外杂志发表专业论文20余篇，获省级科技进步奖2项。', '各类牙体病保存活髓治疗，髓底穿通保留患牙，牙体牙髓疾病，以及大面积缺损牙残根残冠的保存感染根管的治疗，现代根管治疗术', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '89', '0');
INSERT INTO `doctor` VALUES ('104', '128', '冯志强', '男，主治医师，擅长: 牙齿及牙列缺损的各种修复。', '口腔颌面部创伤、牙及牙槽外科、口腔颌面部肿瘤', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/TkdeGrL4A6S*m3EMBQGBZ.KTEkxH91XSIncS2gmRHDs!/r/dFYBAAAAAAAA', '144', '0');
INSERT INTO `doctor` VALUES ('105', '138', '潘祥峰', '在口腔粘膜病方面为临床开发了环磷酰胺冲击治疗口腔粘膜性疾病，填补了国家空白，获河北省卫生厅二等奖。对口腔内科根尖硬组织疾病有较深研究，曾发表《牙科用三维小视野照射CT（3DX）在口腔内科中的应用研究》的论文，对采用口内法X线牙片不明确诊断的口腔硬组织病变进行三维立体观察，为确定病变组织摸索了诊断手段。曾根据老年牙病现状，撰写了《老人齿科特点与治疗设计》教学讲座。', '牙髓--牙周联合病变患牙的保存，修复 牙髓病，尖周病的诊断和治疗，复杂根管治疗术，老年牙病，口腔粘膜病的诊断和综合治疗', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/nediXmQTcpBX9.JPNBQO0aDVJlKG.KJO2Vh8zYJiacw!/r/dAQBAAAAAAAA', '98', '0');
INSERT INTO `doctor` VALUES ('106', '148', '候小微', '1991年毕业于河北医科大学口腔系，1997年取得硕士学位，2001-2006年在日本松本齿科大学研修和在日本信州大学学习并获得博士学位。2009年在北京大学口腔医院特诊科进修。多次被评为“院级优秀医生”，在国内外杂志发表专业论文20余篇，获省级科技进步奖2项。', '各类牙体病保存活髓治疗，髓底穿通保留患牙，牙体牙髓疾病，以及大面积缺损牙残根残冠的保存感染根管的治疗，现代根管治疗术', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '89', '0');
INSERT INTO `doctor` VALUES ('107', '158', '冯志强', '男，主治医师，擅长: 牙齿及牙列缺损的各种修复。', '口腔颌面部创伤、牙及牙槽外科、口腔颌面部肿瘤', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/TkdeGrL4A6S*m3EMBQGBZ.KTEkxH91XSIncS2gmRHDs!/r/dFYBAAAAAAAA', '144', '0');
INSERT INTO `doctor` VALUES ('108', '168', '潘祥峰', '在口腔粘膜病方面为临床开发了环磷酰胺冲击治疗口腔粘膜性疾病，填补了国家空白，获河北省卫生厅二等奖。对口腔内科根尖硬组织疾病有较深研究，曾发表《牙科用三维小视野照射CT（3DX）在口腔内科中的应用研究》的论文，对采用口内法X线牙片不明确诊断的口腔硬组织病变进行三维立体观察，为确定病变组织摸索了诊断手段。曾根据老年牙病现状，撰写了《老人齿科特点与治疗设计》教学讲座。', '牙髓--牙周联合病变患牙的保存，修复 牙髓病，尖周病的诊断和治疗，复杂根管治疗术，老年牙病，口腔粘膜病的诊断和综合治疗', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/Q9Kej*KqKXNZyB1UaXNb7mbnljhuiJq50oHhaFCcqsc!/r/dMgAAAAAAAAA', '98', '0');
INSERT INTO `doctor` VALUES ('109', '49', '陈强', '陈强，男，主任医师，教授，皮肤整形中心副主任，硕士生导师，擅长诊治梅毒，淋病，尖锐湿疣，生殖器疱疹，银屑病，白癜风，带状疱疹等病毒性疾病。', '梅毒，淋病，尖锐湿疣，生殖器疱疹，银屑病，白癜风，带状疱疹等病毒性疾病', '100', '63', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/TkdeGrL4A6S*m3EMBQGBZ.KTEkxH91XSIncS2gmRHDs!/r/dFYBAAAAAAAA', '36', '0');
INSERT INTO `doctor` VALUES ('110', '79', '刘春平', '	刘春平，皮肤性病科医师，副主任医师，副教授，博士。毕业于河北医科大学，曾在北京大学第一医院皮肤科进修学习，从事皮肤性病临床、教学、科研工作10余年，对皮肤病、性病诊疗有丰富临床经验。', '对皮肤病、性病诊疗有丰富临床经验。', '100', '63', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/rOzls8tBS7HT57Ae78NF3hLG7xf.vKK5wYon8ZG5Tys!/r/dMgAAAAAAAAA', '225', '0');
INSERT INTO `doctor` VALUES ('111', '94', '赵淑晓', '副主任医师，副教授，从事皮肤性病临床、教学、科研工作二十余年，对皮肤性病常见病、疑难病的诊治具有丰富临床经验。发表论文二十余篇。', '	1.过敏性皮肤病、银屑病、白癜风（包括光疗、表皮移植）。2.痤疮的药物治疗、光子治疗、红蓝光、光动力治疗。3.各种疣（尖锐湿疣光动力治疗）的治疗。4.激光美容、脱毛、祛红、祛黑（太田痣、纹身、雀斑等）。', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/chki.K7APrx5eWB0mrIEjvPK0b2UikH9xTI9SrnR65Q!/r/dGYBAAAAAAAA', '112', '0');
INSERT INTO `doctor` VALUES ('112', '109', '陈强', '陈强，男，主任医师，教授，皮肤整形中心副主任，硕士生导师，擅长诊治梅毒，淋病，尖锐湿疣，生殖器疱疹，银屑病，白癜风，带状疱疹等病毒性疾病。', '梅毒，淋病，尖锐湿疣，生殖器疱疹，银屑病，白癜风，带状疱疹等病毒性疾病', '100', '63', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/O94sURZHt2wiIRZOvIJ8CoexlucUSsNJtolI3dAjYE8!/r/dF4BAAAAAAAA', '36', '0');
INSERT INTO `doctor` VALUES ('113', '119', '刘春平', '	刘春平，皮肤性病科医师，副主任医师，副教授，博士。毕业于河北医科大学，曾在北京大学第一医院皮肤科进修学习，从事皮肤性病临床、教学、科研工作10余年，对皮肤病、性病诊疗有丰富临床经验。', '对皮肤病、性病诊疗有丰富临床经验。', '100', '63', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '225', '0');
INSERT INTO `doctor` VALUES ('114', '129', '赵淑晓', '副主任医师，副教授，从事皮肤性病临床、教学、科研工作二十余年，对皮肤性病常见病、疑难病的诊治具有丰富临床经验。发表论文二十余篇。', '	1.过敏性皮肤病、银屑病、白癜风（包括光疗、表皮移植）。2.痤疮的药物治疗、光子治疗、红蓝光、光动力治疗。3.各种疣（尖锐湿疣光动力治疗）的治疗。4.激光美容、脱毛、祛红、祛黑（太田痣、纹身、雀斑等）。', '100', '23', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/chki.K7APrx5eWB0mrIEjvPK0b2UikH9xTI9SrnR65Q!/r/dGYBAAAAAAAA', '112', '0');
INSERT INTO `doctor` VALUES ('115', '139', '陈强', '陈强，男，主任医师，教授，皮肤整形中心副主任，硕士生导师，擅长诊治梅毒，淋病，尖锐湿疣，生殖器疱疹，银屑病，白癜风，带状疱疹等病毒性疾病。', '梅毒，淋病，尖锐湿疣，生殖器疱疹，银屑病，白癜风，带状疱疹等病毒性疾病', '100', '63', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/ze6k62WL946XUhAtnzqeLfSJSmP*iwPgF1aFBKpwqp0!/r/dAQBAAAAAAAA', '36', '0');
INSERT INTO `doctor` VALUES ('116', '149', '刘春平', '	刘春平，皮肤性病科医师，副主任医师，副教授，博士。毕业于河北医科大学，曾在北京大学第一医院皮肤科进修学习，从事皮肤性病临床、教学、科研工作10余年，对皮肤病、性病诊疗有丰富临床经验。', '对皮肤病、性病诊疗有丰富临床经验。', '100', '63', 'http://r.photo.store.qq.com/psb?/V12SqnDn1gulRr/OzlOisV70Dqo3OjbMf0vRVIV5YnCwI4CK.YZdC54DOI!/r/dPMAAAAAAAAA', '225', '0');
INSERT INTO `doctor` VALUES ('117', '20', '卞晓芸', '卞小芸，女，主任医师，教授，眼科主任，硕士研究生导师。曾赴以色列Walfson医院眼科留学深造，并在北京同仁医院、北京大学眼科中心研修。对白内障、青光眼、眼部整形等眼科疾病的诊治具有丰富的经验。', '白内障、青光眼、眼部整形等眼科疾病的诊治', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '213', '0');
INSERT INTO `doctor` VALUES ('118', '30', '张钧', '医学博士、副主任医师、副教授，眼科副主任，研究生毕业于北京同仁医院，先后师从全国著名白内障专家施玉英教授、眼底病专家马景学教授，理论基础扎实，擅长角膜塑形镜青少年近视防控，角膜病、白内障、青光眼、眼底病的诊治，尤其擅长白内障超声乳化手术，已完成各种白内障手术5000余例，现每年完成各种白内障手术近2000例。', '各种白内障的诊断与手术治疗，青少年近视矫正及防控，角膜病，青光眼及眼底病的诊治', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '211', '0');
INSERT INTO `doctor` VALUES ('119', '50', '卞晓芸', '卞小芸，女，主任医师，教授，眼科主任，硕士研究生导师。曾赴以色列Walfson医院眼科留学深造，并在北京同仁医院、北京大学眼科中心研修。对白内障、青光眼、眼部整形等眼科疾病的诊治具有丰富的经验。', '白内障、青光眼、眼部整形等眼科疾病的诊治', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '213', '0');
INSERT INTO `doctor` VALUES ('120', '80', '张钧', '医学博士、副主任医师、副教授，眼科副主任，研究生毕业于北京同仁医院，先后师从全国著名白内障专家施玉英教授、眼底病专家马景学教授，理论基础扎实，擅长角膜塑形镜青少年近视防控，角膜病、白内障、青光眼、眼底病的诊治，尤其擅长白内障超声乳化手术，已完成各种白内障手术5000余例，现每年完成各种白内障手术近2000例。', '各种白内障的诊断与手术治疗，青少年近视矫正及防控，角膜病，青光眼及眼底病的诊治', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '211', '0');
INSERT INTO `doctor` VALUES ('121', '95', '卞晓芸', '卞小芸，女，主任医师，教授，眼科主任，硕士研究生导师。曾赴以色列Walfson医院眼科留学深造，并在北京同仁医院、北京大学眼科中心研修。对白内障、青光眼、眼部整形等眼科疾病的诊治具有丰富的经验。', '白内障、青光眼、眼部整形等眼科疾病的诊治', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '213', '0');
INSERT INTO `doctor` VALUES ('122', '110', '张钧', '医学博士、副主任医师、副教授，眼科副主任，研究生毕业于北京同仁医院，先后师从全国著名白内障专家施玉英教授、眼底病专家马景学教授，理论基础扎实，擅长角膜塑形镜青少年近视防控，角膜病、白内障、青光眼、眼底病的诊治，尤其擅长白内障超声乳化手术，已完成各种白内障手术5000余例，现每年完成各种白内障手术近2000例。', '各种白内障的诊断与手术治疗，青少年近视矫正及防控，角膜病，青光眼及眼底病的诊治', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '211', '0');
INSERT INTO `doctor` VALUES ('123', '120', '卞晓芸', '卞小芸，女，主任医师，教授，眼科主任，硕士研究生导师。曾赴以色列Walfson医院眼科留学深造，并在北京同仁医院、北京大学眼科中心研修。对白内障、青光眼、眼部整形等眼科疾病的诊治具有丰富的经验。', '白内障、青光眼、眼部整形等眼科疾病的诊治', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '213', '0');
INSERT INTO `doctor` VALUES ('124', '130', '张钧', '医学博士、副主任医师、副教授，眼科副主任，研究生毕业于北京同仁医院，先后师从全国著名白内障专家施玉英教授、眼底病专家马景学教授，理论基础扎实，擅长角膜塑形镜青少年近视防控，角膜病、白内障、青光眼、眼底病的诊治，尤其擅长白内障超声乳化手术，已完成各种白内障手术5000余例，现每年完成各种白内障手术近2000例。', '各种白内障的诊断与手术治疗，青少年近视矫正及防控，角膜病，青光眼及眼底病的诊治', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '211', '0');
INSERT INTO `doctor` VALUES ('125', '140', '卞晓芸', '卞小芸，女，主任医师，教授，眼科主任，硕士研究生导师。曾赴以色列Walfson医院眼科留学深造，并在北京同仁医院、北京大学眼科中心研修。对白内障、青光眼、眼部整形等眼科疾病的诊治具有丰富的经验。', '白内障、青光眼、眼部整形等眼科疾病的诊治', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '213', '0');
INSERT INTO `doctor` VALUES ('126', '150', '张钧', '医学博士、副主任医师、副教授，眼科副主任，研究生毕业于北京同仁医院，先后师从全国著名白内障专家施玉英教授、眼底病专家马景学教授，理论基础扎实，擅长角膜塑形镜青少年近视防控，角膜病、白内障、青光眼、眼底病的诊治，尤其擅长白内障超声乳化手术，已完成各种白内障手术5000余例，现每年完成各种白内障手术近2000例。', '各种白内障的诊断与手术治疗，青少年近视矫正及防控，角膜病，青光眼及眼底病的诊治', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '211', '0');
INSERT INTO `doctor` VALUES ('127', '160', '卞晓芸', '卞小芸，女，主任医师，教授，眼科主任，硕士研究生导师。曾赴以色列Walfson医院眼科留学深造，并在北京同仁医院、北京大学眼科中心研修。对白内障、青光眼、眼部整形等眼科疾病的诊治具有丰富的经验。', '白内障、青光眼、眼部整形等眼科疾病的诊治', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/t7pE*UyfMxyYES1yIaXuNt*KcYsulMQlHMY0EavoCFE!/r/dFYBAAAAAAAA', '213', '0');
INSERT INTO `doctor` VALUES ('128', '170', '张钧', '医学博士、副主任医师、副教授，眼科副主任，研究生毕业于北京同仁医院，先后师从全国著名白内障专家施玉英教授、眼底病专家马景学教授，理论基础扎实，擅长角膜塑形镜青少年近视防控，角膜病、白内障、青光眼、眼底病的诊治，尤其擅长白内障超声乳化手术，已完成各种白内障手术5000余例，现每年完成各种白内障手术近2000例。', '各种白内障的诊断与手术治疗，青少年近视矫正及防控，角膜病，青光眼及眼底病的诊治', '100', '36', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '211', '0');
INSERT INTO `doctor` VALUES ('129', '31', '齐金晨', '主任医师，教授，内分泌血液科主任，博士，硕士研究生导师。从事内分泌血液专业近20年，擅长对糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分泌系统疾病治疗效果显著。获河北省科技进步二等奖1项、三等奖1项，河北省卫生厅科技进步一等奖1项、三等奖1项。发表论文10余篇，撰写专著2部。', '糖尿病及并发症干细胞移植治疗、糖尿病、糖尿病足、糖尿病肾病、糖尿病周围神经、血管病变、糖尿病视网膜病变、甲亢、肥胖、醛固酮多症、垂体瘤等内分', '100', '25', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/chki.K7APrx5eWB0mrIEjvPK0b2UikH9xTI9SrnR65Q!/r/dGYBAAAAAAAA', '88', '0');
INSERT INTO `doctor` VALUES ('130', '51', '李立鹏', '承担河北省卫生厅重大项目“2型糖尿病大鼠心肌间质重构的分子机制和法舒地尔干预”第一主研人工作，在专业刊物发表论文30余篇，其中SCI论文5篇，多次获得院级重大科研课题资助；完成国际多中心临床研究1项；参与两项科技厅课题的完成，并获得卫生厅二等奖，参加国内学术会议多次；已培养硕士研究生10余人。', '	各种内分泌疾病，尤其是糖尿病并发症、甲状腺和垂体疾病等', '100', '88', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/rtrQhonL5aiHfPJEnuNVEqDyCKbXVnN7UmdIZYpwALk!/r/dPMAAAAAAAAA', '144', '0');
INSERT INTO `doctor` VALUES ('131', '81', '杨洋', '主任医师，教授，内分泌科副主任，医学博士，硕士研究生导师，中共党员。河北省医学会内分泌学会委员。1992年毕业于河北医科大学临床医学系，2006年曾赴日本金泽医科大学担任特别研究员。现任中国医疗保健国际交流促进会甲状腺疾病分会委员，河北省药学会内分泌代谢药学专业委员会常务委员，河北省医学会糖尿病学分会委员，河北省糖尿病防治协会常务理事', '糖尿病、甲状腺疾病、肾上腺疾病、垂体疾病等诊断与治疗', '100', '77', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '39', '0');
INSERT INTO `doctor` VALUES ('132', '96', '廖海洋', '大学毕业后分配到河北医学院第二医院内科从事临床、教学和科研工作。擅长对垂体病、甲状腺疾病、肾上腺疾病及糖尿病、肥胖症等内分泌疾病的诊治。在《醋氨酚试验对糖尿病患者胃排空的测定》、《早期糖尿病患者的胃固体食物排空测定》、《糖尿病胃轻瘫》等方面有较深的研究。培养硕士研究生20余名。', '垂体病、甲状腺疾病、肾上腺疾病及糖尿病、肥胖症等内分泌疾病的诊治', '100', '53', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/tVtif3G0IU93WSie0xfF.jWORo7X5iSA*1X5KCD*yE4!/r/dPMAAAAAAAAA', '45', '0');
INSERT INTO `doctor` VALUES ('133', '5', '陈晓青', '	陈晓青，女，主任医师，教授，硕士研究生导师，1984年7月毕业于河北医科大学医学系，1994年7月毕业于天津医科大学，获硕士学位。从事儿科临床、教学、科研工作近30年，对儿科常见病、多发病、疑难病、危重病的诊治及抢救有一定临床经验，尤其对儿童矮小症、性早熟等生长发育障碍性疾病的诊治有丰富的临床经验。兼任石家庄市医学会儿科专业委员会委员，河北省手足口病专家组成员。', '	儿童矮小病、性早熟、青春期延迟及咳嗽变异性哮喘、支气管哮喘的诊断和治疗', '100', '78', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '145', '0');
INSERT INTO `doctor` VALUES ('134', '35', '骆金芝', '骆金芝，女，主任医师，教授，硕士生导师。1969年毕业于河北医学院医疗系，本科学历。一直在河北医学院附属第三医院（现为河北医科大学第三医院）从事儿科临床工作，1987年3月加入中国共产党。1996年曾赴扎伊尔医疗队援外医疗1年。历任儿科副主任、主任、儿科教研室主任。教授、主任医师职称，硕士研究生导师。是河北省有突出贡献的中青年专家。2000年获河北省妇幼卫生先进工作者。兼任河北省优生优育协会副会长、《河北医药》编委。', '儿童哮喘、小儿腹泻、小儿各种感染性疾病及儿科疑难杂症', '100', '10', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/chki.K7APrx5eWB0mrIEjvPK0b2UikH9xTI9SrnR65Q!/r/dGYBAAAAAAAA', '320', '0');
INSERT INTO `doctor` VALUES ('135', '55', '张国平', '张国平，副主任医师，讲师。对儿科常见病、多发病的诊治有着丰富的临床经验。重点研究小儿哮喘和小儿急救。', '小儿哮喘和小儿急救，儿科常见病，多发病', '100', '42', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('136', '85', '陈晓青', '	陈晓青，女，主任医师，教授，硕士研究生导师，1984年7月毕业于河北医科大学医学系，1994年7月毕业于天津医科大学，获硕士学位。从事儿科临床、教学、科研工作近30年，对儿科常见病、多发病、疑难病、危重病的诊治及抢救有一定临床经验，尤其对儿童矮小症、性早熟等生长发育障碍性疾病的诊治有丰富的临床经验。兼任石家庄市医学会儿科专业委员会委员，河北省手足口病专家组成员。', '	儿童矮小病、性早熟、青春期延迟及咳嗽变异性哮喘、支气管哮喘的诊断和治疗', '100', '78', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/W5AqGZsGO0YfMIlpmBZyot996Px.I5l4yEB72zVPkUs!/r/dJEAAAAAAAAA', '145', '0');
INSERT INTO `doctor` VALUES ('137', '100', '骆金芝', '骆金芝，女，主任医师，教授，硕士生导师。1969年毕业于河北医学院医疗系，本科学历。一直在河北医学院附属第三医院（现为河北医科大学第三医院）从事儿科临床工作，1987年3月加入中国共产党。1996年曾赴扎伊尔医疗队援外医疗1年。历任儿科副主任、主任、儿科教研室主任。教授、主任医师职称，硕士研究生导师。是河北省有突出贡献的中青年专家。2000年获河北省妇幼卫生先进工作者。兼任河北省优生优育协会副会长、《河北医药》编委。', '儿童哮喘、小儿腹泻、小儿各种感染性疾病及儿科疑难杂症', '100', '10', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '320', '0');
INSERT INTO `doctor` VALUES ('138', '107', '张国平', '张国平，副主任医师，讲师。对儿科常见病、多发病的诊治有着丰富的临床经验。重点研究小儿哮喘和小儿急救。', '小儿哮喘和小儿急救，儿科常见病，多发病', '100', '42', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('139', '117', '陈晓青', '	陈晓青，女，主任医师，教授，硕士研究生导师，1984年7月毕业于河北医科大学医学系，1994年7月毕业于天津医科大学，获硕士学位。从事儿科临床、教学、科研工作近30年，对儿科常见病、多发病、疑难病、危重病的诊治及抢救有一定临床经验，尤其对儿童矮小症、性早熟等生长发育障碍性疾病的诊治有丰富的临床经验。兼任石家庄市医学会儿科专业委员会委员，河北省手足口病专家组成员。', '	儿童矮小病、性早熟、青春期延迟及咳嗽变异性哮喘、支气管哮喘的诊断和治疗', '100', '78', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/W5AqGZsGO0YfMIlpmBZyot996Px.I5l4yEB72zVPkUs!/r/dJEAAAAAAAAA', '145', '0');
INSERT INTO `doctor` VALUES ('140', '127', '骆金芝', '骆金芝，女，主任医师，教授，硕士生导师。1969年毕业于河北医学院医疗系，本科学历。一直在河北医学院附属第三医院（现为河北医科大学第三医院）从事儿科临床工作，1987年3月加入中国共产党。1996年曾赴扎伊尔医疗队援外医疗1年。历任儿科副主任、主任、儿科教研室主任。教授、主任医师职称，硕士研究生导师。是河北省有突出贡献的中青年专家。2000年获河北省妇幼卫生先进工作者。兼任河北省优生优育协会副会长、《河北医药》编委。', '儿童哮喘、小儿腹泻、小儿各种感染性疾病及儿科疑难杂症', '100', '10', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '320', '0');
INSERT INTO `doctor` VALUES ('141', '137', '张国平', '张国平，副主任医师，讲师。对儿科常见病、多发病的诊治有着丰富的临床经验。重点研究小儿哮喘和小儿急救。', '小儿哮喘和小儿急救，儿科常见病，多发病', '100', '42', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('142', '147', '陈晓青', '	陈晓青，女，主任医师，教授，硕士研究生导师，1984年7月毕业于河北医科大学医学系，1994年7月毕业于天津医科大学，获硕士学位。从事儿科临床、教学、科研工作近30年，对儿科常见病、多发病、疑难病、危重病的诊治及抢救有一定临床经验，尤其对儿童矮小症、性早熟等生长发育障碍性疾病的诊治有丰富的临床经验。兼任石家庄市医学会儿科专业委员会委员，河北省手足口病专家组成员。', '	儿童矮小病、性早熟、青春期延迟及咳嗽变异性哮喘、支气管哮喘的诊断和治疗', '100', '78', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/W5AqGZsGO0YfMIlpmBZyot996Px.I5l4yEB72zVPkUs!/r/dJEAAAAAAAAA', '145', '0');
INSERT INTO `doctor` VALUES ('143', '157', '骆金芝', '骆金芝，女，主任医师，教授，硕士生导师。1969年毕业于河北医学院医疗系，本科学历。一直在河北医学院附属第三医院（现为河北医科大学第三医院）从事儿科临床工作，1987年3月加入中国共产党。1996年曾赴扎伊尔医疗队援外医疗1年。历任儿科副主任、主任、儿科教研室主任。教授、主任医师职称，硕士研究生导师。是河北省有突出贡献的中青年专家。2000年获河北省妇幼卫生先进工作者。兼任河北省优生优育协会副会长、《河北医药》编委。', '儿童哮喘、小儿腹泻、小儿各种感染性疾病及儿科疑难杂症', '100', '10', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/pchgsGe5AuT5CKJaFcrcaSLgeFTHh9kkq4P8xSzLvlQ!/r/dGgBAAAAAAAA', '320', '0');
INSERT INTO `doctor` VALUES ('144', '167', '张国平', '张国平，副主任医师，讲师。对儿科常见病、多发病的诊治有着丰富的临床经验。重点研究小儿哮喘和小儿急救。', '小儿哮喘和小儿急救，儿科常见病，多发病', '100', '42', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/mtra3ZqfUmMF9E9xibKtjOk4CNtSxumiOl1VON7OkJ4!/r/dHMAAAAAAAAA', '85', '0');
INSERT INTO `doctor` VALUES ('145', '36', '郭跃先', '郭跃先，男，主任医师，教授，泌尿外科副主任，硕士研究生导师，1988年7月毕业于河北医学院医学系。2000年6月获河北医科大学医学硕士学位。2005年应邀到美国马里兰大学医学中心研修三个月。2010年到美国MD Anderson癌症中心研修一年。现任美国Amerian Physiological Society（APS）会员，中国中西医结合学会泌尿外科专业委员委员，河北省、石家庄市泌尿外科学会委员、石家庄市伤残鉴定委员会委员。担任《中华实验外科杂志》、《现代泌尿外科杂志》编委和审稿人。', '	泌尿系肿瘤、前列腺疾病、肾上腺疾病 、泌尿系创伤、泌尿系结石的诊治及肾移植围手术期的处理、随访；晚期肾癌前列腺癌处理', '100', '89', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '133', '0');
INSERT INTO `doctor` VALUES ('146', '4', '张红真', '	张红真，女，主任医师，教授，妇产科主任，硕士生导师，副院长，现任担任中华医学会河北省妇产科学分会常委；中国医师协会河北省分会副主任委员；河北省临床医学工程学会副主任委员；河北省医学协会理事；河北省妇产科腔镜学组委员；石家庄围产学常委；河北医学会肿瘤学分会常委；河北省优生优育学会副会长；河北省抗癌学会妇产科分会委员；河北省专业技术职务任职资格评审委员会评委。', '宫、腹腔镜治疗妇产科肿瘤，围产保健', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/H*8ro8RdB*mJcNLCkVvVhaVsmlGm2Hvoz*MZ4*z2DpQ!/r/dGoBAAAAAAAA', '235', '0');
INSERT INTO `doctor` VALUES ('147', '34', '张红真', '	张红真，女，主任医师，教授，妇产科主任，硕士生导师，副院长，现任担任中华医学会河北省妇产科学分会常委；中国医师协会河北省分会副主任委员；河北省临床医学工程学会副主任委员；河北省医学协会理事；河北省妇产科腔镜学组委员；石家庄围产学常委；河北医学会肿瘤学分会常委；河北省优生优育学会副会长；河北省抗癌学会妇产科分会委员；河北省专业技术职务任职资格评审委员会评委。', '宫、腹腔镜治疗妇产科肿瘤，围产保健', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/H*8ro8RdB*mJcNLCkVvVhaVsmlGm2Hvoz*MZ4*z2DpQ!/r/dGoBAAAAAAAA', '235', '0');
INSERT INTO `doctor` VALUES ('148', '54', '张红真', '	张红真，女，主任医师，教授，妇产科主任，硕士生导师，副院长，现任担任中华医学会河北省妇产科学分会常委；中国医师协会河北省分会副主任委员；河北省临床医学工程学会副主任委员；河北省医学协会理事；河北省妇产科腔镜学组委员；石家庄围产学常委；河北医学会肿瘤学分会常委；河北省优生优育学会副会长；河北省抗癌学会妇产科分会委员；河北省专业技术职务任职资格评审委员会评委。', '宫、腹腔镜治疗妇产科肿瘤，围产保健', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/H*8ro8RdB*mJcNLCkVvVhaVsmlGm2Hvoz*MZ4*z2DpQ!/r/dGoBAAAAAAAA', '235', '0');
INSERT INTO `doctor` VALUES ('149', '84', '张红真', '	张红真，女，主任医师，教授，妇产科主任，硕士生导师，副院长，现任担任中华医学会河北省妇产科学分会常委；中国医师协会河北省分会副主任委员；河北省临床医学工程学会副主任委员；河北省医学协会理事；河北省妇产科腔镜学组委员；石家庄围产学常委；河北医学会肿瘤学分会常委；河北省优生优育学会副会长；河北省抗癌学会妇产科分会委员；河北省专业技术职务任职资格评审委员会评委。', '宫、腹腔镜治疗妇产科肿瘤，围产保健', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/H*8ro8RdB*mJcNLCkVvVhaVsmlGm2Hvoz*MZ4*z2DpQ!/r/dGoBAAAAAAAA', '235', '0');
INSERT INTO `doctor` VALUES ('150', '99', '张红真', '	张红真，女，主任医师，教授，妇产科主任，硕士生导师，副院长，现任担任中华医学会河北省妇产科学分会常委；中国医师协会河北省分会副主任委员；河北省临床医学工程学会副主任委员；河北省医学协会理事；河北省妇产科腔镜学组委员；石家庄围产学常委；河北医学会肿瘤学分会常委；河北省优生优育学会副会长；河北省抗癌学会妇产科分会委员；河北省专业技术职务任职资格评审委员会评委。', '宫、腹腔镜治疗妇产科肿瘤，围产保健', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/H*8ro8RdB*mJcNLCkVvVhaVsmlGm2Hvoz*MZ4*z2DpQ!/r/dGoBAAAAAAAA', '235', '0');
INSERT INTO `doctor` VALUES ('151', '1', '张红真', '张红真，女，主任医师，教授，妇产科主任，硕士生导师，副院长，现任担任中华医学会河北省妇产科学分会常委；中国医师协会河北省分会副主任委员；河北省临床医学工程学会副主任委员；河北省医学协会理事；河北省妇产科腔镜学组委员；石家庄围产学常委；河北医学会肿瘤学分会常委；河北省优生优育学会副会长；河北省抗癌学会妇产科分会委员；河北省专业技术职务任职资格评审委员会评委。', '宫、腹腔镜治疗妇产科肿瘤，围产保健', '100', '56', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/H*8ro8RdB*mJcNLCkVvVhaVsmlGm2Hvoz*MZ4*z2DpQ!/r/dGoBAAAAAAAA', '234', '0');
INSERT INTO `doctor` VALUES ('152', '1', '李皖芝', '女，主任医师，教授，硕士生导师。1969年毕业于河北医学院医疗系，本科学历。一直在河北医学院附属第三医院（现为河北医科大学第三医院）从事儿科临床工作，1987年3月加入中国共产党。1996年曾赴扎伊尔医疗队援外医疗1年。历任儿科副主任、主任、儿科教研室主任。教授、主任医师职称，硕士研究生导师。是河北省有突出贡献的中青年专家。2000年获河北省妇幼卫生先进工作者。兼任河北省优生优育协会副会长、《河北医药》编委。', '儿童哮喘、小儿腹泻、小儿各种感染性疾病及儿科疑难杂症', '100', '65', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/W5AqGZsGO0YfMIlpmBZyot996Px.I5l4yEB72zVPkUs!/r/dJEAAAAAAAAA', '234', '0');
INSERT INTO `doctor` VALUES ('153', '1', '钱宋岩', '长期从事内分泌疾病临床和基础研究，尤其是下丘脑垂体疾病的基础和临床研究，在内分泌学领域享有国际声望；于2005年荣获“赛克勒中国医师年度奖 ”，并担任欧洲神经内分泌肿瘤协会常委，为国际通用版《垂体腺瘤临床治疗指南》起草者之一。', '', '100', '21', 'http://r.photo.store.qq.com/psb?/V12SqnDn3Q2OCG/LHcqypFtKx2lG3W8v3IrPVV.yYf.fNMwtvJcA.8QfF4!/r/dFUBAAAAAAAA', '888', '0');

-- ----------------------------
-- Table structure for `doctorcomment`
-- ----------------------------
DROP TABLE IF EXISTS `doctorcomment`;
CREATE TABLE `doctorcomment` (
  `Dcomment` int(11) NOT NULL AUTO_INCREMENT,
  `Duserid` int(11) NOT NULL,
  `doctorID_id` int(11) DEFAULT NULL,
  `Docarticle` varchar(500) NOT NULL,
  PRIMARY KEY (`Dcomment`),
  KEY `docididid` (`doctorID_id`),
  KEY `docouderid` (`Duserid`),
  CONSTRAINT `docididid` FOREIGN KEY (`doctorID_id`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `docouderid` FOREIGN KEY (`Duserid`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctorcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `dquestion`
-- ----------------------------
DROP TABLE IF EXISTS `dquestion`;
CREATE TABLE `dquestion` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `Quid` int(11) NOT NULL,
  `Qdid` int(11) NOT NULL,
  `Qsex` char(2) CHARACTER SET utf8 NOT NULL,
  `Qage` varchar(3) NOT NULL,
  `Qdirection` varchar(500) CHARACTER SET utf8 NOT NULL,
  `DiseasePic` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `Diseasetype` varchar(20) DEFAULT NULL,
  `Time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `Quserid` (`Quid`),
  KEY `Qdid` (`Qdid`),
  CONSTRAINT `Qdid` FOREIGN KEY (`Qdid`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `Quserid` FOREIGN KEY (`Quid`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dquestion
-- ----------------------------
INSERT INTO `dquestion` VALUES ('1', '6', '8', '男', '13', '骨折', null, null, '2018-02-27');
INSERT INTO `dquestion` VALUES ('2', '27', '50', '女', '26', '油性皮肤怎么护理', null, null, '2018-03-27');
INSERT INTO `dquestion` VALUES ('3', '10', '88', '男', '37', '拉肚子', null, null, '2018-03-27');
INSERT INTO `dquestion` VALUES ('4', '27', '1', '女', '12', '111', null, null, null);
INSERT INTO `dquestion` VALUES ('5', '27', '151', '男', '12', '111', null, null, null);
INSERT INTO `dquestion` VALUES ('6', '27', '152', '男', '33', '请输入您的问题', null, null, null);
INSERT INTO `dquestion` VALUES ('7', '27', '152', '男', '33', '666', null, null, '2018-5-24');
INSERT INTO `dquestion` VALUES ('8', '27', '1', '男', '22', '嗓子疼', null, null, '2018-6-24');
INSERT INTO `dquestion` VALUES ('10', '27', '151', '男', '111', '耳朵疼', null, null, '2018-6-24');

-- ----------------------------
-- Table structure for `faction`
-- ----------------------------
DROP TABLE IF EXISTS `faction`;
CREATE TABLE `faction` (
  `factionID` int(11) NOT NULL AUTO_INCREMENT COMMENT '每个‘帮’的id号码',
  `factionName` varchar(20) NOT NULL COMMENT '各种‘帮’的名字，例如：皮肤帮',
  `TopicNum` varchar(500) NOT NULL COMMENT '每个‘帮’内的话题总数',
  `factionPic` varchar(500) NOT NULL COMMENT '每个‘帮’的头像',
  `factionDirection` varchar(200) NOT NULL,
  PRIMARY KEY (`factionID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faction
-- ----------------------------
INSERT INTO `faction` VALUES ('1', '皮肤帮', '12', '123', '如何减少皮肤病的发生');
INSERT INTO `faction` VALUES ('2', '耳鼻帮', '13', '123', '请问嗓子听吃什么药？');
INSERT INTO `faction` VALUES ('3', '股骨帮', '13', '123', '请问网上挂号要挂哪个科室？');
INSERT INTO `faction` VALUES ('4', '筋骨帮', '14', '12', '有股骨头坏死的朋友吗？');
INSERT INTO `faction` VALUES ('5', '靓丽帮', '15', '123', '如果才能做到真正的减肥');
INSERT INTO `faction` VALUES ('6', '健齿帮', '15', '123', '滋润养颜祛斑一招搞定');
INSERT INTO `faction` VALUES ('7', '中医帮', '12', '123', '枸杞神奇的治病的功效');

-- ----------------------------
-- Table structure for `hospital`
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `hospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalName` varchar(20) NOT NULL,
  `hospitalAddress` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL,
  `hospitalDirection` varchar(200) NOT NULL,
  `hospitalImg` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`hospitalID`),
  UNIQUE KEY `hid` (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES ('1', '河北医科大学第一医院', '裕华区东岗路89号', '三级甲等', '河北省首批新型农村合作医疗定点省级医院', 'http://mpic.tiankong.com/d81/2d6/d812d6b17d3ea565aaa418a7341af7c6/640.jpg');
INSERT INTO `hospital` VALUES ('2', '河北医科大学第二医院', '新华区和平西路215号', '三级甲等', '医疗技术精湛，收到广大患者的青睐', 'http://mpic.tiankong.com/193/80c/19380c6cf0c35171e9c7293087979ca1/640.jpg');
INSERT INTO `hospital` VALUES ('3', '河北医科大学第三医院', '石家庄市自强路139号', '三级甲等', '跻身全国最佳医院排行榜前100名', 'http://spic.quanjing.com/chineseview019/high/395-0103.jpg');
INSERT INTO `hospital` VALUES ('4', '河北医科大学第四医院', '\r\n长安区健康路12号\r\n\r\n\r\n', '三级甲等', '是一所以诊治肿瘤为重点的综合性三级甲等医', 'http://mpic.tiankong.com/d81/2d6/d812d6b17d3ea565aaa418a7341af7c6/640.jpg');
INSERT INTO `hospital` VALUES ('5', '河北省人民医院', '新华区和平西路348号', '三级甲等', '数十项技术填补国内、省内空白', 'http://s6.51cto.com/wyfs02/M00/4C/99/wKiom1RA0WXDrtlcAAW3imVj2zE409.jpg');
INSERT INTO `hospital` VALUES ('6', '河北省胸科医院', '\r\n桥东区胜利北街372号', '三级甲等', '省级重大新发、突发传染病重症定点救治医院', 'http://imgsrc.baidu.com/image/c0%3Dpixel_huitu%2C0%2C0%2C294%2C40/sign=003ac6cb761ed21b6dc426a5c416b8a8/a50f4bfbfbedab6484e11af9fc36afc379311e73.jpg');
INSERT INTO `hospital` VALUES ('7', '石家庄市中医院', '桥西区中山西路233号', '三级甲等', '拥有先进的治疗设备，得到了广大患者认可', 'http://mpic.tiankong.com/193/80c/19380c6cf0c35171e9c7293087979ca1/640.jpg');
INSERT INTO `hospital` VALUES ('8', '河北省儿童医院', '建华南大街133号', '三级甲等', '掌握了国内新生儿学科临床救治先进核心技术', 'http://pic.58pic.com/58pic/12/15/70/56958PIC2iy.jpg');
INSERT INTO `hospital` VALUES ('9', '石家庄市中医院 ', '桥西区中山西路233号', '三级甲等', '是国家中医文化建设试点单位', 'http://a4.att.hudong.com/83/93/01300000167299128960939804327.jpg');
INSERT INTO `hospital` VALUES ('10', '石家庄市第一医院', '长安区范西路36号', '三级甲等', '石家庄十大知名医院', 'http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=e303a3e5c9cec3fd9f33af36bee1be4a/fd039245d688d43fdd85cfdb771ed21b0ef43bee.jpg');
INSERT INTO `hospital` VALUES ('11', '石家庄第四医院', '裕华区学苑路91号', '三级甲等', '受到广大患者的一致好评', 'http://jiangxi.sinaimg.cn/2013/1016/U8737P1332DT20131016160956.jpg');
INSERT INTO `hospital` VALUES ('12', '白求恩和平医院', '中山西路398号', '三级甲等', '50多项专科技术在全国或全军领先', 'http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=66812d33a118972bb73708898ea411fc/d50735fae6cd7b8928c62ba4052442a7d9330e6a.jpg');

-- ----------------------------
-- Table structure for `illnesstype`
-- ----------------------------
DROP TABLE IF EXISTS `illnesstype`;
CREATE TABLE `illnesstype` (
  `illnessID` int(50) NOT NULL AUTO_INCREMENT,
  `illnessName` varchar(50) NOT NULL,
  PRIMARY KEY (`illnessID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of illnesstype
-- ----------------------------
INSERT INTO `illnesstype` VALUES ('1', '呼吸系统疾病');
INSERT INTO `illnesstype` VALUES ('2', '肿瘤科疾病');
INSERT INTO `illnesstype` VALUES ('3', '传染病与性病');
INSERT INTO `illnesstype` VALUES ('4', '消化系统疾病');
INSERT INTO `illnesstype` VALUES ('5', '寄生虫疾病');
INSERT INTO `illnesstype` VALUES ('6', '疑难杂症');
INSERT INTO `illnesstype` VALUES ('7', '循环系统疾病');
INSERT INTO `illnesstype` VALUES ('8', '泌尿系统疾病');
INSERT INTO `illnesstype` VALUES ('9', '血液系统疾病');
INSERT INTO `illnesstype` VALUES ('10', '内分泌系统疾病');
INSERT INTO `illnesstype` VALUES ('11', '新陈代谢疾病');
INSERT INTO `illnesstype` VALUES ('12', '缔结组织疾病');
INSERT INTO `illnesstype` VALUES ('13', '淋巴系统疾病');
INSERT INTO `illnesstype` VALUES ('14', '神经精神系统疾病');
INSERT INTO `illnesstype` VALUES ('15', '妇产科疾病');
INSERT INTO `illnesstype` VALUES ('16', '儿科疾病');
INSERT INTO `illnesstype` VALUES ('17', '耳鼻喉科疾病');
INSERT INTO `illnesstype` VALUES ('18', '眼科疾病');
INSERT INTO `illnesstype` VALUES ('19', '口腔科疾病');
INSERT INTO `illnesstype` VALUES ('20', '伤骨科疾病');
INSERT INTO `illnesstype` VALUES ('21', '皮肤科疾病');

-- ----------------------------
-- Table structure for `knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge` (
  `knowledgeTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `knowledgeType` int(11) NOT NULL,
  `noteName` varchar(20) NOT NULL,
  `noteArticle` varchar(1000) NOT NULL,
  `notedate` varchar(20) NOT NULL,
  `visitedNumber` varchar(500) DEFAULT NULL,
  `knowpic` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`knowledgeTypeID`),
  KEY `hokid` (`knowledgeType`),
  CONSTRAINT `hokid` FOREIGN KEY (`knowledgeType`) REFERENCES `knowtype` (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES ('1', '1', '【健康科普】头晕该看什么科？', '　头晕到底该看什么科呢?\r\n　　为了更好的区分头晕，指导患者就诊，根据头晕的具体表现，医学专家将头晕初步分为了四类。\r\n　　第一类头晕是眩晕(Vertigo)，表现为自身和外界环境的旋转感觉。患者感到天旋地转或物体摇晃，不敢睁眼，觉得闭眼比较舒服，常伴恶心、呕吐，也可能有出汗、心慌，甚至还会拉肚子。这属于三维空间的视空间障碍，最常见于外周前庭疾病，如良性阵发性位置性眩晕(也就是常说的耳石症)、前庭神经炎、梅尼埃病。这种眩晕虽然表现的严重，但大多数是良性的，并且有些是自愈性的。以上这些疾病多见于耳科疾病，可考虑耳鼻喉科就诊。\r\n　　第二类头晕是失衡(Disequilibrium)，是一种动作不协调，无法保持平衡的感觉。患者站立行走不稳，摇晃，感觉有“踩棉花感”或“坐船感”。这是平衡障碍，多由神经系统疾病引起，可见于深感觉障碍、周围神经疾病、共济失调、神经变性性疾病等。这种情况需要重视，很有可能是严重的疾病，一定要尽早到神经内科详细的检查。\r\n　　第三类头晕是晕厥前(Presyncope)表现，是晕厥或即将晕厥的感觉。患者会感到眼前发黑、站立不稳、要摔倒的感觉，有时候出现短暂的意识丧失而摔倒，也就是老百姓常说的“昏倒”或“虚脱”，可伴有出冷汗、心悸。这种最常见于反射性晕厥，也可能见于低血压、心律失常、低血糖、贫血等。推荐优先心血管内科就诊。\r\n　　第四类头晕是头昏或非特异性头晕(Light-headedness or Non-specific dizziness)，这是一种比较含糊、难以准确描述的头昏或头晕的感觉。这种现象最多见。患者常常表现为头部昏沉感，不清醒感，易疲乏，犯困等等。这最常见于精神因素，如焦虑抑郁状态，另外如急性前庭疾病恢复期、内科疾病或药物副作用的也可能引起。这种情况可以在神经内科及心理科寻求帮助。\r\n　头晕到底该看什么科呢?\r\n　　为了更好的区分头晕，指导患者就诊，根据头晕的具体表现，医学专家将头晕初步分为了四类。\r\n　　第一类头晕是眩晕(Vertigo)，表现为自身和外界环境的旋转感觉。患者感到天旋地转或物体摇晃，不敢睁眼，觉得闭眼比较舒服，常伴恶心、呕吐，也可能有出汗、心慌，甚至还会拉肚子。这属于三维空间的视空间障碍，最常见于外周前庭疾病，如良性阵发性位置性眩晕(也就是常说的耳石症)、前庭神经炎、梅尼埃病。这种眩晕虽然表现的严重，但大多数是良性的', '2017-12-22', '298', 'http://www.dengta120.com/uploadfile/2017/1229/20171229051017400.jpg');
INSERT INTO `knowledge` VALUES ('2', '1', '不要入了糖尿病饮食的“坑”', '糖尿病饮食治疗是最基本、最重要的治疗方法之一，合理的饮食可有效控制糖尿病。但是，有相当一部分患者在糖尿病营养和饮食管理上有一定误区，给后续营养治疗带来隐患。\r\n　　1. 过度控制饮食\r\n　　有的病人害怕血糖升高，过分限制饮食摄入，其实这样反而不利于控制血糖。热量摄入不足，会导致营养不良，免疫力低下，进一步导致其他疾病的发生。同时人体只能消耗脂肪、蛋白质而供给能量，其中的代谢产物为酮体和非蛋白氮，酮体在体内蓄积会引起酮症酸中毒，造成体内酸碱失衡。最重要的是低摄入量主食，易发生低血糖反应。\r\n　　2. 过度依赖无糖食品\r\n　　无糖食品虽然不含蔗糖、果糖等糖类成分，但是其他碳水化合物、脂肪等含量仍旧不少，吃下去一样会在体内转化成葡萄糖，导致血糖升高，所以必须兼顾全天总热量及膳食平衡。\r\n　　3. 喝粥比吃馒头升糖快？\r\n　　其实大米粥、小米粥等粥类和馒头中的碳水化合物是相似的，长时间熬制会使粮食中的淀粉充分糊化，熬的时间越长血糖生成指数越高。所以，糖尿病病人如果想喝粥的话可以选择短时间熬制，或者替换一部分成粗杂粮即可解决升糖快的问题。\r\n　　4、 用了胰岛素就能随便吃了？\r\n　　胰岛素治疗的目的是为了控制血糖,，而且胰岛素用量必须在血糖、固定饮食基础上调整的，如果饮食不控制，那血糖会跟不稳定，不利于病情控制。\r\n　　5.、只吃粗粮不吃细粮\r\n　　粗粮含有较多的膳食纤维，有降糖、降脂、通大便的功效，对身体有益。但如果吃太多的粗粮，就可能增加胃肠负担，影响营养素的吸收，长此以往会造成营养不良。因此，无论吃什么食品，都应当适度。\r\n糖尿病饮食治疗是最基本、最重要的治疗方法之一，合理的饮食可有效控制糖尿病。但是，有相当一部分患者在糖尿病营养和饮食管理上有一定误区，给后续营养治疗带来隐患。\r\n　　1. 过度控制饮食\r\n　　有的病人害怕血糖升高，过分限制饮食摄入，其实这样反而不利于控制血糖。热量摄入不足，会导致营养不良，免疫力低下，进一步导致其他疾病的发生。同时人体只能消耗脂肪、蛋白质而供给能量，其中的代谢产物为酮体和非蛋白氮，酮体在体内蓄积会引起酮症酸中毒，造成体内酸碱失衡。最重要的是低摄入量主食，易发生低血糖反应。\r\n　　2. 过度依赖无糖食品\r\n　　无糖食品虽然不含蔗糖、果糖等糖类成分，但是其他碳水化合物、脂肪等含量仍旧不少，吃下去一样会在体内转化成葡萄糖，导致血糖升高，所以必', '2017-12-29', '305', 'http://www.dengta120.com/uploadfile/2017/1229/20171229050507337.jpg');
INSERT INTO `knowledge` VALUES ('3', '1', '口腔专家揭秘：洗牙到底好不好', '什么是洗牙？\r\n　　洗牙又称洁牙，是利用特定口腔医疗器械去除牙龈上牙结石、牙菌斑和色渍，也是目前去除龈上牙结石和牙菌斑最有效的方法。\r\n　　洗牙是一种很好的牙齿保健手段，也是治疗牙周病的首选方法。\r\n　　为什么要洗牙？\r\n　　牙菌斑是牙周病的元凶，在除去之后还会不断地在牙面重新形成。菌斑清除不到位，加上唾液中的矿物盐逐渐沉积，日久天长就会形成牙结石。而牙结石的存在使得菌斑与组织表面紧密接触，引起牙周组织的炎症反应。此外，牙结石的多孔结构也容易吸收大量的细菌毒素，并且牙石还会妨碍刷牙。长时间不清除（不洗牙），可能引起牙龈炎、牙周炎、出现牙龈出血、口臭，最终引起牙齿松动，甚至脱落等现象。\r\n　　所以洗牙的主要目的是为了防治口腔疾病，而不单纯是为了好看。\r\n　　我每天刷牙准时又认真，还用洗牙吗？\r\n　　还是需要。因为牙菌斑的生成速度远大于你的刷牙频率，只通过刷牙来洁牙，牙菌斑的量只会越来越多。更何况大多数人并没有掌握正确的刷牙方法，久而久之牙菌斑成为了牙结石，并导致牙周病。\r\n　　怎么洗？\r\n　　正规医院洁牙主要为手工洁牙、超声波洁牙和喷砂洁牙。目前喷砂和超声波是使用最为广泛的两种洁牙方法。\r\n　　超声洁牙：利用超声震动震碎、清除牙结石。\r\n　　喷砂洁牙：利用高压气流通过喷砂手机头将特制的很细的喷砂牙粉与水一起喷擦在牙面上，用来去除牙菌斑和色素，牙齿邻面和间隙中的细小牙石，对牙齿表面起一个磨细抛光作用。\r\n　　洗牙会损伤牙齿的保护层（牙釉）吗？\r\n　　在正规医院，只要医生掌握操作技巧，正确合理使用超声、喷砂洁牙器械，是不用担心对牙齿造成损伤的。\r\n　　在洗牙过程中，大家可能会感觉到有牙齿碎片脱落，别担心，那只是你的牙结石正被医生洗掉。\r\n　　洗牙让我牙缝变大，牙龈萎缩，牙齿松动了怎么说？\r\n　　这种情况经常出现在长期不洗牙的人群中，此类患者洗牙前牙结石较多，塞满牙缝。通过洗牙除去牙缝中的牙结石，牙缝就变得明显，尤其舌头舔起来与先前牙缝情况差距较大，导致一种“洗牙把牙缝洗大”的错觉。\r\n　　洗牙后牙齿松动、牙龈萎缩同样也在长期不洗呀的人群中出现较多。其实洗牙后松动并不是洗牙本身所导致。这些患者因为长期不洗牙导致牙周病较严重，牙龈本身已经萎缩，牙槽骨也已吸收。只不过洗牙前，牙结石帮着暂时“固定”住牙齿，导致患者感觉不到牙齿松动。当牙结石被去除后，这种暂时的“固定”就消失了。\r', '2017-12-28', '473', 'http://www.dengta120.com/uploadfile/2017/1228/20171228031814295.jpg');
INSERT INTO `knowledge` VALUES ('4', '1', '提高新陈代谢的8个方法', '一、锻炼肌肉\r\n \r\n　　即使什么都不做，你的身体也会不断地燃烧热量，这种静息代谢率在肌肉较多的人中要高得多。 每一磅的肌肉每天要消耗大约6卡路里热量,而每天每磅脂肪燃烧只有2卡路里。经过一段时间的力量训练，被激活的肌肉会提高你新陈代谢率。 \r\n \r\n \r\n \r\n　　二、加强有氧运动\r\n \r\n　　有氧运动不可能构建大肌肉,但它可以在锻炼后几个小时加速你的新陈代谢。高强度的运动比低强度或中等强度的训练会更有效。为了更有效果,可以尝试在健身房做一个强度更大的课程，或者在常规的散步中进行一个短暂的慢跑。 \r\n \r\n \r\n \r\n　　三、足量饮水\r\n \r\n　　身体是需要水来加速新陈代谢的。在一项研究中表明,与每天喝四杯水的人相比较，成人每天喝八杯水会燃烧更多的卡路里。所以，每天要保持水分的摄入,每次餐前或者吃小零嘴之前，可以喝一杯水或其他不加糖的饮料；多吃一些富含水分的新鲜水果或蔬菜,而不要去选择饼干或薯片之类的食物。 \r\n \r\n \r\n \r\n　　四、根据自身情况选择能量饮料\r\n \r\n　　能量饮料中的一些成分可以提高新陈代谢。咖啡因可以增加身体的能量消耗量；牛磺酸,它是一种氨基酸，可以加快新陈代谢,帮助燃烧脂肪。但是这些饮料也会给一些人带来不好的影响，比如高血压、焦虑和影响睡眠。美国儿科学会也不推荐儿童和青少年喝能量饮料。 \r\n \r\n \r\n \r\n　　五、少食多餐 \r\n \r\n　　多餐可以帮助你减肥。两餐之间相隔时间较长会减缓新陈代谢。每3至4个小时吃一顿小餐或小零嘴，可以让新陈代谢加快。一些研究也表明,人们有规律的吃些零食，而在正餐时间少吃些的人能够更好的做到这一点。 \r\n \r\n \r\n \r\n　　六、给你的饭菜调调味\r\n \r\n　　辛辣食物含有天然化学物质,可以加快新陈代谢，效果可能是暂时的,但如果经常吃辣的食物, 调味菜肴时放些辣椒，久而久之，这种好处就会显现。 \r\n \r\n \r\n \r\n　　七、选择蛋白质食物\r\n \r\n　　与吃脂肪或碳水化合物相比，身体消化蛋白质会燃烧更多热量。作为均衡饮食的一部分,用瘦肉等蛋白质丰富的食物代替一些碳水化合物食物, 可以促进新陈代谢。良好的蛋白质来源包括瘦牛肉、火鸡、鱼、鸡肉、豆腐、坚果、豆类、鸡蛋和低脂乳制品。 \r\n \r\n \r\n \r\n　　八、喝黑咖啡\r\n \r\n　　如果你是个喝咖啡的人，除了享受它提高精力和专注的好处外，适量饮用咖啡还可以短期内提高你的', '2017-12-28', '511', 'http://www.dengta120.com/uploadfile/2017/1228/20171228031432539.jpg');
INSERT INTO `knowledge` VALUES ('5', '1', '按摩听宫穴可有效缓解耳鸣、耳聋', '耳鸣是指病人自觉耳内鸣响，如闻蝉声，或如潮声。耳聋是指不同程度的听觉减退，甚至消失。耳鸣可伴有耳聋，耳聋亦可由耳鸣发展而来。二者临床表现和伴发症状虽有不同，但在病因病机上却有许多相似之处，均与肾有密切的关系。那么，如何有效缓解耳鸣、耳聋呢？下文穴位保健小技巧可以帮助你！', '2018-1-1', '586', 'http://www.dengta120.com/uploadfile/2015/1225/20151225110221693.jpg');
INSERT INTO `knowledge` VALUES ('6', '1', '当心过敏性结膜炎', '病因是什么？\r\n　　分为季节性过敏性结膜炎和常年性过敏性结膜炎。变应原都可触发变应性免疫反应。\r\n　　季节性变应原包括：树的花粉、草类、杂草花粉和室外真菌等。\r\n　　常年变应原有尘螨、室内真菌和动物皮屑（多为猫和狗）等。\r\n \r\n　　常见症状及体征？\r\n　　最常见的症状是眼痒，几乎所有的过敏性结膜炎患者均可出现，其中春季角结膜炎最为明显。其他症状有流泪、灼热感、畏光及分泌物增加等。分泌物多为黏液性。一些较严重的过敏性结膜炎，如春季角结膜炎及异位性角结膜炎有时甚至可以出现视力下降。 \r\n　　过敏性结膜炎最常见的体征为结膜充血，变成红通通的“兔眼”。结膜乳头增生是另一个常见的体征，患者自己对着镜子就可以看到成片的“小泡泡”。还可出现结膜水肿甚至角膜损害。\r\n \r\n　　如何治疗？\r\n　　1. 远离过敏源。\r\n　　2. 多采用药物点眼治疗。\r\n　　分为以下几大类：(1).肥大细胞稳定剂；(2).抗组胺药；(3).双效剂；(4).非甾体抗炎药；(5).激素滴眼液；(6).免疫抑制剂；(7).血管收缩药。有一部分患者用某些药后次年会出现“耐药性”，可以调整相应的用药种类。\r\n　　温馨提示：加上冰敷会缓解症状，人工泪液滴眼液也可以稀释抗原缓解症状。\r\n \r\n　　如何预防？\r\n　　如果为季节性过敏性结膜炎可以提前2周点肥大细胞稳定剂类的滴眼液预防过敏的“爆发”。\r\n \r\n　　什么时候停药？\r\n　　症状体征消失2周后可以考虑停药。\r\n \r\n　　有什么禁忌？\r\n　　忌揉眼！\r\n　　如果使用激素类滴眼液要定期复查，少数人用药后会引起眼压高，需要在医生的严密监控下用药，必要时及时调整用药。眼睛的免疫系统对外界抗原表现出的过敏性反应，多与过敏性鼻炎同时发作。儿童多发。不会传染，但会令眼睛很不舒服。\r\n眼睛的免疫系统对外界抗原表现出的过敏性反应，多与过敏性鼻炎同时发作。儿童多发。不会传染，但会令眼睛很不舒服。\r\n眼睛的免疫系统对外界抗原表现出的过敏性反应，多与过敏性鼻炎同时发作。儿童多发。不会传染，但会令眼睛很不舒服。\r\n眼睛的免疫系统对外界抗原表现出的过敏性反应，多与过敏性鼻炎同时发作。儿童多发。不会传染，但会令眼睛很不舒服。\r\n', '2017-12-23', '256', 'http://www.dengta120.com/uploadfile/2017/1229/20171229044318158.jpg');
INSERT INTO `knowledge` VALUES ('7', '1', '收藏篇：常见的22种皮肤病', '皮肤具备着近乎完美的生理保护功能：如屏障作用、感觉作用、调节体温、吸收作用、分泌和排泄作用等，在维护机体的健康上，起到十分重要的作用。皮肤的生理功能受到损害，引起皮肤病。下面为您介绍下常见皮肤病的种类和症状。\r\n \r\n常见皮肤病的种类和症状\r\n \r\n1、湿疹\r\n　　湿疹是一种常见的过敏性炎症性皮肤病。湿疹症状主要是以皮疹多样性，对称分布、剧烈瘙痒、反复发作、易演变成慢性为主。可发生于任何年龄，任何部位，任何季节，但常在冬季复发或加剧。\r\n \r\n2、皮炎\r\n　　皮炎是一种常见皮肤病，皮肤出现脱皮、剥落、变厚、变色，及碰触时会发痒等现象。包括常见的夏季皮炎、隐翅虫皮炎、过敏性皮炎、脂溢性皮炎、日光性皮炎、药物性皮炎、接触性皮炎、激素依赖性皮炎、神经性皮炎等。针对不同类型的皮炎症状表现是不一样的。\r\n \r\n3、脱发\r\n　　脱发是头发脱落的现象。引起脱发的原因有生理性及病理性之分。生理性脱发指头发正常的脱落。病理性脱发是指头发异常或过度的脱落。\r\n \r\n4、痤疮\r\n　　痤疮是一种毛囊和皮脂腺的慢性炎症,痤疮多发于颜面和胸背部,症状表现为黑头粉刺,丘疹,脓疮,结节,囊肿及疤痕等多种皮肤损伤,有碍容颜。\r\n \r\n5、荨麻疹\r\n　　荨麻疹是一种常见的过敏性皮肤病，荨麻疹症状主要表现为在接触过敏原的时候，会出现红色斑块并会发生发痒的情形。对荨麻疹的治疗主要是找出病因以消除病因为主，有感染时常须应用抗菌素，对某些食物过敏时暂且不吃。\r\n \r\n6、扁平疣\r\n　　扁平疣是常见的皮肤赘生物。扁平疣的症状主要表现正常常皮色，淡红色或淡褐色扁平丘疹，米粒大到绿豆大，圆形或多角形，表面光滑，境界清楚。目前医学界无法直接杀死扁平疣病毒，所以治疗扁平疣的方法都采用提高人体免疫功能来压制、消除扁平疣。\r\n \r\n7、手足癣\r\n　　手足癣多见于成年人，往往是夏季发作或加重，冬季气候干燥时减轻或症状消失，患了手足癣，均有一些共同的症状，如丘疹、红斑、鳞屑、浸渍、糜烂、水疱、脓疱、痂和皲裂等皮肤损害。冬季气候干燥时减轻或症状消失，故冬季是治疗手足癣的好时机。\r\n \r\n8、疥疮\r\n　　疥疮即疥虫感染引起的皮肤病，由于其传染性强，有些地方也称之为传染病，疥疮的症状表现主要以瘙痒、发红、丘疹为主，关于疥疮的治疗一定要到正规的医院进行治疗。\r\n \r\n9、青春痘\r\n　　青春痘是一种毛囊皮脂腺结构的慢性炎症性疾病。很多人', '2017-12-24', '589', 'http://www.dengta120.com/uploadfile/2017/1017/20171017030159960.jpg');
INSERT INTO `knowledge` VALUES ('8', '2', '王耀献：佛心从医 哲思治院', '►　回忆从医初衷：干中医是偶然，干好中医是“必然”\r\n \r\n　　上世纪六十年代中期，王耀献出生在河南登封市一个农民家庭。现在的嵩山少林寺景区何等繁华热闹，可在那时，却是土地贫瘠、温饱难继的穷山沟沟。\r\n \r\n　　王耀献3岁没了父亲，母亲37岁守寡，含辛茹苦拉扯大了兄弟姊妹六个。“没有顶梁柱、主心骨的家，生活很苦很苦”，王耀献回忆，“从记事开始，就没有吃饱过”。\r\n \r\n　　食物匮乏不在话下，医药条件的落后才是大敌。虽有集体医疗，可诊所里都是赤脚医生。大安片、安乃近、四环素、土霉素……区区几种药品就“包治了百病”。\r\n \r\n　　诊所治不好病，人们就求因于鬼神。有一次王耀献高烧说胡话。母亲认为他被鬼附身，拿根金属棍烧红后往水里放，希望蒸腾起来的雾气能驱走小鬼。\r\n \r\n　　王耀献回忆，曾有小学同学，家里连续几年都有亲人因病离世。男死女改嫁，就此绝了户。那时，因病致残致贫、妻离子散的事，太常见了。\r\n \r\n　　山里人朴实，要问他们什么职业最好?他们会说，教书的先生好，治病的大夫好。为啥好?有知识，有道德，能帮人，体面!\r\n \r\n　　看过太多惨况，无人引导的王耀献在对医学完全不了解，甚至连中医西医都不知为何物的情况下，也不例外地选择了成为一名医生。回想过去，王耀献说，他走的路不是谁有意设定的，大多是缘分和命运的驱策。\r\n \r\n　　从事中医也许是偶然的，但干好中医则是王耀献下定决心的“必然”。\r\n \r\n►　初享“名医”赞誉：成就感比成就更宝贵\r\n \r\n　　16岁的王耀献考入河南中医学院，大二开始利用假期为老百姓看病，一时间口碑雀起。回想那时，王耀献的脸上满是开心。\r\n \r\n　　“现在我的专业水准已经到了这一步，找我的人自然多;可那时年轻啊，有人找我看病，那种幸福感，没话说了”，王耀献说。\r\n \r\n　　1987年，王耀献以全省总成绩第一名被录取为硕士研究生;1996年，考入北京中医药大学攻读博士研究生，三年后获博士学位，并到北京中医药大学东直门医院工作至今。\r\n \r\n　　从主治、副主任、主任医师，到教授、博士生导师，从普通医生、科主任，到医疗院长、院长，他一步一个脚印走得踏实。\r\n \r\n　　谈及专业成就，王耀献经常对年轻大夫们说，“昨天还是副主任医师，今天评上职称就成了主任医师。难道今天就比昨天水平高了吗?不是这样的。从进入校门，到社会实践', '2017-12-25', '558', 'http://www.dengta120.com/uploadfile/2015/0918/20150918114217844.jpg');
INSERT INTO `knowledge` VALUES ('9', '2', '关于健康中国战略，总书记在讲，我们在听！', '18日上午9时，中国共产党第十九次全国代表大会在北京隆重开幕，习近平总书记代表第十八届中央委员会向大会作报告。报告中提出，实施健康中国战略。人民健康是民族昌盛和国家富强的重要标志。要完善国民健康政策，为人民群众提供全方位全周期健康服务。\r\n \r\n报告进一步阐述：\r\n \r\n　　深化医药卫生体制改革，全面建立中国特色基本医疗卫生制度、医疗保障制度和优质高效的医疗卫生服务体系，健全现代医院管理制度。加强基层医疗卫生服务体系和全科医生队伍建设。全面取消以药养医，健全药品供应保障制度。\r\n \r\n　　坚持预防为主，深入开展爱国卫生运动，倡导健康文明生活方式，预防控制重大疾病。\r\n \r\n　　坚持中西医并重，传承发展中医药事业。支持社会办医，发展健康产业。促进生育政策和相关经济社会政策配套衔接，加强人口发展战略研究。\r\n \r\n　　积极应对人口老龄化，构建养老、孝老、敬老政策体系和社会环境，推进医养结合，加快老龄事业和产业发展。\r\n \r\n总书记在讲，我们在听\r\n \r\n　　今日上午，北京市卫生计生系统组织660多个党组织，2万名党员收看学习党的十九大开幕会，收看学习习近平总书记的报告。习近平总书记在十九大报告中，有一段专门提到了健康中国，提到了让更广大的人民群众享受到改革的成果。这体现了党中央对卫生医疗工作的重视和对民生的关注。\r\n \r\n　　同时，我们也意识到任务艰巨。习近平总书记在报告中提到了全面小康的建设，其中健康是重要方面，报告中特别提到，要完善国民健康体系，一方面是有中国特色的医疗保障制度，另一方面要建立优质高效的医疗卫生服务体系。目前北京还处在建设过程中，距离党中央提出的要求还有一段距离，所以我们感受到了任务的艰巨。\r\n \r\n　　今年4月8日，北京医药分开综合改革正式实施，我们在取消药品加成、改善医院运行补偿机制方面做了努力，但我想这只是初步的。我们还要按照十三五规划的要求，特别是在医疗服务体系的重构上，比如如何实现分级诊疗；如何实现全科医生和家庭医生队伍的建设；如何构筑起一、二、三级医院高效运行的服务网络，让市民得到更大的便利等方面继续推进。我们一定会按照习近平总书记在十九大报告中提出的要求，努力完成任务。\r\n \r\n　　目前，北京卫生系统共有4万名员工，其中有2万名党员。这2万名党员如果按照习近平总书记提出的要求，从严治党，把党组织建设好，把党员作用发挥好，发挥党员的先锋模', '2017-12-26', '125', 'http://www.dengta120.com/uploadfile/2017/1019/20171019104000148.jpg');
INSERT INTO `knowledge` VALUES ('10', '2', '国务院：10月底前所有三级医院参加医联体', '国务院总理李克强10月9日主持召开国务院常务会议，听取公立医院综合改革和医疗联合体建设进展情况汇报，通过深化医改优化资源配置保障人民健康；部署进一步做好基本医保全国联网和异地就医直接结算工作，减少群众后顾之忧、更多惠及人民。会议指出，顺应群众期盼，在全国推进基本医保信息联网，实现符合规定的异地就医住院费用直接结算，是今年《政府工作报告》明确的医改重点任务和民生承诺。下一步，一要继续扩大联网定点医疗机构范围，逐步将更多基层医疗机构纳入异地就医直接结算。有关部门要加快研究解决1亿多外出农民工和广大“双创”人员跨省异地住院费用结算问题；二要加快相关医疗保险信息系统对接共享和整合，大力推行医保智能审核和实时监控。严格异地就医费用监管。积极引入商业健康保险，提高异地就医集中地区医保经办服务能力；三要运用互联网、移动终端等，加大力度解读异地结算政策规定和办理流程，让群众听明白、会使用，切实把好事办好。', '2017-12-26', '456', 'http://www.dengta120.com/uploadfile/2017/1017/20171017025114515.jpg');
INSERT INTO `knowledge` VALUES ('11', '2', '“爱不隔绝,我不离开”听障儿童康复公益活', '近日，北京良佑明音听障康复促进中心品牌发布会在西城区第一文化馆隆重举行。北京首大耳鼻喉医院院长路虹作为15位杰出女性公益代言人之一参与到此次活动中来。　原河北医科大学第二医院耳鼻咽喉头颈外科主任医师，硕士研究生导师。享受政府津贴专家。对耳鼻咽喉科常见病和疑难病症的诊治，尤其是耳科各种疾病如急慢性化脓性中耳炎、梅尼埃病、耳聋、耳鸣及眩晕等方面的诊治有丰富的经验。在国家级杂志已发表论文100余篇，参加撰写《耳鼻喉科疾病的诊治与康复》《内耳疾病》和《耳科学基础与临床》等多本专业著作。多次出国研修，任世界著名眩晕研究机构Barany协会会员，《LARYNGOSCOPE》杂志reviewer。\r\n \r\n　　北京首大耳鼻喉医院：于2012年10月16日正式成立，北京市唯一的三级耳鼻喉专科医院。汇聚国内多名耳鼻喉专家，在专业领域颇有建树。\r\n \r\n　　根据世界卫生组织发布的统计数据，目前全球共有3.6亿人患有听力障碍，其中近10%是儿童。《中国出生缺陷防治报告（2012）》数据显示，听力障碍已成为我国第2大出生缺陷疾病。我国现有听力残疾人2780万，其中0-6岁儿童超过80万人，14岁以下的近200万。每年有3万左右听障儿童出生，如果加上迟发性耳聋及药物性耳聋患者，每年新增的听障儿童超过6万。无论是临床或基础研究，还是长期的康复实践普遍证明“早发现、早诊断、早干预”对确保听障儿童康复效果至关重要。早期干预能够帮助听障儿童按照正常发展模式学习言语、语言，同时也为听障儿童的情感、认知等健康发展打下良好基础。健听儿童在出生前就已具备听觉能力和听觉经验，因此，听障儿童只有在出生后尽早接受干预，尽早接受听觉刺激，才能避免言语、语言等能力发展滞后。', '2017-12-15', '256', 'http://www.dengta120.com/uploadfile/2017/0828/20170828055206430.jpg');
INSERT INTO `knowledge` VALUES ('12', '2', '北京西站医托盛行 来京求医者被直送大兴小', '　央广网北京8月24日消息 据中国交通广播报道，北京，汇聚着全国优质的好医生与医疗资源，一直以来，在各地小城市一些难以治愈的患者，常常会带着最后一丝生的希望，来京求医问药。但是，中央人民广播电台中国交通广播接到听众热线，不少人刚刚在北京西站下车还没出站，就被医托带到不知名的小诊所，骗光救命钱。\r\n \r\n　　北京西站内，每天都盘踞着一群群医托，等待着求医者上钩。　河北张家口市民苏敏：我哥去年出车祸，医院诊断大脑萎缩，想坐火车到北京宣武医院看病，到了北京西站问“工作人员”地铁怎么走，随后刚走了有一百米不到，有对儿父女也问宣武医院怎么走，她还说，“宣武医院挂号特别难，根本看不好，而北京世纪安康中医门诊，花一万块钱就能治好”', '2018-1-2', '568', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/w5STHQBOWQKfJWH6UJyOPPJTeH*s5bAwLk5DZgc0uvk!/r/dFkAAAAAAAAA');
INSERT INTO `knowledge` VALUES ('13', '3', '为聋儿朱晨阳捐赠人工耳蜗', '为聋儿朱晨阳捐赠人工耳蜗\r\n出席嘉宾：马宏敏 银力\r\n视频详情：以一曲”江南style”的骑马舞迅速走红网络的11岁小男孩朱晨阳听力障碍，远在800多公里以外的北京首大耳鼻喉医院在知道了这个情况后，表示愿意免费为朱晨阳实施人工耳蜗手术，让我们一起来了解一下详情。', '2018-1-3', '236', 'http://www.dengta120.com/uploadfile/2017/0825/20170825014708380.jpg');
INSERT INTO `knowledge` VALUES ('14', '3', '致命的斑点', '致命的斑点\r\n出席嘉宾：黄青\r\n视频详情：\r\n很多人身上都长有不同程度的小斑点：白点、黑斑、红点，为什么我们身上会出现这样的斑点呢？这些斑点的背后会隐藏了什么样的健康隐患呢？或者会不会导致很严重的身体健康问题呢？下面一起来听听北京中医药大学东直门医院皮肤科黄青博士怎么说。', '2018-1-4', '489', 'http://m.qpic.cn/psb?/V10bbv7O2kC2Db/XYTRibGCGlmZXwLf3DQ.7mmW33tLl35SFckgUULEdMY!/b/dFoAAAAAAAAA&bo=9AHhAQAAAAARFzU!&rf=viewer_4');
INSERT INTO `knowledge` VALUES ('15', '3', '踝关节扭伤不是你想的这么简单', '踝关节扭伤不是你想的这么简单\r\n出席嘉宾：宋宝欣\r\n视频详情：　　脚是人身体上非常重要的一个部位，而脚踝则是一个重要的关节点。脚踝是人体运动的关键部位，它的日常保健需要引起重要。下面我们一起来听听原武警总医院骨科专家宋宝欣和我们一起来聊一聊关于脚踝的话题。', '2017-12-31', '523', 'http://m.qpic.cn/psb?/V10bbv7O2kC2Db/0K7y117*2y1CBX1pdhXI4ftoKFcdYz7Uuh3fIC1dJtU!/b/dDEBAAAAAAAA&bo=9AFdAgAAAAARF4o!&rf=viewer_4');
INSERT INTO `knowledge` VALUES ('16', '3', '《养生堂》夏季护肤无小事', '《养生堂》夏季护肤无小事\r\n出席嘉宾：李航 刘玲玲 王爱平 赵邑\r\n视频详情：北京大学第一医院皮肤科 主任医师李航、刘玲玲、王爱平；副主任医师 赵邑；护士长 丁保玲；皮肤是人体最大的器官，夏天的时候外露的皮肤很多，所以很多人在火热的夏天都采取了防晒措施。日常生活中我们应该如何护理皮肤呢？得了皮肤癌怎么吧？敬请观看2014-06-15期《养生堂》夏季护肤无小事。', '2017-12-28', '631', 'http://m.qpic.cn/psb?/V10bbv7O2kC2Db/MiWgi8gPldMQd3URN4iQkFcdSZFBhECxAN8ufUcnWuk!/b/dC0BAAAAAAAA&bo=9AFNAQAAAAARF5k!&rf=viewer_4');
INSERT INTO `knowledge` VALUES ('17', '3', '摆脱耳聋的困扰', '呼吁儿童打呼噜不可小视\r\n出席嘉宾：符友生\r\n摆脱耳聋的困扰\r\n出席嘉宾：龚树生\r\n视频详情：首都医科大学附属北京友谊医院耳鼻咽喉头颈外科主任 龚树生；上岁数的人就容易患有耳鸣，耳鸣不仅对患者本身有很大的影响，还会对家庭生活产生一定的影响，没有了听力是很多人都害怕的事情，无声的世界是阴暗的，只有及时的预防和治疗才能保护好我们的耳朵不受伤害，才能健康快乐的生活。本期嘉宾就告诉我们怎么摆脱耳聋的困扰。', '2017-12-26', '123', 'http://m.qpic.cn/psb?/V10bbv7O2kC2Db/HdaRYpsudPFrm8fC3oKNEEzSYnw*x7pCe6FzzyxM938!/b/dDABAAAAAAAA&bo=9AF3AQAAAAARF6M!&rf=viewer_4');
INSERT INTO `knowledge` VALUES ('18', '4', '你的内外性格分别是？', '或许你是外冷内热的闷骚型，或许你是敢爱敢恨的直爽型，或许你是高傲冷血的无情型……但内外个性的反差不仅仅如此，快来窥视你的内心深处的个性差吧！', '2018-1-1', '569', 'http://m.qpic.cn/psb?/V10bbv7O2kC2Db/LvxHT0YpBCsg1rNXOGXW31TZbirWc8hJeEP8lzNU7UM!/b/dDEBAAAAAAAA&bo=9AF3AQAAAAARF6M!&rf=viewer_4');
INSERT INTO `knowledge` VALUES ('19', '4', '测测你内心有多憋屈', '在不公平或不顺利的处境中，又无法向其他人诉说或无法被他人所理解、关注时的心理感受就是憋屈，感觉心里满是委屈，有时还不能发火，真是让人欲哭无泪！那么，你内心有多憋屈？快来测试一下！', '2017-12-31', '236', 'http://m.qpic.cn/psb?/V10bbv7O2kC2Db/CXeAQHXcp11YoZhQOjtg2yVg9UEGJ6Wozy5T4m6w9GE!/b/dDIBAAAAAAAA&bo=9AFNAQAAAAARF5k!&rf=viewer_4');
INSERT INTO `knowledge` VALUES ('20', '4', '根据颜色揭示我内心真实年龄', '根据科学研究，不同年龄段的人会有不同的颜色直觉。你看到的红色在别人眼中可能是粉色哦，你的心理年龄是多少呢?', '2018-1-9', '125', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/fq8ARTMav.Ze7G2cI*oJqs.4.WsxHXeErat5IRrECHE!/r/dDEBAAAAAAAA');
INSERT INTO `knowledge` VALUES ('21', '4', '你是个好骗的人吗', '别把我的天真我的真心，当成你骗我的资本，快测下你是个好骗的人吗？', '2018-1-5', '365', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/.aG3dsjw3gdKI1AOICu2oAqUzZagIlexuPGv1RB8JRo!/r/dDIBAAAAAAAA');
INSERT INTO `knowledge` VALUES ('22', '4', '测测你的腰椎还好吗', '测测你的腰椎还好吗', '2017-2-6', '23', 'http://r.photo.store.qq.com/psb?/V10bbv7O3dDMKL/jZNmgORXRyjPPiLWBJWkR0huFSVS0k4XJctrD4PFNKk!/r/dDMBAAAAAAAA');

-- ----------------------------
-- Table structure for `knowledgecomment`
-- ----------------------------
DROP TABLE IF EXISTS `knowledgecomment`;
CREATE TABLE `knowledgecomment` (
  `cardCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentUser` int(11) NOT NULL,
  `commentContent` varchar(200) DEFAULT NULL,
  `knowcomid` int(11) NOT NULL,
  `enable` int(11) DEFAULT '1',
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cardCommentID`),
  KEY `konwledgeid` (`commentUser`),
  KEY `idknowcome` (`knowcomid`),
  CONSTRAINT `idknowcome` FOREIGN KEY (`knowcomid`) REFERENCES `knowledge` (`knowledgeTypeID`),
  CONSTRAINT `konwledgeid` FOREIGN KEY (`commentUser`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of knowledgecomment
-- ----------------------------
INSERT INTO `knowledgecomment` VALUES ('1', '1', '说的有道理', '1', '1', '2018-05-20 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('2', '2', '大家好，两岁宝宝流鼻涕，鼻子不通气，用嘴呼吸，晚上症状严重影响睡觉，咳嗽呕吐。请问除了北京儿童医院耳鼻喉科 别的医院能看吗？挂号好难 哪个医院靠谱又能挂上号？', '2', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('3', '3', '很好啊继续支持', '2', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('4', '2', '好棒！', '1', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('5', '4', '玩手机看到了。', '3', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('6', '5', '好的，怎么做', '4', '1', '2018-05-20 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('7', '6', '牛，，支持', '4', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('8', '7', '很好的活动，支持', '3', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('9', '8', '开滴滴', '2', '1', '2018-05-20 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('10', '9', '谢谢秋神的分享', '2', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('11', '10', '游泳确实有效果，我试过，我是失眠加椎间盘突出，我就是游泳配合芬格欣好眠绵现在好多了', '4', '1', '2018-06-01 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('12', '11', '单纯的突出，其实很简单，做自我牵引，达到椎体的放松，慢慢地可自己恢复原位', '3', '1', '2018-05-30 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('13', '12', '哈哈哈哈哈，好像是这样', '3', '1', '2018-06-01 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('14', '23', '来了，腰一直不舒服，CT检查没事，又找熟人，换了个医院，结果一样。奇怪。', '4', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('15', '26', '长知识', '3', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('16', '26', '长知识', '5', '1', '2018-05-30 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('17', '26', '1', '1', '1', '2018-05-20 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('18', '27', '长知识', '1', '1', '2018-06-01 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('19', '27', '长知识', '2', '1', '2018-05-30 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('20', '27', '长知识', '5', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('21', '27', '长知识', '3', '1', '2018-06-01 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('22', '27', '长知识', '7', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('23', '27', '2', '1', '1', '2018-05-30 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('24', '27', '1', '5', '1', '2018-05-20 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('25', '27', '1', '6', '1', '2018-05-30 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('26', '27', '3', '1', '1', '2018-06-01 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('27', '27', '1', '7', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('28', '27', '2', '6', '1', '2018-06-06 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('29', '27', '4', '5', '1', '2018-05-30 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('30', '27', '6', '1', '1', '2018-04-08 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('31', '27', '3', '1', '1', '2018-05-20 07:28:00');
INSERT INTO `knowledgecomment` VALUES ('32', '27', '长知识', '4', '1', '2018/6/24 下午6:59:43');

-- ----------------------------
-- Table structure for `knowtype`
-- ----------------------------
DROP TABLE IF EXISTS `knowtype`;
CREATE TABLE `knowtype` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `knowledgeName` varchar(50) NOT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of knowtype
-- ----------------------------
INSERT INTO `knowtype` VALUES ('1', '推荐');
INSERT INTO `knowtype` VALUES ('2', '新闻');
INSERT INTO `knowtype` VALUES ('3', '视频');
INSERT INTO `knowtype` VALUES ('4', '测试');

-- ----------------------------
-- Table structure for `leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `lwId` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` int(30) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lwId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of leaveword
-- ----------------------------

-- ----------------------------
-- Table structure for `office`
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office` (
  `officeID` int(11) NOT NULL AUTO_INCREMENT,
  `Hname` int(11) NOT NULL,
  `officeName` varchar(20) NOT NULL,
  PRIMARY KEY (`officeID`),
  KEY `HOSPITALID` (`Hname`),
  CONSTRAINT `HOSPITALID` FOREIGN KEY (`Hname`) REFERENCES `hospital` (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO `office` VALUES ('1', '1', '内分泌科');
INSERT INTO `office` VALUES ('2', '1', '放射科');
INSERT INTO `office` VALUES ('4', '1', '妇科');
INSERT INTO `office` VALUES ('5', '1', '儿科');
INSERT INTO `office` VALUES ('6', '1', '泌尿外科');
INSERT INTO `office` VALUES ('11', '1', '耳鼻喉科');
INSERT INTO `office` VALUES ('12', '1', '消化内科');
INSERT INTO `office` VALUES ('13', '1', '急诊科');
INSERT INTO `office` VALUES ('14', '1', '呼吸内科');
INSERT INTO `office` VALUES ('15', '1', '普通外科');
INSERT INTO `office` VALUES ('20', '1', '眼科');
INSERT INTO `office` VALUES ('21', '2', '耳鼻喉科');
INSERT INTO `office` VALUES ('22', '2', '消化内科');
INSERT INTO `office` VALUES ('23', '2', '急诊科');
INSERT INTO `office` VALUES ('24', '2', '呼吸内科');
INSERT INTO `office` VALUES ('25', '2', '普通外科');
INSERT INTO `office` VALUES ('26', '2', '心脏外科');
INSERT INTO `office` VALUES ('27', '2', '骨科');
INSERT INTO `office` VALUES ('28', '2', '口腔科');
INSERT INTO `office` VALUES ('29', '2', '皮肤科');
INSERT INTO `office` VALUES ('30', '2', '眼科');
INSERT INTO `office` VALUES ('31', '2', '内分泌科');
INSERT INTO `office` VALUES ('32', '2', '放射科');
INSERT INTO `office` VALUES ('34', '2', '妇科');
INSERT INTO `office` VALUES ('35', '2', '儿科');
INSERT INTO `office` VALUES ('36', '2', '泌尿外科');
INSERT INTO `office` VALUES ('41', '3', '耳鼻喉科');
INSERT INTO `office` VALUES ('42', '3', '消化内科');
INSERT INTO `office` VALUES ('43', '3', '急诊科');
INSERT INTO `office` VALUES ('44', '3', '呼吸内科');
INSERT INTO `office` VALUES ('45', '3', '普通外科');
INSERT INTO `office` VALUES ('46', '3', '心脏外科');
INSERT INTO `office` VALUES ('47', '3', '骨科');
INSERT INTO `office` VALUES ('48', '3', '口腔科');
INSERT INTO `office` VALUES ('49', '3', '皮肤科');
INSERT INTO `office` VALUES ('50', '3', '眼科');
INSERT INTO `office` VALUES ('51', '3', '内分泌科');
INSERT INTO `office` VALUES ('52', '3', '放射科');
INSERT INTO `office` VALUES ('54', '3', '妇科');
INSERT INTO `office` VALUES ('55', '3', '儿科');
INSERT INTO `office` VALUES ('56', '3', '泌尿外科');
INSERT INTO `office` VALUES ('59', '3', '肾内科');
INSERT INTO `office` VALUES ('60', '3', '病理科');
INSERT INTO `office` VALUES ('71', '4', '耳鼻喉科');
INSERT INTO `office` VALUES ('72', '4', '消化内科');
INSERT INTO `office` VALUES ('73', '4', '急诊科');
INSERT INTO `office` VALUES ('74', '4', '呼吸内科');
INSERT INTO `office` VALUES ('75', '4', '普通外科');
INSERT INTO `office` VALUES ('76', '4', '心脏外科');
INSERT INTO `office` VALUES ('77', '4', '骨科');
INSERT INTO `office` VALUES ('78', '4', '口腔科');
INSERT INTO `office` VALUES ('79', '4', '皮肤科');
INSERT INTO `office` VALUES ('80', '4', '眼科');
INSERT INTO `office` VALUES ('81', '4', '内分泌科');
INSERT INTO `office` VALUES ('82', '4', '放射科');
INSERT INTO `office` VALUES ('84', '4', '妇科');
INSERT INTO `office` VALUES ('85', '4', '儿科');
INSERT INTO `office` VALUES ('86', '5', '耳鼻喉科');
INSERT INTO `office` VALUES ('87', '5', '消化内科');
INSERT INTO `office` VALUES ('88', '5', '急诊科');
INSERT INTO `office` VALUES ('89', '5', '呼吸内科');
INSERT INTO `office` VALUES ('90', '5', '普通外科');
INSERT INTO `office` VALUES ('91', '5', '心脏外科');
INSERT INTO `office` VALUES ('92', '5', '骨科');
INSERT INTO `office` VALUES ('93', '5', '口腔科');
INSERT INTO `office` VALUES ('94', '5', '皮肤科');
INSERT INTO `office` VALUES ('95', '5', '眼科');
INSERT INTO `office` VALUES ('96', '5', '内分泌科');
INSERT INTO `office` VALUES ('97', '5', '放射科');
INSERT INTO `office` VALUES ('99', '5', '妇科');
INSERT INTO `office` VALUES ('100', '5', '儿科');
INSERT INTO `office` VALUES ('101', '6', '耳鼻喉科');
INSERT INTO `office` VALUES ('102', '6', '消化内科');
INSERT INTO `office` VALUES ('103', '6', '急诊科');
INSERT INTO `office` VALUES ('104', '6', '呼吸内科');
INSERT INTO `office` VALUES ('105', '6', '普通外科');
INSERT INTO `office` VALUES ('106', '6', '心脏外科');
INSERT INTO `office` VALUES ('107', '6', '儿科');
INSERT INTO `office` VALUES ('108', '6', '口腔科');
INSERT INTO `office` VALUES ('109', '6', '皮肤科');
INSERT INTO `office` VALUES ('110', '6', '眼科');
INSERT INTO `office` VALUES ('111', '7', '耳鼻喉科');
INSERT INTO `office` VALUES ('112', '7', '消化内科');
INSERT INTO `office` VALUES ('113', '7', '急诊科');
INSERT INTO `office` VALUES ('114', '7', '呼吸内科');
INSERT INTO `office` VALUES ('115', '7', '普通外科');
INSERT INTO `office` VALUES ('116', '7', '心脏外科');
INSERT INTO `office` VALUES ('117', '7', '儿科');
INSERT INTO `office` VALUES ('118', '7', '口腔科');
INSERT INTO `office` VALUES ('119', '7', '皮肤科');
INSERT INTO `office` VALUES ('120', '7', '眼科');
INSERT INTO `office` VALUES ('121', '8', '耳鼻喉科');
INSERT INTO `office` VALUES ('122', '8', '消化内科');
INSERT INTO `office` VALUES ('123', '8', '急诊科');
INSERT INTO `office` VALUES ('124', '8', '呼吸内科');
INSERT INTO `office` VALUES ('125', '8', '普通外科');
INSERT INTO `office` VALUES ('126', '8', '心脏外科');
INSERT INTO `office` VALUES ('127', '8', '儿科');
INSERT INTO `office` VALUES ('128', '8', '口腔科');
INSERT INTO `office` VALUES ('129', '8', '皮肤科');
INSERT INTO `office` VALUES ('130', '8', '眼科');
INSERT INTO `office` VALUES ('131', '9', '耳鼻喉科');
INSERT INTO `office` VALUES ('132', '9', '消化内科');
INSERT INTO `office` VALUES ('133', '9', '急诊科');
INSERT INTO `office` VALUES ('134', '9', '呼吸内科');
INSERT INTO `office` VALUES ('135', '9', '普通外科');
INSERT INTO `office` VALUES ('136', '9', '心脏外科');
INSERT INTO `office` VALUES ('137', '9', '儿科');
INSERT INTO `office` VALUES ('138', '9', '口腔科');
INSERT INTO `office` VALUES ('139', '9', '皮肤科');
INSERT INTO `office` VALUES ('140', '9', '眼科');
INSERT INTO `office` VALUES ('141', '10', '耳鼻喉科');
INSERT INTO `office` VALUES ('142', '10', '消化内科');
INSERT INTO `office` VALUES ('143', '10', '急诊科');
INSERT INTO `office` VALUES ('144', '10', '呼吸内科');
INSERT INTO `office` VALUES ('145', '10', '普通外科');
INSERT INTO `office` VALUES ('146', '10', '心脏外科');
INSERT INTO `office` VALUES ('147', '10', '儿科');
INSERT INTO `office` VALUES ('148', '10', '口腔科');
INSERT INTO `office` VALUES ('149', '10', '皮肤科');
INSERT INTO `office` VALUES ('150', '10', '眼科');
INSERT INTO `office` VALUES ('151', '11', '耳鼻喉科');
INSERT INTO `office` VALUES ('152', '11', '消化内科');
INSERT INTO `office` VALUES ('153', '11', '急诊科');
INSERT INTO `office` VALUES ('154', '11', '呼吸内科');
INSERT INTO `office` VALUES ('155', '11', '普通外科');
INSERT INTO `office` VALUES ('156', '11', '心脏外科');
INSERT INTO `office` VALUES ('157', '11', '儿科');
INSERT INTO `office` VALUES ('158', '11', '口腔科');
INSERT INTO `office` VALUES ('159', '11', '皮肤科');
INSERT INTO `office` VALUES ('160', '11', '眼科');
INSERT INTO `office` VALUES ('161', '12', '耳鼻喉科');
INSERT INTO `office` VALUES ('162', '12', '消化内科');
INSERT INTO `office` VALUES ('163', '12', '急诊科');
INSERT INTO `office` VALUES ('164', '12', '呼吸内科');
INSERT INTO `office` VALUES ('165', '12', '普通外科');
INSERT INTO `office` VALUES ('166', '12', '心脏外科');
INSERT INTO `office` VALUES ('167', '12', '儿科');
INSERT INTO `office` VALUES ('168', '12', '口腔科');
INSERT INTO `office` VALUES ('169', '12', '皮肤科');
INSERT INTO `office` VALUES ('170', '12', '眼科');

-- ----------------------------
-- Table structure for `patient`
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `patientName` varchar(20) NOT NULL,
  `IDcard` varchar(20) NOT NULL,
  `patientAge` varchar(3) NOT NULL,
  `patientTel` varchar(11) NOT NULL,
  `patientsex` varchar(3) NOT NULL,
  `enable` int(11) DEFAULT '1',
  PRIMARY KEY (`patientID`),
  KEY `patientUserid` (`user_id`),
  CONSTRAINT `patientUserid` FOREIGN KEY (`user_id`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('1', '1', '王源', '130684199507220022', '22', '15732176511', '', '1');
INSERT INTO `patient` VALUES ('2', '2', '李丽', '130684199501110022', '22', '15732176513', '', '1');
INSERT INTO `patient` VALUES ('3', '3', '张鹏飞', '130684199707170031', '20', '15732176524', '', '1');
INSERT INTO `patient` VALUES ('4', '4', '刘小天', '130684199502020042', '22', '15732176523', '', '1');
INSERT INTO `patient` VALUES ('5', '5', '王晶', '412827199009120322', '27', '15732165433', '', '1');
INSERT INTO `patient` VALUES ('6', '6', '张磊', '130684199709140523', '20', '15303319876', '', '1');
INSERT INTO `patient` VALUES ('7', '7', '黄俊鹏', '412827200001010325', '17', '13641290877', '', '1');
INSERT INTO `patient` VALUES ('8', '8', '赵旭媛', '130684197505090422', '43', '18630987655', '', '1');
INSERT INTO `patient` VALUES ('9', '9', '钱旭', '412827198012210437', '38', '13641387123', '', '1');
INSERT INTO `patient` VALUES ('10', '23', '孙紫嫣', '130684199507220028', '22', '15732176933', '', '1');
INSERT INTO `patient` VALUES ('11', '10', '屈晓茹', '130684199701110042', '20', '15130980474', '', '1');
INSERT INTO `patient` VALUES ('12', '11', '王雪茹', '130684199701110044', '20', '15130980472', '', '1');
INSERT INTO `patient` VALUES ('13', '11', '王艳', '130684199702220046', '20', '15130980473', '', '1');
INSERT INTO `patient` VALUES ('14', '1', '李俊凯', '130684199507220021', '22', '15732176512', '', '1');
INSERT INTO `patient` VALUES ('16', '2', '王昭阳', '130684199407220031', '23', '15732176515', '', '1');
INSERT INTO `patient` VALUES ('17', '2', '李慧', '130684199407220032', '23', '15732176517', '', '1');
INSERT INTO `patient` VALUES ('18', '3', '葛冰', '130684199007220042', '28', '15732106015', '', '1');
INSERT INTO `patient` VALUES ('19', '3', '耿少敏', '130684199007220341', '28', '15732116025', '', '1');
INSERT INTO `patient` VALUES ('20', '4', '王舒航', '130684199107220341', '27', '15732116011', '', '1');
INSERT INTO `patient` VALUES ('21', '4', '李舒畅', '130684198107220341', '37', '15732116021', '', '1');
INSERT INTO `patient` VALUES ('22', '5', '李阳', '130684198107220343', '37', '15732106012', '', '1');
INSERT INTO `patient` VALUES ('26', '7', '陈艺心', '130684199701110035', '20', '15732106014', '', '1');
INSERT INTO `patient` VALUES ('27', '7', '王艺天', '130684197701110035', '40', '15130980477', '', '1');
INSERT INTO `patient` VALUES ('28', '8', '李一硕', '130684197701110037', '40', '15732106016', '', '1');
INSERT INTO `patient` VALUES ('29', '9', '王阳明', '130684196701110037', '50', '15732106017', '', '1');
INSERT INTO `patient` VALUES ('31', '1', '李丽', '412827199509120255', '12', '15732176533', '', '1');
INSERT INTO `patient` VALUES ('39', '1', '王俊丽', '412827199709141322', '21', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('40', '2', '王俊丽', '412827199709141322', '21', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('41', '1', '王俊丽', '412827199709141322', '21', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('42', '2', '王俊丽', '412827199709141322', '21', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('43', '1', '苏媛媛', '412827199709140522', '12', '15732176533', '男', '1');
INSERT INTO `patient` VALUES ('44', '1', '李京朝', '412728199603310932', '21', '15732176533', '男', '1');
INSERT INTO `patient` VALUES ('45', '1', '苏源', '412827199709140522', '21', '15732176533', '男', '1');
INSERT INTO `patient` VALUES ('46', '1', '111', '412827100909140933', '12', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('47', '1', '李梅', '412827100909140933', '12', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('49', '1', '苏源', '412827199709154322', '12', '15434333212', '男', '1');
INSERT INTO `patient` VALUES ('50', '2', '苏源', '412827199709154322', '12', '15434333212', '女', '1');
INSERT INTO `patient` VALUES ('51', '1', '王梅', '412827199709140522', '21', '15732176533', '女', '1');
INSERT INTO `patient` VALUES ('52', '2', '杨洋', '130765822987265432', '26', '18765422987', '男', '1');
INSERT INTO `patient` VALUES ('89', '26', '依依', '188999777625432716', '33', '16754322876', '男', '1');
INSERT INTO `patient` VALUES ('91', '26', '晨晨', '137899288726542987', '21', '15743288276', '女', '1');
INSERT INTO `patient` VALUES ('94', '27', '1', '111111111111111111', '11', '11111111111', '女', '1');
INSERT INTO `patient` VALUES ('95', '27', '222', '222222222222222222', '22', '22222222222', '男', '1');
INSERT INTO `patient` VALUES ('96', '27', '晨晨', '111111111111111111', '11', '11111111111', '男', '1');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `userId` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `quid` int(11) NOT NULL,
  `qsex` char(2) NOT NULL,
  `qage` varchar(3) NOT NULL,
  `qdirection` varchar(500) NOT NULL,
  `diseaseTypeId` int(50) NOT NULL,
  `diseasePic` varchar(500) DEFAULT NULL,
  `diseasetype` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  PRIMARY KEY (`questionID`),
  KEY `jibingleixing` (`diseaseTypeId`),
  KEY `questionuseri` (`quid`),
  CONSTRAINT `jibingleixing` FOREIGN KEY (`diseaseTypeId`) REFERENCES `illnesstype` (`illnessID`),
  CONSTRAINT `questionuseri` FOREIGN KEY (`quid`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '1', '女', '20', '膝盖疼怎么办', '20', 'null', '骨科问题', '2018-05-18');
INSERT INTO `question` VALUES ('2', '2', '女', '18', '油性皮肤怎么护理', '21', 'null', '皮肤科问题', '2018-04-15');
INSERT INTO `question` VALUES ('3', '3', '男', '40', '油性皮肤怎么护理', '21', 'null', '皮肤科问题', '2018-03-21');
INSERT INTO `question` VALUES ('7', '26', '男', '12', '骨折', '20', null, '', '');
INSERT INTO `question` VALUES ('8', '26', '男', '12', '骨折', '20', null, '', '');
INSERT INTO `question` VALUES ('9', '26', '男', '22', '拉肚子', '4', null, '', '');
INSERT INTO `question` VALUES ('10', '26', '女', '36', '拉肚子', '4', null, '', '');
INSERT INTO `question` VALUES ('11', '26', '女', '36', '拉肚子', '4', null, '', '');
INSERT INTO `question` VALUES ('12', '26', '女', '12', '11', '2', null, '', '');

-- ----------------------------
-- Table structure for `repeat`
-- ----------------------------
DROP TABLE IF EXISTS `repeat`;
CREATE TABLE `repeat` (
  `rid` int(11) NOT NULL,
  `Rqid` int(11) NOT NULL,
  `Repeat` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Rtime` varchar(20) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `Rqid` (`Rqid`),
  CONSTRAINT `Rqid` FOREIGN KEY (`Rqid`) REFERENCES `dquestion` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of repeat
-- ----------------------------
INSERT INTO `repeat` VALUES ('1', '2', '多喝点水', '2018-03-03');
INSERT INTO `repeat` VALUES ('2', '1', '在家多休息，这个没事的', '2018-05-05');

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservationID` int(11) NOT NULL AUTO_INCREMENT,
  `Ruserid` int(11) NOT NULL,
  `Rhospital` int(11) NOT NULL,
  `Rdoctor` int(11) NOT NULL,
  `Rpatient` int(11) NOT NULL,
  `amount` varchar(20) CHARACTER SET utf8 NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`reservationID`),
  KEY `Ruserid` (`Ruserid`) USING BTREE,
  KEY `Rhosiid` (`Rhospital`),
  KEY `Rdoid` (`Rdoctor`),
  KEY `patientRid` (`Rpatient`),
  CONSTRAINT `Rdoid` FOREIGN KEY (`Rdoctor`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `Rhosiid` FOREIGN KEY (`Rhospital`) REFERENCES `hospital` (`hospitalID`),
  CONSTRAINT `Rserid` FOREIGN KEY (`Ruserid`) REFERENCES `user` (`userID`),
  CONSTRAINT `patientRid` FOREIGN KEY (`Rpatient`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=sjis;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('1', '1', '1', '1', '1', '20', '2017-01-01');
INSERT INTO `reservation` VALUES ('2', '2', '2', '2', '2', '20', '2017-01-02');
INSERT INTO `reservation` VALUES ('3', '3', '3', '3', '3', '20', '2017-01-03');
INSERT INTO `reservation` VALUES ('4', '4', '4', '4', '4', '20', '2017-01-04');
INSERT INTO `reservation` VALUES ('11', '2', '1', '1', '1', '20', '2018-02-02');
INSERT INTO `reservation` VALUES ('12', '4', '1', '5', '44', '20', '2018-12-20');
INSERT INTO `reservation` VALUES ('13', '4', '1', '5', '44', '20', '2018-12-20');
INSERT INTO `reservation` VALUES ('14', '4', '11', '107', '47', '20', '2018-07-11');
INSERT INTO `reservation` VALUES ('15', '4', '11', '107', '45', '20', '2018-05-04');
INSERT INTO `reservation` VALUES ('16', '4', '11', '107', '1', '20', '2018-07-11');
INSERT INTO `reservation` VALUES ('17', '4', '11', '97', '41', '20', '2018-07-09');
INSERT INTO `reservation` VALUES ('18', '4', '2', '74', '45', '20', '2018-07-11');
INSERT INTO `reservation` VALUES ('19', '4', '4', '76', '45', '20', '2018-12-20');
INSERT INTO `reservation` VALUES ('23', '2', '1', '153', '2', '20', '1990-02-19');
INSERT INTO `reservation` VALUES ('24', '2', '1', '153', '2', '20', '1990-02-19');
INSERT INTO `reservation` VALUES ('25', '2', '1', '153', '2', '20', '1990-02-19');
INSERT INTO `reservation` VALUES ('26', '2', '1', '153', '2', '20', '1990-02-19');
INSERT INTO `reservation` VALUES ('38', '26', '1', '152', '2', '20', '1990-02-19');
INSERT INTO `reservation` VALUES ('55', '27', '1', '153', '94', '20', '2018-02-19');
INSERT INTO `reservation` VALUES ('57', '27', '5', '77', '94', '20', '2018-07-19');
INSERT INTO `reservation` VALUES ('58', '27', '1', '153', '96', '20', '2018-02-19');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userTel` varchar(11) CHARACTER SET utf8 NOT NULL,
  `userPWD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `userSex` char(2) CHARACTER SET utf8 DEFAULT NULL,
  `userAddress` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `userPhoto` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '15732176533', '123456', 'admin', '女', '河北省', 'http://tx.haiqq.com/uploads/allimg/150321/110Q0J34-2.jpg');
INSERT INTO `user` VALUES ('2', '15732176523', '123456', '吴笑晗', '女', '河北省', 'http://img5.imgtn.bdimg.com/it/u=2545813656,586047713&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('3', '15732106015', '123456', '葛冰', '女', '河北省石家庄市', 'http://img1.skqkw.cn:888/2014/11/20/13/33vok0luu41-92435.jpg');
INSERT INTO `user` VALUES ('4', '15732106011', '234567', '王舒航', '男', '河北省邢台市', 'http://img4.imgtn.bdimg.com/it/u=669366377,1439504327&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('5', '15732106012', '234567', '李阳', '男', '河北省保定市', 'http://img1.imgtn.bdimg.com/it/u=1739368628,835739879&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('6', '15732106013', '234567', '孙晓静', '女', '河北省石家庄市', 'http://img0.imgtn.bdimg.com/it/u=4137583218,2223047074&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('7', '15732106014', '345678', '陈艺心', '女', '河北省石家庄市', 'http://img4.imgtn.bdimg.com/it/u=626287620,1971719740&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('8', '15732106016', '345678', '李一硕', '男', '河北省邯郸市', 'http://img5.imgtn.bdimg.com/it/u=2682652894,1401789967&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('9', '15732106017', '345678', '王阳明', '男', '河北省保定市', 'http://img3.imgtn.bdimg.com/it/u=2984142445,2475167568&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('10', '15732106018', '456789', '屈晓茹', '女', '河北省石家庄市', 'http://img0.imgtn.bdimg.com/it/u=2292650637,3839175679&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('11', '12345678911', '123456', '王湾', '男', '石家庄', 'http://img1.imgtn.bdimg.com/it/u=1678254385,1050442458&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('12', '12345678912', '123456', '周戈', '男', '石家庄', 'http://img3.imgtn.bdimg.com/it/u=2013995265,711715596&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('23', '12345678913', '123456', '李静怡', '男', '石家庄', 'http://img4.imgtn.bdimg.com/it/u=957547832,1485439454&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('24', '15631236096', '123aaa', '111', '女', '石家庄', 'http://img1.imgtn.bdimg.com/it/u=1678254385,1050442458&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('25', '16254676542', '111111', '洋洋', '男', '石家庄', 'http://img1.imgtn.bdimg.com/it/u=1739368628,835739879&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('26', '15732169625', '111111', '黎明', '女', '石家庄', 'http://img1.imgtn.bdimg.com/it/u=1678254385,1050442458&fm=27&gp=0.jpg');
INSERT INTO `user` VALUES ('27', '13722249448', '19970718', '史宸枭', '女', '保定市', null);

-- ----------------------------
-- Table structure for `visit`
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of visit
-- ----------------------------

-- ----------------------------
-- Table structure for `writingfaction`
-- ----------------------------
DROP TABLE IF EXISTS `writingfaction`;
CREATE TABLE `writingfaction` (
  `WriteID` int(11) NOT NULL AUTO_INCREMENT,
  `Wuserid` int(11) NOT NULL,
  `Wname` varchar(50) NOT NULL,
  `Warticle` varchar(500) NOT NULL,
  `Wpic` varchar(500) DEFAULT NULL,
  `Wfaction` int(11) NOT NULL,
  PRIMARY KEY (`WriteID`),
  KEY `factionuser` (`Wuserid`),
  KEY `wfadi` (`Wfaction`),
  CONSTRAINT `factionuser` FOREIGN KEY (`Wuserid`) REFERENCES `user` (`userID`),
  CONSTRAINT `wfadi` FOREIGN KEY (`Wfaction`) REFERENCES `faction` (`factionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of writingfaction
-- ----------------------------
INSERT INTO `writingfaction` VALUES ('1', '1', '皮肤干燥怎么办', '最近...', '用户ID', '1');
INSERT INTO `writingfaction` VALUES ('2', '2', '喉咙疼痛怎么办', '最近...', 'null', '2');
INSERT INTO `writingfaction` VALUES ('3', '3', '问网上挂号要挂哪个科室？', '最近...', 'null', '3');
INSERT INTO `writingfaction` VALUES ('4', '4', '有股骨头坏死的朋友吗？', '最近...', 'null', '4');
