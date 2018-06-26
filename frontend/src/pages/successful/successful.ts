import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams ,ViewController} from 'ionic-angular';

/**
 * Generated class for the SuccessfulPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-successful',
  templateUrl: 'successful.html',
})
export class SuccessfulPage {
knowledgeTypeID;
  constructor(public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }
  wancheng(){
   
    this.knowledgeTypeID =this.navParams.get('knowledgeTypeID');
    console.log(this.knowledgeTypeID)
    this.navCtrl.push('KnowledgecommentPage',{knowledgeTypeID:this.knowledgeTypeID});
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad SuccessfulPage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
}
