import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { KnowledgecommentPage } from './knowledgecomment';

@NgModule({
  declarations: [
    KnowledgecommentPage,
  ],
  imports: [
    IonicPageModule.forChild(KnowledgecommentPage),
  ],
})
export class KnowledgecommentPageModule {}
