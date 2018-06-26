import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams ,ViewController} from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { AlertController } from 'ionic-angular';

/**
 * Generated class for the PhotoPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-photo',
  templateUrl: 'photo.html',
})
export class PhotoPage {

  constructor(private alertCtrl: AlertController,public http:Http ,public jsonp:Jsonp,public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad PhotoPage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
  name;
  age;
  sex;
  tel;
  id;
  arr1=[];
patient;
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ngOnInit(){
    
  }
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
      if(this.name==''){
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
      if(rge1.test(this.tel)){
            this.showPrompt6();
    
          }else if(this.tel.length <11){
           this.showPrompt3();
          }
    }
    aage(){
      var rge4=/[a-z\u4E00-\u9FA5a-z]/gi;
	if(rge4.test(this.age) || this.age.length>3 || this.age.length<1){
		this.showPrompt4();
	}
    }
  add(){
    this.patient = this.navParams.get('patient');
    this.http.post('http://192.168.23.2:8080/changepatient',JSON.stringify({name:this.name,age:this.age,sex:this.sex,tel:this.tel,id:this.id,patientID:this.patient}), {headers:this.headers}).map(data=>data.json()).subscribe( 
       
      (data) => {
        console.log(data);
       // this.arr1=JSON.parse(data['_body']);
      // console.log(this.arr1);   
      }
    );
  }
}
