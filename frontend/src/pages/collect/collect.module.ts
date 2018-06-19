import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { CollectPage } from './collect';

@NgModule({
  declarations: [
    CollectPage,
  ],
  imports: [
    IonicPageModule.forChild(CollectPage),
  ],
})
export class CollectPageModule {}
