import { Component, signal } from '@angular/core';
import { LayoutComponent } from './layout/layout.component';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [LayoutComponent], 
  templateUrl: './app.html',
})
export class App {
  protected readonly title = signal('webpage');
}
