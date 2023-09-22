import { Component } from '@angular/core';
import { IonicModule } from '@ionic/angular';


@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [IonicModule],
})


export class HomePage {
  textoHolaMundo = "Hola Mundo";
  cont = 0;
  divHolaMundo ="";

  constructor() {}
  
  crearHolaMundo() {
    if (this.cont < this.textoHolaMundo.length) {
      this.divHolaMundo += this.textoHolaMundo.charAt(this.cont);
      this.cont++;
    } else {
      // Reiniciar cuando se muestra el mensaje completo
      this.cont = 0;
      this.divHolaMundo = '';
    }
  }
  
}


