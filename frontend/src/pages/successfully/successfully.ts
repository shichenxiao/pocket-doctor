import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';

/**
 * Generated class for the SuccessfullyPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-successfully',
  templateUrl: 'successfully.html',
})
export class SuccessfullyPage {

  constructor(public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad SuccessfullyPage');
  }
  wancheng(){
   
    this.viewCtrl.dismiss();
  }
 
  back(){
    this.viewCtrl.dismiss();
  }
}
