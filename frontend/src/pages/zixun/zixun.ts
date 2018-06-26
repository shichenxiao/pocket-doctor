import { Component } from '@angular/core';
import {IonicPage, NavController, NavParams, ViewController,ActionSheetController, AlertController} from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { ModalController } from 'ionic-angular'; 
import { File } from "@ionic-native/file";  
import {ImagePicker, ImagePickerOptions} from "@ionic-native/image-picker";
import {Camera, CameraOptions} from "@ionic-native/camera";
/**
 * Generated class for the ZixunPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-zixun',
  templateUrl: 'zixun.html',
})
export class ZixunPage {

  constructor( public actionSheetCtrl: ActionSheetController, public alertCtrl: AlertController, public imagePicker: ImagePicker, public camera: Camera,public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
 sex;
 age;
 direction;
 type;
 diseasepic;
 arr1=[];
 headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );ip
 ngOnInit(){
    this.http.get('http://192.168.23.2:8080/illnesstype' ).subscribe( data=>{ 
            this.arr1=JSON.parse(data['_body']);
            //console.log(this.arr1[0].illnessID);
    });
 }

  success(){
    console.log(this.type);
    var myDate = new Date();
    //myDate.getYear();       //获取当前年份(2位)
 var year=   myDate.getFullYear();   //获取完整的年份(4位,1970-????)
  var month=  myDate.getMonth() +1;      //获取当前月份(0-11,0代表1月)
   var day= myDate.getDate();
var date =  year+'-'+month+'-'+day;
date;
    var user = localStorage.getItem('user');
    this.http.post('http://192.168.23.2:8080/add_question',JSON.stringify({userid:user,sex:this.sex,age:this.age,diseasetype:this.type,diseasepic:this.diseasepic,direction:this.direction,date:date}), {headers:this.headers}).map(data=>data.json()).subscribe( 
       
      (data) => {
        console.log(data);
       // this.arr1=JSON.parse(data['_body']);
      // console.log(this.arr1);
      if(data==1){
        let profileModal = this.modalCtrl.create('SuccessfullyPage');
        profileModal.present();  
      }
       
      }
    );
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
