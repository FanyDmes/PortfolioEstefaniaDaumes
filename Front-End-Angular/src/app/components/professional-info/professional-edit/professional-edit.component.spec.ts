import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfessionalEditComponent } from './professional-edit.component';

describe('ProfessionalEditComponent', () => {
  let component: ProfessionalEditComponent;
  let fixture: ComponentFixture<ProfessionalEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProfessionalEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProfessionalEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
