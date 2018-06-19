import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';


@IonicPage()
@Component({
  selector: 'page-setup',
  templateUrl: 'setup.html',
})
export class SetupPage {

  constructor(public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }
  back(){
    this.viewCtrl.dismiss();
   
  }
  exit(){
    this.navCtrl.push("LoginPage");
  }
  detail(){
    this.navCtrl.push('DetailPage');  
  }
}
