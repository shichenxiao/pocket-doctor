import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ViewController,ActionSheetController,AlertController} from 'ionic-angular';
import { ModalController } from 'ionic-angular';
import { Http,Jsonp, Headers} from '@angular/http';  
import { File } from "@ionic-native/file";  
import {ImagePicker, ImagePickerOptions} from "@ionic-native/image-picker";
import {Camera, CameraOptions} from "@ionic-native/camera";

/**
 * Generated class for the MessagePage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-message',
  templateUrl: 'message.html',
})
export class MessagePage {

  constructor(public alertCtrl: AlertController,public actionSheetCtrl: ActionSheetController,public imagePicker: ImagePicker, public camera: Camera,public viewCtrl: ViewController,public modalCtrl:ModalController,public http:Http ,public jsonp:Jsonp,public navCtrl: NavController, public navParams: NavParams) {
  }
  arr=[];
  headers = new Headers( {'Content-Type':'application/x-www-form-urlencoded'} );
  name;
  tel;
  usex;
  uaddress;
  ngOnInit(){
    console.log(this.name);
    console.log(this.tel);
    console.log(this.usex);
    console.log(this.address);
    var user = localStorage.getItem('user');
    
    this.http.post('http://192.168.23.2:8080/getuser',JSON.stringify({userID:user}), {headers:this.headers}).subscribe( 
       
      (data) => {
        //console.log(data);
        this.arr=JSON.parse(data['_body']);
         console.log(this.arr);
   
      }
    );
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad MessagePage');
  }
  back(){
    this.viewCtrl.dismiss();
  }
  
  username(){
    let profileModal = this.modalCtrl.create('UsernamePage');
    profileModal.present();
  }
  telephone(){
    let profileModal = this.modalCtrl.create('TelephonePage');
    profileModal.present();
  }
  sex(){
    let profileModal = this.modalCtrl.create('SexPage');
    profileModal.present();
  }
  address(){
    let profileModal = this.modalCtrl.create('AddressPage');
    profileModal.present();
  }
  btn(){
    let profileModal = this.modalCtrl.create('PhotoPage');
    profileModal.present();
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
