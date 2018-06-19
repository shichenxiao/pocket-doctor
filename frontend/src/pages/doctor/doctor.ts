import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';



@IonicPage()
@Component({
  selector: 'page-doctor',
  templateUrl: 'doctor.html',
})
export class DoctorPage {
  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr=[];
  doctorID='';
  
  ngOnInit(){
    this.doctorID =this.navParams.get('doctorID');
   
    this.http.post('http://localhost:8080/doctor',JSON.stringify({doctorID:this.doctorID}), {headers:this.headers}).subscribe(
      data=>{
        this.arr=JSON.parse(data['_body']);
       console.log(this.arr);
       console.log(this.arr[0].DoctorID);
       var doctor = localStorage.setItem('DoctorID',this.arr[0].DoctorID);

      }
    );
  }
  back(){
    this.viewCtrl.dismiss();
   
  }
  goList(){
    var doctorID = localStorage.getItem('DoctorID')
    let profileModal = this.modalCtrl.create('ReservationPage',{doctorID:doctorID});
    profileModal.present();  
  }
}