import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';


/**
 * Generated class for the AllHospitalPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-all-hospital',
  templateUrl: 'all-hospital.html',
})
export class AllHospitalPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  arr=[];
  ngOnInit() {
    if(!localStorage.getItem('user')){
      let profileModal = this.modalCtrl.create('LoginPage');
      profileModal.present();
    }
 
          this.http.get('http://192.168.23.2:8080/hospital' ).subscribe( data=>{ 
            this.arr=JSON.parse(data['_body']);
            console.log(this.arr);
          } );
        
      }
  go(idx){
    localStorage.setItem('hospitalName',this.arr[idx].hospitalName);
    let profileModal = this.modalCtrl.create('OfficePage',{hospitalID:this.arr[idx].hospitalID});
    profileModal.present();  
  }
  back(){
    this.viewCtrl.dismiss();
  }
}
