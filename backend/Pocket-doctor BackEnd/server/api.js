//存放后端管理api以及通用／上传api
const express = require('express')
const router = express.Router()
const fs = require('fs')
const multer = require('multer')
const bodyParser = require('body-parser')
const path = require('path')
var upload = multer({ dest: 'upload' })
const mysql = require('mysql')
var crypto = require('crypto')
//var md5 = require('md5');
//import md5 from 'blueimp-md5';

//mysql连接信息配置
const connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"mysql01",
    port:3306
})
connection.connect();



//处理上传的插件
var createFolder = function(folder){
    try{
        fs.accessSync(folder); 
    }catch(e){
        fs.mkdirSync(folder);
    }  
};

//设置上传目录
var uploadFolder = 'upload';
createFolder(uploadFolder);

// 通过 filename 属性定制文件名等信息
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, uploadFolder); 
         // 保存的路径，备注：需要自己创建
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + Math.floor(Math.random()*100000000));   
        // 将保存文件名设置为 字段名 + 时间戳，比如 logo-1478521468943
    }
});

//初始化multer插件，使用stroage进行转存
var upload = multer({ storage: storage})

//上传影片封面图API   公共类api
router.post('/api/uploadPic', upload.single('movie'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/moviePic/' + file.filename+ '.jpg';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
            if(err) throw err;
            res.send(target_path)
        })
    })
});

//上传用户头像API    前端
router.post('/api/uploadUserPic', upload.single('user'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/user/' + file.filename+ '.jpg';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
            if(err) throw err;
            res.send(target_path)
        })
    })
});

//上传轮播图API   公共类api
router.post('/api/uploadPic', upload.single('banner'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/banner/' + file.filename+ '.jpg';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
            if(err) throw err;
            res.send(target_path)
        })
    })
});
//上传富文本编辑器图片API
router.post('/api/uploadEditorPic', upload.single('upload'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/editor/' + file.filename+ '.jpg';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
          res.json(target_path)
        })
    })
});

//设置头像  前端
router.post('/api/setUserPic',function(req,res){
    let src = req.body.PicSrc;
    let id  = req.body.uid;
    connection.query("update user set thumb = '"+ src +"'  WHERE id = '"+ id +"' ",function(err, doc){
        if(err){
         console.log(err);
        } else{
         res.send('success')
        }
    })
})

//取消头像上传  //逻辑：删除反馈的url地址
router.post('/api/cancelUpload',function(req,res){
    let src = req.body.PicSrc;
    fs.unlink(src,function(){
        res.send('success')
    })    
})

//上传视频api 
router.post('/api/addVideo', upload.single('video'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/video/' + file.filename+ '.mp4';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
          res.send(target_path)
        })
    })
});

//删除视频
router.post('/api/deleteVideo',function(req, res){
   var videoSrc = req.body.videoSrc;
   var ChangeVideoSrc = videoSrc.substring(2);
   fs.unlink(ChangeVideoSrc,function(err){
    if(err){
     throw err;
    } else{
     res.send('已经成功删除')
     }
   })
})   

//修改图片，删除原有图片api
router.post('/api/deletePic',function(req, res){
   var imgSrc = req.body.imgSrc;
   var ChangePicSrc = imgSrc.substring(2);
   fs.unlink(ChangePicSrc,function(err){
    if(err){
     throw err;
    } else{
     res.send('已经成功删除')
     }
   })
})      

//封禁视频API
router.post('/api/movieBan',function(req,res){
    const id = req.body.id;
    connection.query('update movie set enable = "0"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
         console.log(err);
        } else{
         res.send('已被封禁')
        }
    })
})
//视频列表 删除预约API
router.post('/api/movieDelete',function(req, res){
    const id = req.body.id;
    connection.query("DELETE FROM reservation WHERE reservationID='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
                res.send('删除成功')
          
      }
    }) 
 })

//解封视频API
router.post('/api/unBanMovie',function(req,res){
    id = req.body.id,
    connection.query('update movie set enable = "1"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('已被解封')
        }
    })
})

