import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  standalone: true,
  selector: 'app-knowledgebase',
  templateUrl: './knowledgebase.component.html',
  imports: [CommonModule, FormsModule]
})
export class KnowledgebaseComponent {
  content = 'Write knowledgebase notes here...';
  saved = false;
  savedContent = '';  //new field to display what was saved

  save() {
    this.saved = true;
    this.savedContent = this.content; //stores the saved content
    localStorage.setItem('kb_content', this.content);

    setTimeout(() => this.saved = false, 1500);
  }

  ngOnInit() {
    const s = localStorage.getItem('kb_content');
    if (s) {
      this.content = s;
      this.savedContent = s; //shows last saved right away
    }
  }
}
