import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http'; 
import { ModalController } from 'ionic-angular';
/**
 * Generated class for the OrderPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-order',
  templateUrl: 'order.html',
})
export class OrderPage {

  constructor(public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr1=[];
  relationship;
  ngOnInit(){
    var user = localStorage.getItem('user');
    console.log(user);
    this.http.post('http://192.168.23.2:8080/getreservation',JSON.stringify({Ruserid:user}), {headers:this.headers}).subscribe(
      data=>{
        console.log(data);
        this.arr1=JSON.parse(data['_body']);
        console.log(this.arr1);
        console.log(data);
        //this.arr1.length=7;
        //console.log(JSON.parse(data['_body']));
        //console.log(this.arr1.patientID);
      }
    );
 
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad OrderPage');
  }
  detail(){
    console.log(this.relationship);
    let profileModal = this.modalCtrl.create('DetailPage',{reservationID:this.relationship});
    profileModal.present(); 
  }
  back(){
    this.viewCtrl.dismiss();
  }
}
