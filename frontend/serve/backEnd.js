var mysql = require('mysql');
var express=require('express');
var qs = require('querystring');
var app = express();
app.all('*',function(req,res,next){
    res.header('Access-Control-Allow-Origin','*');
    res.header('Access-Control-Allow-Headers','Origin,X-Requested-With');
    res.header('Access-control-Allow-Methods','PUT,POST,GET,DELETE,OPTIONS');
    res.header('X-Powered-By','3.2.1');
    res.header('Content-Type','application/json;charset=urf-8');
    next();

});



var pool =mysql.createPool({
    host:'localhost',
    user:'root',
    password:'',
    port:'3306',
    database:'mysql01',
    multipleStatements:true
});


app.get('/hospital',function(req,res){
  pool.query('select * from `hospital`',function(error,results,fields){
      res.send(results);
});
  
});



var data1;
var enddata1;
var data2;
var enddata2;
var data3;
var enddata3;
var data4;
var enddata4;
var data5;
var enddata5;
var data6;
var enddata6;
var data7;
var enddata7;
var data8;
var data9;
var enddata9;
var data10;
var enddata10;


app.post('/office',function(req,res){
    req.on('data',function(data){
      data1=data.toString('utf8');
      enddata1=JSON.parse(data1);
     //console.log(data1);
      
    });
    req.on('end',function(){
           pool.query({
              sql:'select * from  `office` where `Hname`=?',
              values:[enddata1.officeID]},
              function(error,results){
                //console.log(results);
                  res.send(results);
              });
    });
});

app.post('/doctorList',function(req,res){
    req.on('data',function(data){
      data2=data.toString('utf8');
      enddata2=JSON.parse(data2);
     // console.log(enddata2);
    });
    req.on('end',function(){
      pool.query({
      sql:'select `DoctorID`,`officeID`,`Dname`,`Ddirection`,`Hname`,`officeName`,`Pic`,`goods` from `doctor`,`office` where `DOid`=? and `officeID`=?',
      values:[enddata2.doctorID,enddata2.doctorID]},
      function(error,results){
          //console.log(results);
          res.send(results);
      });
    });
});

app.post('/doctor',function(req,res){

    req.on('data',function(data){
      data3=data.toString('utf8');
      enddata3=JSON.parse(data3);
    });
    req.on('end',function(){
      pool.query({sql:'select `DoctorID`,`officeID`,`Dname`,`Ddirection`,`specialty`,`orderNum`,`curreentNum`,`pic` from `doctor`,`office` where `DoctorID`=? and `officeID`=?',
      values:[enddata3.doctorID,enddata3.doctorID]},
      function(error,results){
          res.send(results);
      });
    });  
});

var office_ID,office_name,doc_name,Hname_ID,H_name;
app.post('/reservation_list',function(req,res){
    req.on('data',function(data){
      data4=data.toString('utf8');
      enddata4=JSON.parse(data4);
    });
    req.on('end',function(){
		    pool.query({sql:'select DOid,Dname,Pic from doctOr where DoctorID=?',
		      values:[enddata4.doctorID]},
		      function(error,results){
		        office_ID=results[0].DOid;
		        doc_name=results[0].Dname;
            doc_pic=results[0].Pic;
		        //console.log('科室ID：',office_ID,'医生id:',enddata4,'医生的名字：',doc_name);
		       
		        pool.query({sql:'select Hname,officeName from office where officeID=?',
				      values:[office_ID]},
				      function(error,results){
				      	Hname_ID=results[0].Hname; 
				      	office_name=results[0].officeName;
				      	//console.log('医院ID：',Hname_ID,'科室名字：',office_name);
				      	
				      	pool.query({sql:'select hospitalName from hospital where hospitalID=?',
					        values:[Hname_ID]},
  					      function(error,results){
  					        H_name=results[0].hospitalName;
  					        //console.log('医院名称:',H_name);
					        });    
		    		  });	        
		        res.send([{hID:Hname_ID,officeID:office_ID,doctorID:enddata4.doctorID,hname:H_name,officeName:office_name,docname:doc_name,pic:doc_pic}]);
		    });  
    });
});

app.post('/patient_get',function(req,res){
  req.on('data',function(data){
    data5=data.toString('utf8');
    enddata5=JSON.parse(data5);
    console.log(enddata5);
  });
  req.on('end',function(){
    pool.query({sql:'select * from patient where patientID=?',values:[enddata5.patientID]},function(error,results){
     // console.log(results);
      res.send(results);
    });
  });
});

