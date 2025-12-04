import { CommonModule } from '@angular/common';
import { Component, ElementRef, OnDestroy, OnInit, ViewChild } from '@angular/core';

@Component({
  standalone: true,
  selector: 'app-logs',
  templateUrl: './logs.component.html',
  imports: [CommonModule],
})
export class LogsComponent implements OnInit, OnDestroy {
  logs: string[] = [];
  intervalId: any;
  @ViewChild('logBox', { static: true }) logBox!: ElementRef<HTMLDivElement>;

  ngOnInit() {
    this.pushRandom();
    this.intervalId = setInterval(() => this.pushRandom(), 1500);
  }

  pushRandom() {
    const now = new Date().toLocaleTimeString();
    const levels = ['INFO', 'WARN', 'ERROR', 'DEBUG'];
    const level = levels[Math.floor(Math.random()*levels.length)];
    const msg = `${now} [${level}] — ${this.randomMsg()}`;
    this.logs.push(msg);
    if (this.logs.length > 200) this.logs.shift();
    setTimeout(()=> this.scrollToBottom(), 50);
  }

  randomMsg() {
    const samples = [
      'Database connection established',
      'Database connection lost — retrying...',
      'Retry attempt #2 succeeded',
      'Background sync started',
      'Background sync completed successfully',
      'New ticket #554 created by user',
      'Ticket #554 status updated to In Progress',
      'Auth token expired — refreshing',
      'Auth token refresh successful',
      'Scheduled job “cleanup-temp” started',
      'Scheduled job “cleanup-temp” finished',
      'Rate limit reached for IP 192.168.1.34',
      'Incoming webhook received from Stripe',
      'Webhook signature verified',
      'Webhook processing failed: invalid payload',
      'Email queue length: 14',
      'SMS delivery failed: carrier timeout',
      'Payment succeeded for invoice #4412',
      'Payment failed: insufficient funds',
      'New session created for user 88'
    ];
    return samples[Math.floor(Math.random()*samples.length)];
  }

  scrollToBottom() {
    try {
      const el = this.logBox.nativeElement;
      el.scrollTop = el.scrollHeight;
    } catch (e) {}
  }

  ngOnDestroy() {
    clearInterval(this.intervalId);
  }
}
