import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController,ModalController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
/**
 * Generated class for the HospitalListPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-hospital-list',
  templateUrl: 'hospital-list.html',
})
export class HospitalListPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr1=[];
  ngOnInit(){

    this.http.post('http://192.168.23.2:8080/office',JSON.stringify({officeID:1}), {headers:this.headers}).subscribe(
      data=>{
        console.log(data);
        this.arr1=JSON.parse(data['_body']);
      

        console.log(this.arr1);
        console.log(this.arr1[0]);
      }
    );
  }
  back(){
    this.viewCtrl.dismiss();
  }
  goTo(idx){
        let profileModal = this.modalCtrl.create('HospitalPage',{officeID:this.arr1[idx].officeID});
        profileModal.present();
  }
}
