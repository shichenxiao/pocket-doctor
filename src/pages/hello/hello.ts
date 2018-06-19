import { Component,ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { List } from 'ionic-angular';
import { ModalController } from 'ionic-angular';
/**
 * Generated class for the HelloPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-hello',
  templateUrl: 'hello.html',
})
export class HelloPage {
  constructor(public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }

  arr1=[];
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ngOnInit(){

    //let faction =this.navParams.get('factionID');
    //console.log(faction);
    
    this.http.get('http://localhost:8080/get_faction' ).subscribe( data=>{ 
            this.arr1=JSON.parse(data['_body']);
            console.log(this.arr1);
          } );
  }
  go(idx){
    localStorage.setItem('factionName',this.arr1[idx].factionName);
    let profileModal = this.modalCtrl.create('HelpPage',{factionID:this.arr1[idx].factionID});
    profileModal.present();  
  }
 help(){
    this.navCtrl.push('HelpPage');
  }

}