//修改视频，删除原有视频api 
router.post('/api/deleteVideo', function(req, res){
    var videoSrc = req.body.videoSrc;
    var ChangeVideoSrc = videoSrc.substring(2);
    fs.unlinkSync(ChangeVideoSrc,function(err){
        if(err){
          throw err;
         }
        res.send('已经成功删除')
    }) 
});
//取到预约列表API(分页)
router.post('/api/reservationPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `reservationID`,`Ruserid`,`patientName`,`hospitalName`,`Dname`,`patientTel`,`IDcard`,`date` from `patient`,`reservation`,`doctor`,`hospital` where `Rhospital`=`hospitalID` and 	`Rdoctor` = `DoctorID` and `Rpatient`=`patientID`  limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到预约列表API
router.get('/api/reservation',function(req, res){
    connection.query('select `reservationID`,`patientsex`,`Ruserid`,`patientName`,`hospitalName`,`Dname`,`patientTel`,`IDcard`,`date` from `patient`,`reservation`,`doctor`,`hospital` where `Rhospital`=`hospitalID` and 	`Rdoctor` = `DoctorID` and `Rpatient`=`patientID`',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到就诊人列表API(分页)
router.post('/api/patientlistPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('SELECT `patientID`,`patientName`,`IDcard`,`patientAge`,`patientTel`,`patientsex`,`username`,`userID` FROM `patient`,`user` where userID=user_id ORDER BY `userID` limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到就诊人列表API
router.get('/api/patientlist',function(req, res){
    connection.query('SELECT `patientID`,`patientName`,`IDcard`,`patientAge`,`patientTel`,`patientsex`,`username`,`userID` FROM `patient`,`user` where userID=user_id ORDER BY `userID`',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到推荐列表API(分页)
router.post('/api/knowledgePage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=1 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到推荐列表API
router.get('/api/knowledge',function(req, res){
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=1',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到新闻列表API(分页)
router.post('/api/newsPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=2 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到新闻列表API
router.get('/api/news',function(req, res){
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=2',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到视频列表API(分页)
router.post('/api/vedioPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=3 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到视频列表API
router.get('/api/vedio',function(req, res){
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=3',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到测试列表API(分页)
router.post('/api/testPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=4 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到测试列表API
router.get('/api/test',function(req, res){
    connection.query('select `knowledgeName`,`noteName`,`noteArticle`,`notedate`,`knowledgeTypeID`,`knowledgeType`,`knowpic` from `knowtype` ,`knowledge` where `knowledgeType`=`kid` and `knowledgeType`=4',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到推荐评论列表API(分页)
router.post('/api/knowledgecommentPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`enable`,`noteName`,`commentContent`,`date`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=1 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到推荐评论列表API
router.get('/api/knowledgecomment',function(req, res){
    connection.query('select `knowledgeName`,`enable`,`noteName`,`commentContent`,`date`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=1',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//知识库评论删除
router.post('/api/CommentDelete',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM knowledgecomment WHERE cardCommentID='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
    }
  }) 
})

//封禁知识库评论API
router.post('/api/BanComment',function(req,res){
    const id = req.body.id;
    connection.query("update knowledgecomment set enable = 0  WHERE cardCommentID ='" + id + "' ",function(err, doc){
        if(err){
         console.log(err);
        } else{
         res.send('已被封禁')
        }
    })
})

//解封知识库评论API
router.post('/api/unBanComment',function(req,res){
    const id = req.body.id;
    connection.query("update knowledgecomment set enable = 1  WHERE cardCommentID ='" + id + "' ",function(err, doc){
        if(err){
         console.log(err);
        } else{
         res.send('已被封禁')
        }
    })
})

//取到新闻评论列表API(分页)
router.post('/api/newscommentPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`enable`,`noteName`,`date`,`commentContent`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=2 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到新闻评论列表API
router.get('/api/newscomment',function(req, res){
    connection.query('select `knowledgeName`,`enable`,`noteName`,`date`,`commentContent`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=2',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到视频评论列表API(分页)
router.post('/api/vediocommentPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`enable`,`noteName`,`date`,`commentContent`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=3 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到视频评论列表API
router.get('/api/vediocomment',function(req, res){
    connection.query('select `knowledgeName`,`enable`,`noteName`,`date`,`commentContent`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=3',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到测试评论列表API(分页)
router.post('/api/testcommentPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `knowledgeName`,`enable`,`noteName`,`date`,`commentContent`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=4 limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到测试评论列表API
router.get('/api/testcomment',function(req, res){
    connection.query('select `knowledgeName`,`enable`,`noteName`,`date`,`commentContent`,`knowledgeTypeID`,`knowledgeType`,`username` from `knowtype` ,`knowledge`,`knowledgecomment`,`user` where `knowledgeType`=`kid` and `commentUser`=`userID` and `knowledgeType`=4',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到快速问诊列表API(分页)
router.post('/api/questionlistPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `questionID`,`userID`,`username`,`illnessName`,`time`,`qdirection` from `question`,`user`,`illnesstype` where `quid`=`userID` and `diseaseTypeId` = `illnessID` limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到快速问诊列表API
router.get('/api/questionlist',function(req, res){
    connection.query('select `questionID`,`userID`,`username`,`illnessName`,`time`,`qdirection` from `question`,`user`,`illnesstype` where `quid`=`userID` and `diseaseTypeId` = `illnessID`',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到免费问诊列表API(分页)
router.post('/api/dquestionlistPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('select `QuestionID`,`userID`,`username`,`illnessName`,`time`,`qdirection` from `question`,`user`,`illnesstype` where `quid`=`userID` and `diseaseTypeId` = `illnessID` limit '+startPage+','+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//取到免费问诊列表API
router.get('/api/dquestionlist',function(req, res){
    connection.query('select `QuestionID`,`userID`,`Qdirection`,`username`,`Time`,`Dname`,`officeName` from `dquestion`,`user`,`doctor`,`office` where `Qdid`=`DoctorID` and `userID`=`Quid` and `DOid`=`officeID` ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})
//取到回复列表API
router.get('/api/repeat',function(req, res){
    qid = req.body.qid,
    connection.query("select `QuestionID`,`Repeat` from `dquestion`,`repeat` where QuestionID='"+qid+"'",function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

//知识库编辑提交API
router.post('/api/knowledgechange',function(req,res){
    var movieName = req.body.movieName,
   // PicUrl = req.body.PicSrc,
    showTime = req.body.showTime,
    content = req.body.content,
    //movieUrl = req.body.movieUrl,
    //moviePlayTime = req.body.moviePlayTime,
   // actor = req.body.actor,
    BelongId = req.body.BelongId,
    id = req.body.id,
    //uid= req.body.uid,
    resBody = {state:''}
        connection.query("update knowledge set noteName='"+movieName+"',notedate='"+showTime+"',noteArticle='"+content+"' WHERE knowledgeTypeID='"+id+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            } else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })

 //知识库内容编辑提交API
 router.post('/api/knowledgeUpload',function(req,res){
    var movieName = req.body.movieName,
   // PicUrl = req.body.PicSrc,
    showTime = req.body.showTime,
    content = req.body.content,
    //movieUrl = req.body.movieUrl,
   // moviePlayTime = req.body.moviePlayTime,
    actor = req.body.actor,
    BelongId = req.body.BelongId,
    id = req.body.id,
    uid= req.body.uid,

    resBody = {state:''}
        connection.query("INSERT INTO knowledge set noteName='"+movieName+"',notedate='"+showTime+"',noteArticle='"+content+"',knowledgeType='"+BelongId+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            } else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })

//电影列表编辑点击API
router.get('/api/knowledgeEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM knowledge WHERE knowledgeTypeID='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
      }
    }) 
})

 //轮播图增加API
 router.post('/api/bannerAdd',function(req,res){
    var bannerName = req.body.bannerName,
    bannerSrc = req.body.bannerSrc,
    resBody = {state:''}
    if(bannerName=='' || bannerSrc==''){
        resBody.state='上传失败';
        res.send(resBody)
    }else{
        connection.query("INSERT INTO banner set title='"+bannerName+"',url='"+bannerSrc+"'",function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            }
            else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
    }
 })
 

//轮播图编辑点击API
router.get('/api/bannerEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM banner WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
       }
    }) 
 })

//修改轮播图API
router.post('/api/bannerUpload',function(req,res){
    var title = req.body.bannerName,
    url = req.body.bannerSrc,
    id = req.body.id,
    resBody = {state:''};
    connection.query('update banner set title = "' + title + '",url = "' + url + '" WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
            resBody.state = '修改失败';
            res.send(resBody);
        } else{
            resBody.state = '修改成功'
            res.send(resBody);
        }
    })
})

//轮播图删除API
router.post('/api/bannerDelete',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM banner WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
    }
  }) 
})

//轮播图列表获取API
router.get('/api/banner',function(req,res){
    connection.query('SELECT * FROM banner WHERE enable = 1', function(err, doc){
        if (err) {
           return console.log(err)
        } else if (doc) {
           res.json({
            errno: 0,
            data: doc
          });
        }
    }) 
});

//电影分类API
router.get('/api/knowledgetypeList',function(req,res){
    connection.query('SELECT * FROM knowtype order by kid', function(err, doc){
        if (err) {
           return console.log(err)
        } else if (doc) {
          res.send(doc);
        }
    }) 
});

//点击电影分类API
router.get('/api/movieCategoryEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM movieCategory WHERE fid='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
    }
  }) 
})

//删除电影分类API
router.post('/api/movieCategoryDel',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM movieCategory WHERE fid='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
        connection.query("DELETE FROM movie WHERE fid='"+id+"'" ,function(err, doc){
            if(err) throw err
            res.send('删除成功')
        })
      }
  }) 
})

//修改电影类别更新API
router.post('/api/movieCategoryUpload',function(req,res){
    var id = req.body.id,
    name = req.body.categoryName;
    connection.query('update movieCategory set name ="' + name + '"  WHERE fid ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        } else{
            res.send('成功')
        }
    })
})

//上传增加电影类别API
router.post('/api/movieCategoryAdd',function(req,res){
    var name = req.body.categoryName
    resBody = {state:''}
        connection.query("INSERT INTO movieCategory set name='"+name+"'",function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            } else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })

//取到用户列表API
router.get('/api/userinfo',function(req,res){
    connection.query('SELECT * FROM user order by id', function(err, doc){
        if (err) {
           return console.log(err)
        }else if (doc) {
           res.json({
            errno: 0,
            data: doc
          });
        }
    }) 
});

//更新用户信息API
router.post('/api/userinfoUpload',function(req,res){
    var userName = req.body.userName,
    url = req.body.thumb,
    id = req.body.id,
    resBody = {state:''};
    connection.query('update user set username = "' + userName + '",thumb = "' + url + '" WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
            resBody.state = '修改失败';
            res.send(resBody);
        }
        else{
            resBody.state = '修改成功'
            res.send(resBody);
        }
    })
})

//点击用户编辑API
router.get('/api/userinfoEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM user WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
    }
  }) 
})

//删除用户API 慎用
router.post('/api/userDelete',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM user WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
    }
  }) 
})



//话题评论删除   
router.post('/api/topicCommentDelete',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM topicComment WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
      }
   }) 
})

//登陆／验证API  通用
router.post('/api/login', function(req, res){
    var userName = req.body.userName,
    password = req.body.password,
    resBody = {state:''}
    connection.query("SELECT * FROM person WHERE username='"+userName+"'",function(err, doc){
        if(err){
            resBody.state = '账号不存在';
            res.send(resBody);
        }else{
            if(doc.length==0){
              resBody.state = '账号不存在';
              res.send(resBody);
            } else{
              if(doc[0].password==password){
                req.user = doc[0].username;
                resBody.state = '登陆成功';
                res.send(doc);
               }else{
               resBody.state = '密码错误'
               res.send(resBody)
              }
            }
        }
    })
});

 //登出api  通用
 router.post('/api/logout',function(req, res){
    req.user = null;
    res.send('已登出');
 })

//修改密码API
router.post('/api/setPsw',function(req, res){
    uid = req.body.id,
    password = req.body.password,
    repeatPsw = req.body.repeatPsw,
    resBody = {state:''}
    if(password === repeatPsw && uid!=''){
    connection.query('update user set password = md5("' + password + '") WHERE id = '+uid+' ',function(err, doc){
        if(err){
            resBody.state = '修改失败';
            res.send(resBody);
        }else{
            resBody.state = '修改成功'
            res.send(resBody);
        }
    })
  } else{
    console.log('两次密码输入不一致，请重新输入!');
  }
})


module.exports = router
