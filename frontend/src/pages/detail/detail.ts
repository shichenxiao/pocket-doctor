import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http'; 


@IonicPage()
@Component({
  selector: 'page-detail',
  templateUrl: 'detail.html',
})
export class DetailPage {

  constructor(public http:Http ,public jsonp:Jsonp,public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
  
  }
  back(){
    this.viewCtrl.dismiss();
  }
  reservationID;
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr1=[];
  ngOnInit(){
    var user = localStorage.getItem('user');
    console.log(user);
    this.reservationID =this.navParams.get('reservationID');
    this.http.post('http://192.168.23.2:8080/rdetail',JSON.stringify({reservationID:this.reservationID}), {headers:this.headers}).subscribe(
      data=>{
        console.log(data);
        this.arr1=JSON.parse(data['_body']);
        console.log(this.arr1);
        //this.arr1.length=7;
        //console.log(JSON.parse(data['_body']));
        //console.log(this.arr1.patientID);
      }
    );
 
  }
  delete(){
    this.reservationID =this.navParams.get('reservationID');
    this.http.post('http://192.168.23.2:8080/ddetail',JSON.stringify({reservationID:this.reservationID}), {headers:this.headers}).subscribe(
      data=>{
        console.log(data);
        this.navCtrl.push('OrderPage');
        //this.arr1.length=7;
        //console.log(JSON.parse(data['_body']));
        //console.log(this.arr1.patientID);
      }
    );
  }
}
