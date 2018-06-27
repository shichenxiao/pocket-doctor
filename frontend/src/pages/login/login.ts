
import { Component } from '@angular/core';
import { IonicPage, App,NavController, NavParams} from 'ionic-angular';
// ,ViewChild
// ,ViewController
import { AlertController } from 'ionic-angular';
import { HttpModule,JsonpModule } from "@angular/http";
import { Http,Jsonp,Headers } from "@angular/http";  

import { HomePage } from '../../pages/home/home';
import { ModalController } from 'ionic-angular';
import { TabsPage } from '../../pages/tabs/tabs';
@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {
  // private alertCtrl: AlertController, ,public http:Http,public jsonp:Jsonp
  constructor(public app:App,public modalCtrl:ModalController,public navCtrl: NavController, public navParams: NavParams,private alertCtrl: AlertController ,public http:Http,public jsonp:Jsonp) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }

headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
userid;
pas;

showPrompt0() {
 let prompt = this.alertCtrl.create({
   title: '登录',
   message: "用户名不存在",

   buttons: ["关闭"]
 });
  prompt.present();
}

showPrompt1() {
  let prompt = this.alertCtrl.create({
    title: '登录',
    message: "密码不正确",
 
    buttons: ["关闭"]
  });
   prompt.present();
 }
arr=[];
 userID='';
login(){
    if(this.userid==='' || this.pas===''){
     return;
    }
    
    //let userID =this.navParams.get('userID');
    //console.log(userID);

   this.http.post('http://192.168.23.2:8080/validate_user',JSON.stringify({userTel:this.userid,userPWD:this.pas}), {headers:this.headers} )
   .map(data=>data.json()).subscribe( 
       
    (data) => {
     
      if(data==0){
       this.showPrompt0();
      }
      else if(data==1){
        this.showPrompt1();
      }else if(localStorage.getItem("user") == data[0].userID){
        this.navCtrl.push(TabsPage);
        this.app.getRootNavs()[0].setRoot(TabsPage);
      }else{
        localStorage.setItem('user',data[0].userID);
       this.navCtrl.push(TabsPage);
        this.app.getRootNavs()[0].setRoot(TabsPage);
      }
    
    } 
    );
   
  //this.navCtrl.push( HomePage);

}



  register(){
    this.navCtrl.push('RegisterPage');
  }

}
