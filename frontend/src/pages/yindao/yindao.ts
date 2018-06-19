import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage';
import { ModalController } from 'ionic-angular';
import { HomePage } from '../home/home';
/**
 * Generated class for the YindaoPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-yindao',
  templateUrl: 'yindao.html',
})
export class YindaoPage {

  constructor(public modalCtrl:ModalController,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad YindaoPage');
  }
   

go(){
  this.navCtrl.push(HomePage);
  localStorage.setItem('start','true');
}
}
