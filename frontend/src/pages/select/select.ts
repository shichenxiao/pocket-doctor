import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';
/**
 * Generated class for the SelectPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-select',
  templateUrl: 'select.html',
})
export class SelectPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  relationship;
  arr1=[];
  doctorID;
  arr=[];
  ngOnInit(){
  var user = localStorage.getItem('user');
  console.log(user);
  console.log(this.relationship);
  this.http.post('http://localhost:8080/getpatient',JSON.stringify({userID:user}), {headers:this.headers}).subscribe(
    data=>{
      this.arr1=JSON.parse(data['_body']);
      //this.arr1.length=7;
      console.log(JSON.parse(data['_body']));
      console.log(this.arr1[0].patientName);
      
    }
  );
  
}
  ionViewDidLoad() {
    console.log('ionViewDidLoad SelectPage');
  }
  back(){
    this.viewCtrl.dismiss();
  }

add(){
  let profileModal = this.modalCtrl.create('InformationPage');
  profileModal.present(); 
}
select(){
  //console.log(this.relationship.patientName);
//var id=localStorage.setItem('id',this.relationship);
this.doctorID =this.navParams.get('doctorID');
  

  //this.viewCtrl.dismiss({id:this.relationship});
  console.log(this.relationship);
  let profileModal = this.modalCtrl.create('ReservationPage',{doctorID:this.doctorID,id:this.relationship});
    profileModal.present(); 
}
}
