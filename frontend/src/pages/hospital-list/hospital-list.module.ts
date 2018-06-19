import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { HospitalListPage } from './hospital-list';

@NgModule({
  declarations: [
    HospitalListPage,
  ],
  imports: [
    IonicPageModule.forChild(HospitalListPage),
  ],
})
export class HospitalListPageModule {}
