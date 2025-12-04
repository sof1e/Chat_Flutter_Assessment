import { Component, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, NavigationEnd } from '@angular/router';

@Component({
  standalone: true,
  selector: 'app-tickets',
  templateUrl: './tickets.component.html',
  imports: [CommonModule, FormsModule]
})
export class TicketsComponent {
  loading = true;
  filter = 'All';
  search = '';

  tickets = [
    { id: 'TCK-001', subject: 'Unable to login', status: 'Open', created: new Date('2025-11-01T09:15:00').toISOString() },
    { id: 'TCK-002', subject: 'App crash on upload', status: 'In Progress', created: new Date('2025-11-02T14:30:00').toISOString() },
    { id: 'TCK-003', subject: 'Feature request: Dark mode', status: 'Closed', created: new Date('2025-11-03T08:45:00').toISOString() },
    { id: 'TCK-004', subject: 'Payment gateway error', status: 'Open', created: new Date('2025-11-04T11:20:00').toISOString() },
    { id: 'TCK-005', subject: 'Notification not received', status: 'In Progress', created: new Date('2025-11-05T16:10:00').toISOString() },
    { id: 'TCK-006', subject: 'Profile picture upload fails', status: 'Open', created: new Date('2025-11-06T10:50:00').toISOString() },
    { id: 'TCK-007', subject: 'App slows down after update', status: 'In Progress', created: new Date('2025-11-07T13:35:00').toISOString() },
    { id: 'TCK-008', subject: 'Error 500 on checkout', status: 'Closed', created: new Date('2025-11-08T09:05:00').toISOString() },
    { id: 'TCK-009', subject: 'Search function returns wrong results', status: 'Open', created: new Date('2025-11-09T12:15:00').toISOString() },
    { id: 'TCK-010', subject: 'Unable to reset password', status: 'Closed', created: new Date('2025-11-10T15:40:00').toISOString() },
    { id: 'TCK-011', subject: 'Crash when opening settings', status: 'In Progress', created: new Date('2025-11-11T14:25:00').toISOString() },
    { id: 'TCK-012', subject: 'Localization missing in French', status: 'Open', created: new Date('2025-11-12T10:05:00').toISOString() },
    { id: 'TCK-013', subject: 'Export CSV fails on large files', status: 'In Progress', created: new Date('2025-11-13T17:30:00').toISOString() },
    { id: 'TCK-014', subject: 'UI glitch on tablet mode', status: 'Open', created: new Date('2025-11-14T09:50:00').toISOString() },
    { id: 'TCK-015', subject: 'Error while syncing contacts', status: 'Closed', created: new Date('2025-11-15T11:15:00').toISOString() }
  ];

  constructor(
    private router: Router,
    private cdr: ChangeDetectorRef
  ) {
    this.router.events.subscribe(ev => {
      if (ev instanceof NavigationEnd && ev.urlAfterRedirects.includes('/tickets')) {
        this.startSkeleton();
      }
    });
  }

  ngOnInit() {
    this.startSkeleton();
  }

  startSkeleton() {
    this.loading = true;
    this.cdr.detectChanges(); // force update before timeout

    setTimeout(() => {
      this.loading = false;
      this.cdr.detectChanges(); // force update after hide
    }, 1000);
  }

  get filtered() {
    return this.tickets.filter(t => {
      if (this.filter !== 'All' && t.status !== this.filter) return false;
      if (this.search && !(`${t.id} ${t.subject}`.toLowerCase().includes(this.search.toLowerCase()))) return false;
      return true;
    });
  }
}


