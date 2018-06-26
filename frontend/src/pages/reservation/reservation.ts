import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';
import $ from 'jquery'

@IonicPage()
@Component({
  selector: 'page-reservation',
  templateUrl: 'reservation.html',
  
})
export class ReservationPage {
  
  public event = {
    month: '2018-02-19',
    timeStarts: '07:43',
    timeEnds: '2018-02-20'
  }

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
doctorID;
arr=[];
name;
card;
ptel;
page;
arr1=[];
gaming;
arr2=[];
id;
date= localStorage.setItem('date',this.event.month);
//docname=localStorage.setItem('hname',this.arr[0].docname);
headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
ngOnInit(){
  this.name=localStorage.getItem('name');
  this.card=localStorage.getItem('card');
this.ptel=localStorage.getItem('ptel');
this.page=localStorage.getItem('page');
  if(!localStorage.getItem('user')){
    let profileModal = this.modalCtrl.create('LoginPage');
    profileModal.present();
  }
  
  this.doctorID =this.navParams.get('doctorID');
  
  this.http.post('http://192.168.23.2:8080/reservation_list',JSON.stringify({doctorID:this.doctorID}), {headers:this.headers}).subscribe(
    data=>{
      this.arr=JSON.parse(data['_body']);
      console.log(this.arr);
     //console.log(data);
      console.log(this.arr[0].hID);
      var hid = localStorage.setItem('hid',this.arr[0].hID);
      
      //var docname = localStorage.setItem('docname',this.arr[0].docname);
    }
  );
  this.id=this.navParams.get('id');
  console.log(this.id);
  this.http.post('http://192.168.23.2:8080/patient_get',JSON.stringify({patientID:this.id}), {headers:this.headers}).subscribe(
    data=>{
      this.arr2=JSON.parse(data['_body']);
      console.log(data);
      console.log(this.arr2);
     //console.log(data);
      //console.log(this.arr1[0].hID);
      //var hid = localStorage.setItem('hid',this.arr[0].hID);
      
      //var docname = localStorage.setItem('docname',this.arr[0].docname);
    }
  );
}

 //点击更改，更改就诊人弹窗出现
change(){
  
}
select(){
  let profileModal = this.modalCtrl.create('SelectPage',{doctorID:this.doctorID});
  profileModal.present();  
}
back(){
  this.viewCtrl.dismiss();
}

goList(){
  //console.log(this.arr[3].hname);
  //console.log(this.arr[0].docname);
  //console.log(this.event.month);
  var userid = localStorage.getItem('user');
  var doctorid= localStorage.getItem('DoctorID');
  var hid= localStorage.getItem('hid');
  this.id=this.navParams.get('id');
  console.log(hid);
  this.http.post('http://192.168.23.2:8080/add_reservation',JSON.stringify({Ruserid:userid,Rhospital:hid,Rdoctor:doctorid,Rpatient: this.id,Ramount:20,date:this.event.month}), {headers:this.headers}).map(data=>data.json()).subscribe( 
       
    (data) => {
      console.log(data);
     // this.arr1=JSON.parse(data['_body']);
    // console.log(this.arr1);
    if(data==1){
      let profileModal = this.modalCtrl.create('AppointmentPage',{id:this.id,date:this.event.month});
      profileModal.present();  
    }
     
    }
  );
  
}
}
