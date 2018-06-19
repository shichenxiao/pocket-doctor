import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http'; 
import { ModalController } from 'ionic-angular';
import { ChangeDetectorRef } from '@angular/core';  
import * as $ from 'jquery';
import { AlertController } from 'ionic-angular';
import { Events } from 'ionic-angular';
/**
 * Generated class for the CommentPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-comment',
  templateUrl: 'comment.html',
})
export class CommentPage {

  constructor(public events: Events,private alertCtrl: AlertController ,public cd:ChangeDetectorRef,public modalCtrl:ModalController,public viewCtrl: ViewController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
    events.subscribe('user:created', (i, time) => {
      // user and time are the same arguments passed in `events.publish(user, time)`
      console.log('Welcome', i, 'at', time);
    });
  }
  arr=[];
  arr1=[];
  cliqueID;
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ngOnInit(){
    var cliqueID =this.navParams.get('cliqueID');
    var user = localStorage.getItem('user');
    console.log(cliqueID);
    this.http.post('http://localhost:8080/cliquecomment',JSON.stringify({cliqueCommentID:cliqueID}), {headers:this.headers}).subscribe(
      data=>{
       this.arr=JSON.parse(data['_body']);
       
        console.log(JSON.parse(data['_body']));
        console.log(data);
        
      }
    );
    this.cliqueID = this.navParams.get('cliqueID');
    this.http.post('http://localhost:8080/cliqueuser',JSON.stringify({cliqueCommentID:this.cliqueID,userID:user}), {headers:this.headers}).subscribe(
      data=>{
       this.arr1=JSON.parse(data['_body']);
       
        console.log(JSON.parse(data['_body']));
        console.log(data);
      for(var i=0;i<this.arr1.length;i++){
        this.arr1[i].userPhoto;
        this.arr1[i].username;
        this.arr1[i].userArtile;
      }
       
        
      }
    );
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad CommentPage');
  }
  back(){
    this.viewCtrl.dismiss();
   
  }
  txt;
  showPrompt1() {
    let prompt = this.alertCtrl.create({
      title: '评论内容',
      message: "评论不能为空",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   showPrompt2() {
    let prompt = this.alertCtrl.create({
      title: '评论内容',
      message: "评论成功",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   createUser(user) {
    console.log('User created!')
    this.events.publish('user:created', user, Date.now());
  }
  
  add(i){

    if (!this.txt||this.txt==" ") {
      this.showPrompt1();
    }else{
      var cliqueID =this.navParams.get('cliqueID');
      console.log(cliqueID);
      var user=localStorage.getItem('user');
      this.http.post( 'http://localhost:8080/add_comment',JSON.stringify({userid:user,content:this.txt,cid:cliqueID}), {headers:this.headers} ).subscribe( 
          
          (data) => {
            let profileModal = this.modalCtrl.create('SuccessfulPage');
            profileModal.present(); 
           console.log(data); 
           // this.cd.detectChanges();
           //this.showPrompt2();
         

           console.log(this.arr1[0].commentArtile);
           console.log(this.txt);
            } 
        )};
    }
    
    
}
