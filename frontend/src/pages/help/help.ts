import { Component } from '@angular/core';
import {  IonicPage, NavController, NavParams,ViewController} from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import {HelloPage } from '../hello/hello';
import { ModalController } from 'ionic-angular';

/**
 * Generated class for the HelpPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-help',
  templateUrl: 'help.html',
})
export class HelpPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }

  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr=[];
  factionName;
  ngOnInit(){
    let factionID =this.navParams.get('factionID');
    console.log(factionID);
    this.http.post('http://192.168.23.2:8080/clique',JSON.stringify({cliqueID:factionID}), {headers:this.headers}).subscribe(
      data=>{
        this.arr=JSON.parse(data['_body']);
       
        console.log(JSON.parse(data['_body']));
        this.factionName=this.arr[0].factionName;
      }
    );
    let cliqueid =this.navParams.get('cliqueID');
    console.log(cliqueid);
    this.http.post('http://192.168.23.2:8080/cliqueuser',JSON.stringify({userID:1}), {headers:this.headers}).subscribe(
      data=>{
       // this.arr=JSON.parse(data['_body']);
      
        //console.log(JSON.parse(data['_body']));
       // this.factionName=this.arr[0].factionName;
       console.log(data);
      }
    );
  }
  go(idx){
    let factionID =this.navParams.get('factionID');
    localStorage.setItem('factionName',this.arr[idx].factionName);
    let profileModal = this.modalCtrl.create('CommentPage',{cliqueID:this.arr[idx].cliqueID,factionID:factionID});
    profileModal.present();  
  }
  back(){
    this.viewCtrl.dismiss();
   
  }

}