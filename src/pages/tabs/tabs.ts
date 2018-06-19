import { Component } from '@angular/core';
import {HelloPage} from "../hello/hello"
import { AboutPage } from '../about/about';
import { ContactPage } from '../contact/contact';
import { HomePage } from '../home/home';
import {MePage} from '../me/me'

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = AboutPage;
  tab3Root = ContactPage;
  tab4Root = HelloPage;
  tab5Root = MePage;
  constructor() {

  }
}
