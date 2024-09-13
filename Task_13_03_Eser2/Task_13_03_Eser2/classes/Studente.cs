using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_13_03_Eser2.classes
{
    internal class Studente
    {

        public string Nome {  get; set; }
        public string Cognome {  get; set; }
        public double Voto { get; set; }

        public Studente() { }



        public void StampaDettaglio()
        {
            Console.WriteLine($"Nome: {Nome}\n Cognome: {Cognome}\n Voto: {Voto}\n");
        }

    }
}
