import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { HttpModule,JsonpModule } from '@angular/http';
import 'rxjs/add/operator/map';
import {HttpClientModule} from '@angular/common/http';  


import { AboutPage } from '../pages/about/about';
import { ContactPage } from '../pages/contact/contact';
import { HomePage } from '../pages/home/home';
import { TabsPage } from '../pages/tabs/tabs';
import { HelloPage } from'../pages/hello/hello';
import {MePage} from '../pages/me/me';
import {LoginPage} from '../pages/login/login';


import { FormsModule} from '@angular/forms';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { Injectable } from "@angular/core";

import { ActionSheetController } from "ionic-angular";


import { ImagePicker } from '@ionic-native/image-picker';

import { Camera } from '@ionic-native/camera';

import { FileTransfer, FileUploadOptions, FileTransferObject }from'@ionic-native/file-transfer';

import { File } from '@ionic-native/file';



@NgModule({
  declarations: [
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    HelloPage,
    MePage,
   LoginPage
  ],
  imports: [
    BrowserModule, HttpModule,
    JsonpModule,
   
    FormsModule,
    IonicModule.forRoot(MyApp,{
      tabsHideOnSubPages:true,
      backButtonText:'',
      pageTransition:'ios-transition',
     backButtonIcon:""
    })
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    HelloPage,
    MePage,
    LoginPage
  ],
  providers: [
    Camera,

    ImagePicker,
    
    
    File,
    
    FileTransferObject,
    
    FileTransfer,
    
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
