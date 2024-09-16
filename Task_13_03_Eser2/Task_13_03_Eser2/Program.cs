using System.ComponentModel;
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

            List <Studente> studenti = new List <Studente> ();

            bool atttivo = true;


            while (atttivo)
            {
                Console.WriteLine("Cosa vuoi fare?\n"+
                     "N - Inserire Nuovi Dati\n" +
                     "V - Visualizzare i Dati\n" +
                     "M - Modificare i Dati\n" +
                     "F - Filtrate i Dati per Voto\n" +
                     "E - Eliminare i Dati\n" +
                     "Altrimento Q per uscire");

                string? inputScelta = Console.ReadLine ();

                switch (inputScelta) {


                    case "N":

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


                        if ( 0<= varVoto && varVoto <=10)
                        {
                            studenti.Add(stu);

                        }
                        else
                        {
                            Console.WriteLine(" Errore : inserire un Voto tra 0 e 10");
                        }

                        


                       
                         
                     break;

                    case "V":
                        foreach (var SingleStudente in studenti)
                        {
                            SingleStudente.StampaDettaglio();
                        }
                        break;

                    case "M":
                        Console.WriteLine("Chi vuoi modificare cerca per:\n" +
                            "Nome");
                     
                        var CercaNome = Console.ReadLine();
                        Console.WriteLine(" Cognome");
                        var CercaCognome= Console.ReadLine();

                        bool UtenteTrovato = false;

                        foreach (var SingleStudente in studenti)
                        {
                            if (SingleStudente.Nome == CercaNome && SingleStudente.Cognome == CercaCognome)
                            {
                                UtenteTrovato = true;
                                Console.WriteLine("Cosa vuoi Modificare?\n" +
                                     "N - Inserire Nuovo Nome\n" +
                                     "C - Inserire Nuovo Cognome\n" +
                                     "V - Inserire Voto\n" +
                                     "Altrimento Q per uscire");

                                string? inputSottoScelta = Console.ReadLine();
                                switch (inputSottoScelta)
                                {


                                    case "N":
                                        Console.WriteLine("Inserisce Nuovo Nome:");
                                        SingleStudente.Nome = Console.ReadLine();
                                        Console.WriteLine(" Nome Modificato\n");


                                        break;
                                    case "C":
                                        Console.WriteLine("Inserisce Nuovo Cognome:");
                                        SingleStudente.Cognome = Console.ReadLine();
                                        Console.WriteLine(" Cognome Modificato\n");

                                        break;
                                    case "V":
                                        Console.WriteLine("Inserisce Nuovo Voto:");
                                        SingleStudente.Voto = Convert.ToDouble(Console.ReadLine());
                                        Console.WriteLine(" Voto Modificato\n");
                                        break;


                                    case "Q":

                                        break;

                                    default:

                                        Console.WriteLine("ERRORE, comando non riconosciuto");
                                        break;

                                }
                            }




                        }

                        if (UtenteTrovato != true)
                        { Console.WriteLine("Utente non trovato\n"); }





                     break;


                    case "F":
                        Console.WriteLine("Inserire il Voto da filtrare \n");
                        var FilVoto = Convert.ToDouble( Console.ReadLine());
                        List<Studente> studentiFiltrati = new List<Studente>();
                        bool votoTrovato = false;

                        foreach (var SingleStudente in studenti)
                        {


                            if (SingleStudente.Voto == FilVoto)
                            {
                                 votoTrovato = true;
                                studentiFiltrati.Add(SingleStudente);

                            }

                            
                        }
                        foreach (var votoStudenteLista in studentiFiltrati)
                        {
                            votoStudenteLista.StampaDettaglio();
                        }
                        if (votoTrovato != true)
                        { Console.WriteLine("Nessun studente con questo voto è stato trovato\n"); }



                    break;


                    case "E":
                        Console.WriteLine("Inserire il Nome dello studente da eliminare \n");
                        var CercaEliminaNome = Console.ReadLine();
                        
                        


                        List<Studente> studentiDaEliminare = new List<Studente>();

                        
                        foreach (var studenteEliminare in studenti)
                        {

                            if(studenteEliminare.Nome == CercaEliminaNome)
                            {

                                studentiDaEliminare.Add(studenteEliminare);
                                //studenti.Remove(studenteEliminare);
                            }

                        }
                        if (studentiDaEliminare.Count() > 0)
                        {
                            Console.WriteLine("inserisci anche il Cognome");
                            foreach (var elminareStu in studentiDaEliminare)
                            {
                                if (elminareStu.Cognome == Console.ReadLine())
                                {
                                    studenti.Remove(elminareStu);
                                    Console.WriteLine("Studenti eliminato");
                                }
                            }
                        }


                            break;


            }

                
            }








        }
    }
}
