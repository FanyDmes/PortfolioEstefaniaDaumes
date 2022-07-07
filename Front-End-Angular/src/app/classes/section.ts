import { Directive, OnInit } from '@angular/core';
import { PortfolioDataService } from '../services/portfolio-data.service';

@Directive()
export class Section implements OnInit {
  // Creamos las clase Section, para evitar repetir lógica en las distintas secciones del sitio.
  url: string = '';
  sectionData: any;
  isEditing: boolean = false;

  // Inyectamos el servicio utilizando el modificador 'Protected', de manera que las instancias de esta clase puedan acceder al servicio.
  constructor(protected portfolioData: PortfolioDataService) {}

  // Método que cambia el estado del booleano, esto nos servirá para pasar del "modo edicion" al "modo visualizar".
  toggleEdition(editingState: boolean): void {
    this.isEditing = editingState;
  }

  // Método que utilizamos para guardar cambios, el mismo actualiza los datos de la propiedad 'sectionData' y llama al método del servicio que se encarga de actualizar los datos en el JSON.
  saveChanges(newData: any): void {
    this.sectionData = newData;
    console.log(newData);
    this.portfolioData.updateSection(this.url, newData).subscribe();
  }

  // Declaramos que al instanciar esta Clase, la propiedad 'SectionFData' tomará como valor los datos obtenidos a través del servicio.
  ngOnInit(): void {
    this.portfolioData.getData(this.url).subscribe((data) => {
      this.sectionData = data.description;
    });
  }
}

@Directive()
export class ItemsSection extends Section {
  isAdding: boolean = false;

  toggleAdding(addingState: boolean): void {
    this.isAdding = addingState;
  }

  reloadToggle(editingState: boolean) {
    if (this.isEditing) {
      window.location.reload();
    }
    this.isEditing = editingState;
  }

  addItem(item: any) {
    this.portfolioData.addItem(this.url, item).subscribe();
  }

  deleteItem(item: any) {
    this.portfolioData.deleteItem(this.url, item).subscribe();
  }

  updateItems(itemsList: any): void {
    for (let item of itemsList) {
      let newUrl = this.url + `/${item.id}`;
      this.portfolioData.updateItem(newUrl, item).subscribe();
    }
  }

  // Re-asignamos el valor de esta seccion a través del servicio, ya que necesitamos el array completo y no sólo una parte.
  override ngOnInit(): void {
    this.portfolioData.getData(this.url).subscribe((data) => {
      this.sectionData = data;
    });
  }
}