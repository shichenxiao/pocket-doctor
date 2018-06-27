import { Component } from '@angular/core';
import { IonicPage,App, NavController, NavParams,ViewController } from 'ionic-angular';
import { LoginPage } from '../../pages/login/login';

@IonicPage()
@Component({
  selector: 'page-setup',
  templateUrl: 'setup.html',
})
export class SetupPage {

  constructor(public app:App,public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }
  back(){
    this.viewCtrl.dismiss();
   
  }

  exit(){
    this.app.getRootNavs()[0].setRoot(LoginPage);
    this.navCtrl.push(LoginPage);
    localStorage.removeItem('user');
  }
  detail(){
    this.navCtrl.push('DetailPage');  
  }
}
