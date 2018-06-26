import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';
import { AlertController } from 'ionic-angular';
import { HttpModule,JsonpModule } from "@angular/http";


/**
 * Generated class for the InformationPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-information',
  templateUrl: 'information.html',
})
export class InformationPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams,private alertCtrl: AlertController ) {
  }

  xingming;
  id;
  age;
  phone;
  showPrompt1() {
    let prompt = this.alertCtrl.create({
      title: '姓名',
      message: "请输入正确的姓名",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   
   
   showPrompt2() {
     let prompt = this.alertCtrl.create({
       title: '身份证号码',
       message: "请输入正确的身份证号码",
    
       buttons: ["关闭"]
     });
      prompt.present();
    }
    
    showPrompt3() {
     let prompt = this.alertCtrl.create({
       title: '手机号',
       message: "请输入正确的手机号码",
    
       buttons: ["关闭"]
     });
      prompt.present();
    }

    showPrompt4() {
      let prompt = this.alertCtrl.create({
        title: '年龄',
        message: "请输入正确的年龄",
     
        buttons: ["关闭"]
      });
       prompt.present();
     }
     showPrompt5() {
      let prompt = this.alertCtrl.create({
        title: '身份证号',
        message: "身份证格式错误",
     
        buttons: ["关闭"]
      });
       prompt.present();
     }
     showPrompt6() {
      let prompt = this.alertCtrl.create({
        title: '手机号',
        message: "不能含有字母",
     
        buttons: ["关闭"]
      });
       prompt.present();
     }
 
    aname(){
      if(this.xingming==''){
        this.showPrompt1();
    }
    }
    aid(){
      var rge2=/[a-z]{2,}/gi;
	    var rge3=/[\u4E00-\u9FA5]+/g;
	    if(this.id.length != 18){
        this.showPrompt2();
	}
	else if(rge2.test(this.id) ||rge3.test(this.id)){
		this.showPrompt5();
		
	}

    }
    aphone(){
      var rge1= /[A-Z]/gi;
      if(rge1.test(this.phone)){
            this.showPrompt6();
    
          }else if(this.phone.length <11){
           this.showPrompt3();
          }
    }
    aage(){
      var rge4=/[a-z\u4E00-\u9FA5a-z]/gi;
	if(rge4.test(this.age) || this.age.length>3 || this.age.length<1){
		this.showPrompt4();
	}
    }
    headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
    userid;
    name;
    card;
    page;
    ptel;  
    arr=[];
    arr1=[];
    sex;
    add(){
         if(this.xingming==='' || this.id==='' || this.phone==='' || this.age===''||this.sex===''){
         return;
        }
      var user = localStorage.getItem('user');
    //console.log(this.xingming);
    //console.log(this.id);
    //console.log(this.age);
    //console.log(user);
    console.log(this.sex);
   // console.log
  localStorage.setItem('name',this.xingming);
   localStorage.setItem('card',this.id);
   localStorage.setItem('ptel',this.phone);
  localStorage.setItem('page',this.age);
      this.http.post( 'http://192.168.23.2:8080/add_patient',JSON.stringify({userid:user,name:this.xingming,card:this.id,page:this.age,ptel:this.phone,sex:this.sex}), {headers:this.headers} ).subscribe( 
        
       (data) => {
          this.arr=JSON.parse(data['_body']);
        
         //console.log(data);    
         //console.log(data);  
         console.log(this.arr);  
         //console.log(this.arr[0].insertId);
          //this.viewCtrl.dismiss();
          var doctorID =this.navParams.get('doctorID');
           this.navCtrl.push('SelectPage',{doctorID:doctorID});
          } 
         //this.navCtrl.push('ReservationPage');
      )};
  
  

  ionViewDidLoad() {
    console.log('ionViewDidLoad InformationPage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
}
