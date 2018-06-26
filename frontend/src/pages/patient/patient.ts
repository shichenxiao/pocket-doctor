import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams ,ViewController} from 'ionic-angular';
import {MePage} from '../../pages/me/me';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';
@IonicPage()
@Component({
  selector: 'page-patient',
  templateUrl: 'patient.html',
})
export class PatientPage {

  constructor(public modalCtrl:ModalController,public viewCtrl: ViewController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ionViewDidLoad() {
   
  }
  arr1=[];
  patient;
  relationship;
  ngOnInit(){
    var user = localStorage.getItem('user');
    console.log(user);
    this.http.post('http://192.168.23.2:8080/getpatient',JSON.stringify({userID:user}), {headers:this.headers}).subscribe(
      data=>{
        this.arr1=JSON.parse(data['_body']);
        console.log(this.arr1);
        //this.arr1.length=7;
        //console.log(JSON.parse(data['_body']));
        //console.log(this.arr1.patientID);
      }
    );
    console.log(this.patient);
  }

  back(){
    this.viewCtrl.dismiss();
  }

change(){
  console.log(this.patient);
  let profileModal = this.modalCtrl.create('PhotoPage',{patient:this.patient});
  profileModal.present();  
  
  
}
/* delete(){
  var user = localStorage.getItem('user');
  this.http.post('http://192.168.1.5:8080/deletepatient',JSON.stringify({patientID:this.patient}), {headers:this.headers}).subscribe(
    data=>{
      //this.arr1=JSON.parse(data['_body']);
      console.log(data);
      //this.arr1.length=7;
      //console.log(JSON.parse(data['_body']));
      //console.log(this.arr1.patientID);
    }
  );
} */
add(){
  this.navCtrl.push('AddpPage')
}

}
