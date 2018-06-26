import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http'; 
import { AlertController } from 'ionic-angular';
/**
 * Generated class for the TelephonePage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-telephone',
  templateUrl: 'telephone.html',
})
export class TelephonePage {

  constructor(private alertCtrl: AlertController ,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams,public viewCtrl: ViewController) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad TelephonePage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
  arr=[];
  tel;
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );

  showPrompt1() {
    let prompt = this.alertCtrl.create({
      title: '我的电话',
      message: "添加成功！",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   
   
   showPrompt2() {
     let prompt = this.alertCtrl.create({
       title: '我的电话',
       message: "修改成功！",
    
       buttons: ["关闭"]
     });
      prompt.present();
    }
    
    showPrompt3() {
     let prompt = this.alertCtrl.create({
       title: '我的电话',
       message: "出错啦！",
    
       buttons: ["关闭"]
     });
      prompt.present();
    }

  ngOnInit(){
    var user = localStorage.getItem('user');
    
    this.http.post('http://192.168.23.2:8080/getuser',JSON.stringify({userID:user}), {headers:this.headers}).subscribe( 
       
      (data) => {
        //console.log(data);
        this.arr=JSON.parse(data['_body']);
         console.log(this.arr);
   
      }
    );
    console.log(this.tel);
  }
  submit(){
    var user = localStorage.getItem('user');

    this.http.post('http://192.168.23.2:8080/changetel',JSON.stringify({id:user,tel:this.tel}), {headers:this.headers}).map(data=>data.json()).subscribe( 
       
      (data) => {
     console.log(data);
        if(data==1){
           // this.showPrompt1();
            this.navCtrl.push('MessagePage');
           
        } else if(data==2){
         // this.showPrompt2();
          this.navCtrl.push('MessagePage');
        }
        else{
          this.showPrompt3();
        }
      } 
      );
  
  }
}
