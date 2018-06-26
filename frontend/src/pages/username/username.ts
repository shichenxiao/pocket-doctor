import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http'; 
import { AlertController } from 'ionic-angular';

/**
 * Generated class for the UsernamePage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-username',
  templateUrl: 'username.html',
})
export class UsernamePage {

  constructor(private alertCtrl: AlertController ,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams,public viewCtrl: ViewController) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad UsernamePage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
  arr=[];
  name;
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ngOnInit(){
    var user = localStorage.getItem('user');
    
    this.http.post('http://192.168.23.2:8080/getuser',JSON.stringify({userID:user}), {headers:this.headers}).subscribe( 
       
      (data) => {
        //console.log(data);
        this.arr=JSON.parse(data['_body']);
         console.log(this.arr);
   
      }
    );
    console.log(this.name);
  }
  submit(){
    var user = localStorage.getItem('user');

    this.http.post('http://192.168.23.2:8080/changename',JSON.stringify({id:user,name:this.name}), {headers:this.headers}).map(data=>data.json()).subscribe( 
       
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
        //this.showPrompt3();
        }
      } 
      );
  
  }

}