var date01;
var date02;
app.post('/reservation_date',function(req,res){

  req.on('data',function(data){
     data6=data.toString('utf8');
    enddata6=JSON.parse(data6);

  });
  req.on('end',function(){
    pool.query({sql:'select DoctorDate from doctor where DoctorID=?',values:[enddata6.doctorID]},function(error,results){
      date01=results[0].DoctorDate;
      //console.log('预约日期ID:',results);
       pool.query({sql:'select date1,date2,date3,date4 from date where doctorDate_id=?',values:[date01]},function(error,results){
       // console.log('预约日期:',results);
        res.send(results);
      });
    });
  });
});

var name,card,page,ptel;
app.post('/add_patient',function(req,res){
  req.on('data',function(data){
    //console.log(data);
    data7=data.toString('utf8');
      enddata7=JSON.parse(data7);
    //console.log('=========');
    console.log(enddata7);
     userid=enddata7.userid;
     name=enddata7.name;
     card=enddata7.card;
     page=enddata7.page;
     ptel=enddata7.ptel;
     sex = enddata7.sex
  });
  req.on('end',function(){

    pool.query('insert into patient set?',{user_id:userid,patientName:name,IDcard:card,patientAge:page,patientTel:ptel,patientsex:sex},function(error,results){
      if(error) {throw error;}
      res.send(results);
    });
  });
});
var ruserid;
var rhosid;
var roffid;
var rdocid;
var rpatid;
var amount;
var rdate;
app.post('/add_reservation',function(req,res){
  req.on('data',function(data){
     data8=data.toString('utf8');
      enddata8=JSON.parse(data8);
      //console.log(typeof data8);
    //console.log(typeof enddata8);
    console.log(enddata8);
    ruserid=enddata8.Ruserid;
    rhosid=enddata8.Rhospital;
    rdocid=enddata8.Rdoctor;
    rpatid=enddata8.Rpatient;
    amount=enddata8.Ramount;
    rdate=enddata8.date;
  });
  req.on('end',function(){
    pool.query('insert into reservation set?',{Ruserid:ruserid,Rhospital:rhosid,Rdoctor:rdocid,Rpatient:rpatid,amount:amount,date:rdate},function(error,results){
        if(error) throw error;
        console.log(results.insertId);
        
          res.send('1');
      
    });
  });
});
var num;
var userTel;
var userPWD;
app.post('/add_user',function(req,res){

    req.on('data',function(data){
      data9=data.toString('utf8');
      enddata9=JSON.parse(data9);
      userTel=enddata9.userTel;
      userPWD=enddata9.passPWD;
      console.log('手机号码：',userTel);
      console.log('用户密码：',userPWD);
    });
     req.on('end',function(){
        pool.query({sql:'select userID from `user` where userTel=?',values:[userTel]},function(error,results,fields){
          var d1=results.toString('UTF8');
          
           if(d1===''){
             num='1';
            console.log('结果为空');
            pool.query('insert into user set?',{userTel:userTel,userPWD:userPWD},function(error,results){
              if(error) throw error;
              else{
                console.log(results);
               // console.log(results.insertId);
                res.end('1');
              }
            });
           } 
           else{
           console.log('已经有这个用户了');
           res.end('2');
           }
        });
     });  
});
var userTel1;
var userPWD1;
app.post('/validate_user',function(req,res){
  req.on('data',function(data){
      data10=data.toString('utf8');
      enddata10=JSON.parse(data10); 
      //console.log(enddata10);
      userTel1=enddata10.userTel;
      userPWD1=enddata10.userPWD;
     // console.log('手机号码：',userTel1);
      //console.log('用户密码：',userPWD1);
    });
     req.on('end',function(){
        pool.query({sql:'select userID from `user` where userTel=?',values:[userTel1]},function(error,results,fields){
          var d1=results.toString('UTF8');
          //console.log(d1.userID);
          
           if(d1===''){
            console.log('该用户没有注册');
            res.end('0');
           } 
           else{
            pool.query({sql:'select userID from `user` where userTel=? AND userPWD=?',values:[userTel1,userPWD1]},function(error,results){
              var d2=results.toString('utf8');
              //console.log(d2);
              if(d2===''){
                console.log('密码不正确');
                res.end('1')
              }
              else{
                console.log('用户名密码匹配');
                //res.end('2');
                //var userID = JSON.parse(results);
                res.send(results);
              }
            });
           
           }
        });
     });
});

