import { Component } from '@angular/core';
import {  IonicPage, NavController, NavParams,ViewController} from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
/**
 * Generated class for the CommentPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-addp',
  templateUrl: 'addp.html',
})
export class AddpPage {

  constructor(public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams,public http:Http ,public jsonp:Jsonp) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad AddpPage');
  }
  arr=[];
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  //factionName;
    /* ngOnInit(){
      
  
      this.http.post('http://localhost:8080/add_patient',JSON.stringify({}),{headers:this.headers}).subscribe(
        data=>{
          console.log(JSON.parse(data['_body']));
          this.arr=JSON.parse(data['_body']);
          //this.factionName=this.arr[0].factionName;
         
        }
      )
    }  */
    back(){
      this.viewCtrl.dismiss();
     
    } 
}
