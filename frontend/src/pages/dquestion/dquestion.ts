import { Component } from '@angular/core';
import {IonicPage, NavController, NavParams, ViewController,ActionSheetController, AlertController} from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular'; 
import { File } from "@ionic-native/file";  
import {ImagePicker, ImagePickerOptions} from "@ionic-native/image-picker";
import {Camera, CameraOptions} from "@ionic-native/camera";

/**
 * Generated class for the DquestionPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-dquestion',
  templateUrl: 'dquestion.html',
})
export class DquestionPage {

  constructor( public actionSheetCtrl: ActionSheetController, public alertCtrl: AlertController, public imagePicker: ImagePicker, public camera: Camera,public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad DquestionPage');
  }
  sex;
  age;
  direction;
  type;
  diseasepic;
  arr1=[];
  arr=[];
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );ip
  ngOnInit(){
     this.http.get('http://192.168.23.2:8080/illnesstype' ).subscribe( data=>{ 
             this.arr=JSON.parse(data['_body']);
             //console.log(this.arr1[0].illnessID);
     });
     var doctorID = localStorage.getItem('DoctorID')
     this.http.post('http://192.168.23.2:8080/doctorList',JSON.stringify({doctorID:doctorID}),{headers:this.headers}).subscribe(
      data=>{
        console.log(JSON.parse(data['_body']));
        this.arr1=JSON.parse(data['_body']);
        //this.officeName=this.arr[0].officeName;
       
      }
    )
       

  }
  showPrompt1() {
    let prompt = this.alertCtrl.create({
      title: '警告',
      message: "请选择性别",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   showPrompt2() {
    let prompt = this.alertCtrl.create({
      title: '警告',
      message: "请输入年龄",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   showPrompt3() {
    let prompt = this.alertCtrl.create({
      title: '警告',
      message: "请输入问题描述",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   showPrompt4() {
    let prompt = this.alertCtrl.create({
      title: '警告',
      message: "请选择疾病类型",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   showPrompt5() {
    let prompt = this.alertCtrl.create({
      title: '警告',
      message: "请将信息补充完整",
   
      buttons: ["关闭"]
    });
     prompt.present();
   }
   success(){
     console.log(this.type);
     var user = localStorage.getItem('user');
     var qdid = localStorage.getItem('DoctorID')
     var myDate = new Date();
    //myDate.getYear();       //获取当前年份(2位)
 var year=   myDate.getFullYear();   //获取完整的年份(4位,1970-????)
  var month=  myDate.getMonth() +1;      //获取当前月份(0-11,0代表1月)
   var day= myDate.getDate();
var date =  year+'-'+month+'-'+day;
     console.log(qdid);
    if(this.sex == ''){
      this.showPrompt1();
    }else if(this.age == ''){
      this.showPrompt2();
    }else if(this.direction==''){
      this.showPrompt3();
    }else if(this.type==''){
      this.showPrompt4();
    }else{
     this.http.post('http://192.168.23.2:8080/add_dquestion',JSON.stringify({qdid:qdid,userid:user,sex:this.sex,age:this.age,diseasepic:this.diseasepic,direction:this.direction,date:date}), {headers:this.headers}).map(data=>data.json()).subscribe( 
        
       (data) => {
         console.log(data);
        // this.arr1=JSON.parse(data['_body']);
       // console.log(this.arr1);
       if(data==1){
        var doctorID = localStorage.getItem('DoctorID')
         this.navCtrl.push('DoctorPage',{doctorID:doctorID});
       }else{
          this.showPrompt5();
       }
        
       }
     );}
     //this.navCtrl.push('SuccessPage');
     
     }
     back(){
       this.viewCtrl.dismiss();
      
     }
     avatar: string = "";
     presentActionSheet() {
       let actionSheet = this.actionSheetCtrl.create({
         buttons: [{
           text: '拍照',
           role: 'takePhoto',
           handler: () => {
             this.takePhoto();
           }
         }, {
           text: '从相册选择',
           role: 'chooseFromAlbum',
           handler: () => {
             this.chooseFromAlbum();
           }
         }, {
           text: '取消',
           role: 'cancel',
           handler: () => {
             console.log("cancel");
           }
         }]
       });
     
       actionSheet.present().then(value => {
         return value;
       });
     }
     takePhoto() {
       const options: CameraOptions = {
         quality: 100,
         allowEdit: true,
         targetWidth: 200,
         targetHeight: 200,
         saveToPhotoAlbum: true,
       };
   
       this.camera.getPicture(options).then(image => {
         console.log('Image URI: '+ image);
         this.avatar = image.slice(7);
       }, error => {
         console.log('Error: '+ error);
       });
     }
   
     chooseFromAlbum() {
       const options: ImagePickerOptions = {
         maximumImagesCount: 1,
         width: 200,
         height: 200
       };
       this.imagePicker.getPictures(options).then(images => {
         if (images.length > 1) {
           this.presentAlert();
         } else if (images.length === 1) {
           console.log('Image URI: ' + images[0]);
           this.avatar = images[0].slice(7);
         }
       }, error => {
         console.log('Error: ' + error);
       });
     }
   
     presentAlert() {
       let alert = this.alertCtrl.create({title: "上传失败", message: "只能选择一张图片作为头像哦", buttons: ["确定"]});
       alert.present().then(value => {
         return value;
       });
     }
}
