import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { ZixunPage } from './zixun';

@NgModule({
  declarations: [
    ZixunPage,
  ],
  imports: [
    IonicPageModule.forChild(ZixunPage),
  ],
  exports: [
    ZixunPage
  ]
})
export class ZixunPageModule {}