app.get('/get_faction',function(req,res){
  pool.query('select * from `faction`',function(error,results,fields){
          res.send(results);
          //console.log(results);
            
  });
    
});
var data11;
var enddata11;
var data12;
var enddata12;
app.post('/clique',function(req,res){
    req.on('data',function(data){
      data11=data.toString('utf8');
      enddata11=JSON.parse(data11);
    });
    req.on('end',function(){
           pool.query({
              sql:'select * from  `clique` where `Cfactionid`=?',
              values:[enddata11.cliqueID]},
              function(error,results){
                //console.log(results);
                  res.send(results);
              });
    });
});

app.post('/cliquecomment',function(req,res){

    req.on('data',function(data){
      data12=data.toString('utf8');
      enddata12=JSON.parse(data12);
      //console.log(enddata12);
    });
    req.on('end',function(){
      pool.query({sql:'select `cliqueCommentID`,`cliqueID`,`cliqueArticle`,`commentArtile`,`cliqueName`,`visited`,`commentdate`,`cimage` from `cliquecomment`, `clique` where  `cliqueCommentID`=? and `cliqueID`=?',
      values:[enddata12.cliqueCommentID,enddata12.cliqueCommentID]},
      function(error,results){
          res.send(results);
          //console.log(results);
          console.log(enddata12.cliqueCommentID);
      });
    });  
});
var data14;
var enddata14;
app.post('/cliqueuser',function(req,res){

    req.on('data',function(data){
      data14=data.toString('utf8');
      enddata14=JSON.parse(data14);
      console.log(enddata14);
    });
    req.on('end',function(){
      pool.query({sql:'SELECT `cliqueCommentID`,`commentdate`,`commentArtile`,`username`,`userPhoto` from `cliquecomment`,`user` where `commentclique`=? and `cuserid`=`userID`',
      values:[enddata14.cliqueCommentID,enddata14.userID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var data13;
var enddata13;
app.post('/knowledge',function(req,res){
    req.on('data',function(data){
      data13=data.toString('utf8');
      enddata13=JSON.parse(data13);
      console.log(enddata13);
    });
    req.on('end',function(){
           pool.query({
              sql:'select * from  `knowledge` where `knowledgeType`=?',
              values:[enddata13.knowledegTypeID]
            },
              function(error,results){
                //console.log(results);
                  res.send(results);
              });
    });
});
var data19;
var enddaata19;
app.post('/knowledgecontent',function(req,res){
    req.on('data',function(data){
      data19=data.toString('utf8');
      enddata19=JSON.parse(data19);
      console.log(enddata19);
    });
    req.on('end',function(){
           pool.query({
              sql:'select * from  `knowledge` where `knowledgeTypeID`=?',
              values:[enddata19.knowledegTypeID]
            },
              function(error,results){
                //console.log(results);
                  res.send(results);
              });
    });
});
var data20;
var enddata20;
app.post('/add_knowledgecomment',function(req,res){
  req.on('data',function(data){
    //console.log(data);
    data15=data.toString('utf8');
      enddata15=JSON.parse(data15);
    //console.log('=========');
    console.log(data15);
     userid=enddata15.userid;
     content=enddata15.content;
     kid=enddata15.kid;
     date = enddata15.date;
  });
  req.on('end',function(){

    pool.query('insert into knowledgecomment set?',{commentUser:userid,commentContent:content,knowcomid:kid,date:date},function(error,results){
      if(error) throw error;
      console.log(results.insertId);
      //var d1=qs.parse(results.toString('UTF8')); 
      res.send(results);
    });
  });
});
var data18;
var enddata18;
app.post('/knowledgecomment',function(req,res){
    req.on('data',function(data){
      data18=data.toString('utf8');
      enddata18=JSON.parse(data18);
      
    });
    req.on('end',function(){
           pool.query({
              sql:'select `knowcomid`,`commentContent`,`date`,`cardCommentID`,`username`,`userPhoto` from `user`,`knowledgecomment` where `knowcomid`=? and `commentUser` =`userID`',
              values:[enddata18.knowledegTypeID,enddata18.userID]
            },
              function(error,results){
                //console.log(results);
                  res.send(results);
              });
    });
});
app.get('/knowledgetype',function(req,res){
  pool.query('select * from `knowtype`',function(error,results,fields){
          res.send(results);
          //console.log(results);         
  });
    
});
var data15;
var enddata15;
var cid,content,userid;
app.post('/add_comment',function(req,res){
  req.on('data',function(data){
    //console.log(data);
    data15=data.toString('utf8');
      enddata15=JSON.parse(data15);
    //console.log('=========');
    console.log(data15);
     userid=enddata15.userid;
     content=enddata15.content;
     cid=enddata15.cid;
     date=enddata15.date;

  });
  req.on('end',function(){

    pool.query('insert into cliquecomment set?',{cuserid:userid,commentArtile:content,commentclique:cid,cdate:date},function(error,results){
      if(error) throw error;
      console.log(results.insertId);
      //var d1=qs.parse(results.toString('UTF8')); 
      res.send(results);
    });
  });
});

var data16;
var enddata16;
app.post('/question',function(req,res){

    req.on('data',function(data){
      data16=data.toString('utf8');
      enddata16=JSON.parse(data16);
      console.log(enddata16);
    });
    req.on('end',function(){
      pool.query({sql:'SELECT `questionID`,`qdirection`,`time`,`illnessName` from `illnesstype`,`question` where `diseaseTypeId` = `illnessID`',
      values:[enddata16.questionID,enddata16.questionID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var ddata16;
var denddata16;
app.post('/dquestion',function(req,res){

    req.on('data',function(data){
      ddata16=data.toString('utf8');
      denddata16=JSON.parse(ddata16);
      console.log(enddata16);
    });
    req.on('end',function(){
      pool.query({sql:'SELECT `questionID`,`qdirection`,`time`,`illnessName` from `illnesstype`,`question` where `diseaseTypeId` = `illnessID`',
      values:[denddata16.questionID,denddata16.questionID]},
      function(error,results){
          res.send(results);
      });
    });  
});

var data17;
var enddata17;
app.post('/add_question',function(req,res){
  req.on('data',function(data){
    //console.log(data);
    data17=data.toString('utf8');
      enddata17=JSON.parse(data17);
    //console.log('=========');
    console.log(enddata17);
     userid=enddata17.userid;
     sex=enddata17.sex;
     age=enddata17.age;
     diseasetype=enddata17.diseasetype;
     diseasepic = enddata17.diseasepic;
    direction = enddata17.direction;
    date=enddata17.date;
  });
  req.on('end',function(){

    pool.query('insert into question set?',{quid:userid,qsex:sex,qage:age,diseaseTypeId:diseasetype,diseasePic:diseasepic,qdirection:direction,time:date},function(error,results){
      if(error) throw error;
      console.log(results.insertId);
      //var d1=qs.parse(results.toString('UTF8')); 
      res.send('1');
    });
  });
});
var ddata17;
var denddata17;
app.post('/add_dquestion',function(req,res){
  req.on('data',function(data){
    //console.log(data);
    ddata17=data.toString('utf8');
      denddata17=JSON.parse(ddata17);
    //console.log('=========');
    console.log(enddata17);
     qdid = denddata17.qdid;
     userid=denddata17.userid;
     sex=denddata17.sex;
     age=denddata17.age;
     //diseasetype=denddata17.diseasetype;
     diseasepic = denddata17.diseasepic;
    direction = denddata17.direction;
    date = denddata17.date;
  });
  req.on('end',function(){

    pool.query('insert into dquestion set?',{Qdid:qdid,Quid:userid,Qsex:sex,Qage:age,DiseasePic:diseasepic,Qdirection:direction,Time:date},function(error,results){
      if(error) throw error;
      console.log(results.insertId);
      //var d1=qs.parse(results.toString('UTF8')); 
      res.send('1');
    });
  });
});
app.get('/illnesstype',function(req,res){
  pool.query('select * from `illnesstype`',function(error,results,fields){
          res.send(results);
          //console.log(results);
            
  });
    
});
var data20;
var enddata20;
app.post('/update_user',function(req,res){
  req.on('data',function(data){
    //console.log(data);
    data20=data.toString('utf8');
      enddata20=JSON.parse(data20);
    //console.log('=========');
    console.log(enddata20);
     userid=enddata20.userid;
     sex=enddata20.sex;
     age=enddata20.age;
    tel = enddata20.tel;
    name = enddata20.name;
    address = enddata20.address;
  });
  req.on('end',function(){

    pool.query('insert into question set?',{quid:userid,qsex:sex,qage:age,diseaseTypeId:diseasetype,diseasePic:diseasepic,qdirection:direction},function(error,results){
      if(error) throw error;
      console.log(results.insertId);
      //var d1=qs.parse(results.toString('UTF8')); 
      res.send('1');
    });
  });
});
var data21;
var enddata21;
app.post('/getpatient',function(req,res){

    req.on('data',function(data){
      data21=data.toString('utf8');
      enddata21=JSON.parse(data21);
      console.log(enddata21);
    });
    req.on('end',function(){
      pool.query({sql:'select `userID`, `patientID`,`IDcard`,`patientName`,`patientsex`,`patientAge` from `user`,`patient` where `user_id`=? and `userID`=?',
      values:[enddata21.userID,enddata21.userID]},
      function(error,results){
          res.send(results);
      });
    });  
});

var data22;
var enddata22;
app.post('/getquestion',function(req,res){

    req.on('data',function(data){
      data22=data.toString('utf8');
      enddata22=JSON.parse(data22);
      console.log(enddata22);
    });
    req.on('end',function(){
      pool.query({sql:'select `questionID`,`userID`,`time`,`qdirection` from `question`,`user` where `quid`=? and `userID`=?',
      values:[enddata22.userID,enddata22.userID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var ddata22;
var denddata22;
app.post('/getdquestion',function(req,res){

    req.on('data',function(data){
      ddata22=data.toString('utf8');
      denddata22=JSON.parse(ddata22);
      console.log(denddata22);
    });
    req.on('end',function(){
      pool.query({sql:'select `QuestionID`,`userID`,`Qdirection`,`username`,`Time`,`Dname`,`officeName` from `dquestion`,`user`,`doctor`,`office` where `Qdid`=`DoctorID` and `userID`=`Quid` and `DOid`=`officeID` and `userID`=?',
      values:[denddata22.userID,denddata22.userID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var data23;
var enddata23;
app.post('/getreservation',function(req,res){

    req.on('data',function(data){
      data23=data.toString('utf8');
      enddata23=JSON.parse(data23);
      console.log(enddata23);

    });
    req.on('end',function(){
      pool.query({sql:'select `reservationID`,`patientID`,`Ruserid`,`patientName`,`hospitalName`,`Dname`,`patientTel`,`IDcard`,`date` from `patient`,`reservation`,`doctor`,`hospital`,`user` where `Ruserid`=? and `Ruserid`=`userID` and `Rhospital`=`hospitalID` and 	`Rdoctor` = `DoctorID` and `Rpatient`=`patientID` ',
      values:[enddata23.Ruserid,enddata23.Ruserid]},
      function(error,results){
          res.send(results);
      });
    });  
});
var rdata23;
var renddata23;
app.post('/rdetail',function(req,res){

    req.on('data',function(data){
      rdata23=data.toString('utf8');
      renddata23=JSON.parse(rdata23);
      console.log(renddata23);

    });
    req.on('end',function(){
      pool.query({sql:'select `reservationID`,`patientID`,`Ruserid`,`patientName`,`hospitalName`,`Dname`,`patientTel`,`IDcard`,`date` from `patient`,`reservation`,`doctor`,`hospital`,`user` where `reservationID`=? and `Ruserid`=`userID` and `Rhospital`=`hospitalID` and 	`Rdoctor` = `DoctorID` and `Rpatient`=`patientID` ',
      values:[renddata23.reservationID,renddata23.reservationID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var ddata23;
var denddata23;
app.post('/ddetail',function(req,res){

    req.on('data',function(data){
      ddata23=data.toString('utf8');
      denddata23=JSON.parse(ddata23);
      console.log(denddata23);

    });
    req.on('end',function(){
      pool.query({sql:'delete from reservation where reservationID=?',
      values:[denddata23.reservationID,denddata23.reservationID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var data24;
var enddata24;
app.post('/getuser',function(req,res){

    req.on('data',function(data){
      data24=data.toString('utf8');
      enddata24=JSON.parse(data24);
      console.log(enddata24);
    });
    req.on('end',function(){
      pool.query({sql:'select * from `user` where `userID`=?',
      values:[enddata24.userID]},
      function(error,results){
          res.send(results);
      });
    });  
});
var data25;
var enddata25;
app.post('/changepatient',function(req,res){

    req.on('data',function(data){
      data25=data.toString('utf8');
      enddata25=JSON.parse(data25);
      console.log(enddata25);
       name=enddata25.name;
       sex=enddata25.sex;
       age=enddata25.age;
       tel = enddata25.tel;
       id = enddata25.id;
       pid=enddata25.pid;
    });
    req.on('end',function(){
      pool.query("update patient set patientName = '"+ name +"',patientsex = '"+ sex +"',patientAge = '"+ age +"',patientTel = '"+ tel +"',IDcard = '"+ id +"'  WHERE patientID = '"+ pid +"' ",function(error,results){
         if(error) throw error;
          //console.log(results.insertId);
          res.send(results);
      });
    });  
});
var data26;
var enddata26;
app.post('/deletepatient',function(req,res){

    req.on('data',function(data){
      data26=data.toString('utf8');
      enddata26=JSON.parse(data26);
      console.log(enddata26);
    });
    req.on('end',function(){
      pool.query({sql:'delete from patient  where patientID = ?',values:[enddata26.patientID]},function(error,results){
         if(error) throw error;
          console.log(results.insertId);
          res.send(results);
      });
    });  
});
var data27;
var enddata27;
var data28;
var enddata28;
var data29;
var enddata29;
var daat30;
var enddata30;
app.post('/changetel',function(req,res){

    req.on('data',function(data){
      data27=data.toString('utf8');
      enddata27=JSON.parse(data27);
      console.log(enddata27);
       tel = enddata27.tel;
       id=enddata27.id;
    });
    req.on('end',function(){
    	if(tel==''){
    		pool.query('insert into user set userTel = "' + tel+ '"  WHERE userID="' + id + '"',function(error,results){
             if(error) throw error;
             //console.log(results.insertId);
             res.send('1');
           });
    	}else{
    		pool.query('update user set userTel = "' + tel+ '"  WHERE userID="' + id + '"',function(error,results){
         	if(error) throw error;
          	//console.log(results.insertId);
          	res.send('2');
      		});
    	}
      
    });  
});
app.post('/changename',function(req,res){

    req.on('data',function(data){
      data28=data.toString('utf8');
      enddata28=JSON.parse(data28);
      console.log(enddata28);
       name = enddata28.name;
       id=enddata28.id;
    });
    req.on('end',function(){
    	if(name==''){
    		pool.query('insert into user set username = "' + name+ '"  WHERE userID="' + id + '"',function(error,results){
             if(error) throw error;
             //console.log(results.insertId);
             res.send('1');
           });
    	}else{
    		pool.query('update user set username = "' + name+ '"  WHERE userID="' + id + '"',function(error,results){
         	if(error) throw error;
          	//console.log(results.insertId);
          	res.send('2');
      		});
    	}
      
    });  
});
app.post('/changesex',function(req,res){

    req.on('data',function(data){
      data29=data.toString('utf8');
      enddata29=JSON.parse(data29);
      console.log(enddata29);
       sex = enddata29.sex;
       id=enddata29.id;
    });
    req.on('end',function(){
    	if(sex==''){
    		pool.query('insert into user set userSex = "' + sex+ '"  WHERE userID="' + id + '"',function(error,results){
             if(error) throw error;
             //console.log(results.insertId);
             res.send('1');
           });
    	}else{
    		pool.query('update user set userSex = "' + sex + '"  WHERE userID="' + id + '"',function(error,results){
         	if(error) throw error;
          	//console.log(results.insertId);
          	res.send('2');
      		});
    	}
      
    });  
});
app.post('/changeaddress',function(req,res){

    req.on('data',function(data){
      data30=data.toString('utf8');
      enddata30=JSON.parse(data30);
      console.log(enddata30);
       address = enddata30.address;
       id=enddata30.id;
    });
    req.on('end',function(){
    	if(address==''){
    		pool.query('insert into user set userAddress = "' + address+ '"  WHERE userID="' + id + '"',function(error,results){
             if(error) throw error;
             //console.log(results.insertId);
             res.send('1');
           });
    	}else{
    		pool.query('update user set userAddress = "' + address + '"  WHERE userID="' + id + '"',function(error,results){
         	if(error) throw error;
          	//console.log(results.insertId);
          	res.send('2');
      		});
    	}
      
    });  
});
app.listen(8080);
