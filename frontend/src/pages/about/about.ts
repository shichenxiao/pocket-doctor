import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController  } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { AlertController } from 'ionic-angular';
import { ModalController } from 'ionic-angular';





@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {
  icons:string="1";
  //segmentsArray = ['1','2','3','4'];
  constructor(public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
  
  }
 headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
arr1=[];
arr=[];
arr2=[];
arr3=[];
arr4=[];
ngOnInit(){
  this.http.get('http://localhost:8080/knowledgetype' ).subscribe( data=>{ 
          this.arr=JSON.parse(data['_body']);
          console.log(this.arr);
  });
 // var i =1;
//console.log(this.icons);

  this.http.post('http://localhost:8080/knowledge',JSON.stringify({knowledegTypeID:1}), {headers:this.headers}).subscribe(
    data=>{
     this.arr1=JSON.parse(data['_body']);
     
      console.log(JSON.parse(data['_body']));
      //console.log(data);
      
    }
  )
  this.http.post('http://localhost:8080/knowledge',JSON.stringify({knowledegTypeID:2}), {headers:this.headers}).subscribe(
    data=>{
     this.arr2=JSON.parse(data['_body']);
     
      console.log(JSON.parse(data['_body']));
      //console.log(data);
      
    }
  )
  this.http.post('http://localhost:8080/knowledge',JSON.stringify({knowledegTypeID:3}), {headers:this.headers}).subscribe(
    data=>{
     this.arr3=JSON.parse(data['_body']);
     
      console.log(JSON.parse(data['_body']));
      //console.log(data);
      
    }
  )
  this.http.post('http://localhost:8080/knowledge',JSON.stringify({knowledegTypeID:4}), {headers:this.headers}).subscribe(
    data=>{
     this.arr4=JSON.parse(data['_body']);
     
      console.log(JSON.parse(data['_body']));
      //console.log(data);
      
    }
  )}


content(idx){
  let profileModal = this.modalCtrl.create('KnowledgecommentPage',{knowledgeTypeID:this.arr1[idx].knowledgeTypeID});
  profileModal.present(); 
  //console.log(knowledgeTypeID);
}
content2(idx){
  let profileModal = this.modalCtrl.create('KnowledgecommentPage',{knowledgeTypeID:this.arr2[idx].knowledgeTypeID});
  profileModal.present(); 
  //console.log(knowledgeTypeID);
}
content3(idx){
  let profileModal = this.modalCtrl.create('KnowledgecommentPage',{knowledgeTypeID:this.arr3[idx].knowledgeTypeID});
  profileModal.present(); 
  //console.log(knowledgeTypeID);
}
content4(idx){
  let profileModal = this.modalCtrl.create('KnowledgecommentPage',{knowledgeTypeID:this.arr4[idx].knowledgeTypeID});
  profileModal.present(); 
  //console.log(knowledgeTypeID);
}
 back(){
    this.viewCtrl.dismiss();
  }


}
