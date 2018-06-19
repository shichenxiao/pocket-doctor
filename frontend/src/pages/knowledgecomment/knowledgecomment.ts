import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';
import { ModalController } from 'ionic-angular';
/**
 * Generated class for the KnowledgecommentPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-knowledgecomment',
  templateUrl: 'knowledgecomment.html',
})
export class KnowledgecommentPage {

  constructor(public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public viewCtrl: ViewController,public navCtrl: NavController, public navParams: NavParams) {
  }
arr=[];
arr1=[];
knowledgeTypeID
headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  ionViewDidLoad() {
    console.log('ionViewDidLoad KnowledgecommentPage');
  }
  ngOnInit(){
    this.knowledgeTypeID = this.navParams.get('knowledgeTypeID');
    console.log(this.knowledgeTypeID);
    this.http.post('http://localhost:8080/knowledgecontent',JSON.stringify({knowledegTypeID:this.knowledgeTypeID}), {headers:this.headers}).subscribe(
      data=>{
       this.arr=JSON.parse(data['_body']);
       
        console.log(JSON.parse(data['_body']));
        //console.log(data);
        
     
    })

    this.http.post('http://localhost:8080/knowledgecomment',JSON.stringify({knowledegTypeID:this.knowledgeTypeID}), {headers:this.headers}).subscribe(
      data=>{
       this.arr1=JSON.parse(data['_body']);
       
        console.log(JSON.parse(data['_body']));
        //console.log(data);
        
      }
  )} 
  txt;
  add(){
    this.knowledgeTypeID = this.navParams.get('knowledgeTypeID');
    //console.log(cliqueID);
    var user=localStorage.getItem('user');
    this.http.post( 'http://localhost:8080/add_knowledgecomment',JSON.stringify({userid:user,content:this.txt,kid:this.knowledgeTypeID}), {headers:this.headers} ).subscribe( 
        
        (data) => {
          let profileModal = this.modalCtrl.create('SuccessfulPage');
          profileModal.present(); 
         console.log(data);  
          //console.log()
          } 
      )};
  
  back(){
    this.viewCtrl.dismiss();
  }
}
