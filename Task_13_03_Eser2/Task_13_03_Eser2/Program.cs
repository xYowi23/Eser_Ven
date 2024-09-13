using System.Globalization;
using System.Runtime.InteropServices;
using Task_13_03_Eser2.classes;

namespace Task_13_03_Eser2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*Creare un'applicazione console che permetta la gestione di una lista di studenti,con la possibilta di inserire 
             * nuovi studenti, modificare i dati, visualizzarli e filtrare la lista in base ai voti.
             
             */

            List <string> studenti = new List <string> ();

                      

            Console.WriteLine("Nome:");
            string? varNome = Console.ReadLine();
            Console.WriteLine("Cognome:");
            string? varCognome = Console.ReadLine();
            Console.WriteLine("Voto:");
            double varVoto = Convert.ToDouble(Console.ReadLine());

            Studente stu = new Studente();
            stu.Nome = varNome;
            stu.Cognome = varCognome;
            stu.Voto = varVoto;
              








        }
    }
}
