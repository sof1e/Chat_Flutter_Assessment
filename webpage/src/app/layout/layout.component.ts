import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, RouterLink } from '@angular/router';
import { SidebarComponent } from '../sidebar/sidebar.component';

@Component({
  selector: 'app-layout',
  standalone: true,
  imports: [
    CommonModule,
    RouterOutlet,
    RouterLink,
    SidebarComponent
  ],
  templateUrl: './layout.component.html'
})
export class LayoutComponent {
  isMobileOpen = false;
  toggleMobile() { this.isMobileOpen = !this.isMobileOpen; }
}
