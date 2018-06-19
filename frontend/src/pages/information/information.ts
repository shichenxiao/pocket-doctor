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
 
    aname(){
      if(this.xingming==''){
        this.showPrompt1();
    }
    }
    aid(){
       if(this.id=='' || this.id.length!=18){
       this.showPrompt2();
       }
    }
    aphone(){
      if(this.phone== '' || this.phone.length!=11){
        this.showPrompt3();
      }
    }
    aage(){
      if(this.age== '' || this.age.length>3){
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
    add(){
         if(this.xingming==='' || this.id==='' || this.phone==='' || this.age===''){
         return;
        }
      var user = localStorage.getItem('user');
    //console.log(this.xingming);
    //console.log(this.id);
    //console.log(this.age);
    //console.log(user);
   // console.log
  localStorage.setItem('name',this.xingming);
   localStorage.setItem('card',this.id);
   localStorage.setItem('ptel',this.phone);
  localStorage.setItem('page',this.age);
      this.http.post( 'http://localhost:8080/add_patient',JSON.stringify({userid:user,name:this.xingming,card:this.id,page:this.age,ptel:this.phone}), {headers:this.headers} ).subscribe( 
        
       (data) => {
          this.arr=JSON.parse(data['_body']);
        
         //console.log(data);    
         //console.log(data);  
         console.log(this.arr);  
         //console.log(this.arr[0].insertId);
          //this.viewCtrl.dismiss();
           this.navCtrl.push('SelectPage')
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
