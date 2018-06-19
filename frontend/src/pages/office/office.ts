import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';


@IonicPage()
@Component({
  selector: 'page-office',
  templateUrl: 'office.html',
})
export class OfficePage {
 
  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  arr1=[];
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ngOnInit(){
  let hospitalID =this.navParams.get('hospitalID');
  console.log(hospitalID);


  this.http.post('http://localhost:8080/office',JSON.stringify({officeID:hospitalID}), {headers:this.headers}).subscribe(
    data=>{
      console.log(data);
      this.arr1=JSON.parse(data['_body']);
    

      console.log(this.arr1);
      console.log('这是选择好医院之后，点击开的可是列表');
    }
  );



  }
  back(){
    this.viewCtrl.dismiss();
  }
  goTo(idx){
    localStorage.setItem('officeName',this.arr1[idx].officeName);
    let profileModal = this.modalCtrl.create('DoctorlistPage',{doctorID:this.arr1[idx].officeID});
    profileModal.present();
}
}
