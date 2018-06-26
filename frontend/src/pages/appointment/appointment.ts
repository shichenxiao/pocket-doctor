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
id;
officeName;
  ngOnInit(){
    this.officeName = localStorage.getItem('officeName');
    this.hospital = localStorage.getItem('hospitalName');
    this.id = this.navParams.get('id');
    this.date = this.navParams.get('date');
    console.log(this.id);
    this.http.post('http://192.168.23.2:8080/patient_get',JSON.stringify({patientID:this.id}), {headers:this.headers}).subscribe(
      data=>{
        this.arr=JSON.parse(data['_body']);
        console.log(data);
        console.log(this.arr);
       //console.log(data);
        //console.log(this.arr1[0].hID);
        //var hid = localStorage.setItem('hid',this.arr[0].hID);
        
        //var docname = localStorage.setItem('docname',this.arr[0].docname);
      }
    );
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
