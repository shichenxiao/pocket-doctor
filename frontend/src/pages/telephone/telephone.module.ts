import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { TelephonePage } from './telephone';

@NgModule({
  declarations: [
    TelephonePage,
  ],
  imports: [
    IonicPageModule.forChild(TelephonePage),
  ],
})
export class TelephonePageModule {}
