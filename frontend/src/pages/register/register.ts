import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { AlertController } from 'ionic-angular';
import { HttpModule,JsonpModule } from "@angular/http";
import { Http,Jsonp,Headers } from "@angular/http";  
@IonicPage()
@Component({
  selector: 'page-register',
  templateUrl: 'register.html',
})
export class RegisterPage {
 
  constructor(public navCtrl: NavController, public navParams: NavParams ,private alertCtrl: AlertController ,public http:Http,public jsonp:Jsonp) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegisterPage');
  }

  userid;
  pas;
  rpas;
 

  showPrompt1() {
    let prompt = this.alertCtrl.create({
      title: '手机号',
      message: "请输入正确的手机号",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   
   
   showPrompt2() {
     let prompt = this.alertCtrl.create({
       title: '密码',
       message: "请输入不少于6位的密码",
    
       buttons: ["关闭"]
     });
      prompt.present();
    }
    
    showPrompt3() {
     let prompt = this.alertCtrl.create({
       title: '重复密码',
       message: "密码不一致！",
    
       buttons: ["关闭"]
     });
      prompt.present();
    }

    showPrompt4() {
      let prompt = this.alertCtrl.create({
        title: '注册',
        message: "该手机号已经注册过 ！",
     
        buttons: ["关闭"]
      });
       prompt.present();
     }
 
    user(){
      if(this.userid =='' || this.userid.length!=11){
        this.showPrompt1();
    }
    }
    pass(){
       if(this.pas=='' || this.pas.length<6){
       this.showPrompt2();
       }
    }
    rpass(){
      if(this.rpas!=this.pas){
        this.showPrompt3();
      }
    }
  
 

headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
userTel;
passPWD;
register(){
    if(this.userid==='' || this.pas==='' || this.rpas===''){
     return;
    }
    console.log(this.userid);

   this.http.post( 'http://192.168.23.2:8080/add_user',JSON.stringify({userTel:this.userid,passPWD:this.pas}), {headers:this.headers} ).map(data=>data.json()).subscribe( 
       
    (data) => {
  
      if(data==2){
       this.showPrompt4();
       console.log(data);
      } else{
        this.navCtrl.push('LoginPage');
      }
    } 
    );
  //this.navCtrl.push('LoginPage');

}



login(){
  this.navCtrl.push('LoginPage');
}
}










