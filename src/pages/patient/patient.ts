import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams ,ViewController} from 'ionic-angular';
import {MePage} from '../../pages/me/me';
import { Http,Jsonp, Headers} from '@angular/http';  
@IonicPage()
@Component({
  selector: 'page-patient',
  templateUrl: 'patient.html',
})
export class PatientPage {

  constructor(public viewCtrl: ViewController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ionViewDidLoad() {
   
  }
  arr1=[];
  ngOnInit(){
    var user = localStorage.getItem('user');
    console.log(user);
    this.http.post('http://localhost:8080/getpatient',JSON.stringify({userID:user}), {headers:this.headers}).subscribe(
      data=>{
        this.arr1=JSON.parse(data['_body']);
        //this.arr1.length=7;
        console.log(JSON.parse(data['_body']));
      }
    );
  }
 add(){
    this.navCtrl.push('AddpPage');
  }
  back(){
    this.viewCtrl.dismiss();
  }

}
