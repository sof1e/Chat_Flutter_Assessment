import { Routes } from '@angular/router';
import { TicketsComponent } from './pages/tickets/tickets.component';
import { KnowledgebaseComponent } from './pages/knowledgebase/knowledgebase.component';
import { LogsComponent } from './pages/logs/logs.component';

export const routes: Routes = [
  { path: 'tickets', component: TicketsComponent },
  { path: 'knowledge', component: KnowledgebaseComponent },
  { path: 'logs', component: LogsComponent },
  { path: '', redirectTo: 'tickets', pathMatch: 'full' }
];
