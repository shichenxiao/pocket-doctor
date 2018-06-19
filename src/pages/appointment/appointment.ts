import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';

/**
 * Generated class for the AppointmentPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-appointment',
  templateUrl: 'appointment.html',
})
export class AppointmentPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr=[];
  doctorID='';
  name;
card;
ptel;
page;
hospital;
date;
  ngOnInit(){
    this.name=localStorage.getItem('name');
    this.card=localStorage.getItem('card');
    this.ptel=localStorage.getItem('ptel');
    this.page=localStorage.getItem('page');
    this.hospital = localStorage.getItem('hospitalName');
    this.date = localStorage.getItem('date');
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad AppointmentPage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
  wancheng(){
    this.viewCtrl.dismiss();
  }
}
