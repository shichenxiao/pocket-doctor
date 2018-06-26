import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
/**
 * Generated class for the AskPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-ask',
  templateUrl: 'ask.html',
})
export class AskPage {

  constructor(public http:Http ,public jsonp:Jsonp,public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ionViewDidLoad() {
    console.log('ionViewDidLoad AskPage');
  }
  arr1=[];
  arr=[];
  ngOnInit(){
    var user = localStorage.getItem('user');
    console.log(user);
    this.http.post('http://192.168.23.2:8080/getdquestion',JSON.stringify({userID:user}), {headers:this.headers}).subscribe(
      data=>{
        this.arr=JSON.parse(data['_body']);
        //this.arr1.length=7;
        console.log(JSON.parse(data['_body']));
      }
    );
    this.http.post('http://192.168.23.2:8080/getquestion',JSON.stringify({userID:user}), {headers:this.headers}).subscribe(
      data=>{
        this.arr1=JSON.parse(data['_body']);
        //this.arr1.length=7;
        console.log(JSON.parse(data['_body']));
      }
    );
  }
  back(){
    this.viewCtrl.dismiss();
  }
}

