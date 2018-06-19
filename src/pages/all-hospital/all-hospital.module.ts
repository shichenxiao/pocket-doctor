import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { AllHospitalPage } from './all-hospital';

@NgModule({
  declarations: [
    AllHospitalPage,
  ],
  imports: [
    IonicPageModule.forChild(AllHospitalPage),
  ],
})
export class AllHospitalPageModule {}
