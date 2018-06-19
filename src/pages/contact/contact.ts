import { Component } from '@angular/core';
import { NavController ,ViewController} from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular'; 
@Component({
  selector: 'page-contact',
  templateUrl: 'contact.html'
})
export class ContactPage {

  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController){  }
 goZixun(){
  let profileModal = this.modalCtrl.create('ZixunPage');
  profileModal.present();  
  }
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  arr1=[];
  ngOnInit(){
    this.http.post('http://localhost:8080/question',JSON.stringify({questionID:1}), {headers:this.headers}).subscribe(
      data=>{
        this.arr1=JSON.parse(data['_body']);
        this.arr1.length=5;
        console.log(this.arr1);
        console.log(data);
      }
    );
  }
}
