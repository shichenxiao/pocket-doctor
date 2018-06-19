import { Component,ViewChild } from '@angular/core';
import { NavController,IonicPage, NavParams,Slides, AlertController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-me',
  templateUrl: 'me.html',
})
export class MePage {

  constructor(public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController,public alertCtrl: AlertController){  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MePage');
  }

  message(){
    let profileModal = this.modalCtrl.create('MessagePage');
    profileModal.present();
  }
patient(){
  let profileModal = this.modalCtrl.create('PatientPage');
    profileModal.present();
}
ask(){
  let profileModal = this.modalCtrl.create('AskPage');
    profileModal.present();
}
collect(){
  let profileModal = this.modalCtrl.create('CollectPage');
    profileModal.present();
}
order(){
  let profileModal = this.modalCtrl.create('OrderPage');
    profileModal.present();
}
view(){
  let profileModal = this.modalCtrl.create('ViewPage');
    profileModal.present();
}
  setup(){
    let profileModal = this.modalCtrl.create('SetupPage');
    profileModal.present();
  }
}
