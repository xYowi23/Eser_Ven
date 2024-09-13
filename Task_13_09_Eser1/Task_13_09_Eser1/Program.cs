using System.ComponentModel;

namespace Task_13_09_Eser1
{
    internal class Program
    {
        static void Main(string[] args)
        {

            bool attivo = true;


         


            while (attivo == true)
            {

                Console.WriteLine("Inserisce il primo numero");
                string? numA =(Console.ReadLine());


                Console.WriteLine("Inserisce il secondo numero");
                string? numB = (Console.ReadLine());

                try
                {
                     int numeroA = Convert.ToInt16(numA);
                     int numeroB = Convert.ToInt16(numB);



                    Console.WriteLine("Cosa vuoi fare?\n" +
                     "S- Somma\n" +
                     "Z - Sottrazione\n" +
                     "M - Moltiplicazione\n" +
                     "D- Divisione\n" +
                     "P- Potenza\n" +
                     "R- Radice\n" +

                     "Altrimento Q per uscire");
                    string? inputScelta = Console.ReadLine();

                    switch (inputScelta)
                    {

                        case "S":

                            int SumRisultato = (numeroA + numeroB);

                            Console.WriteLine(SumRisultato);

                            break;

                        case "Z":
                            int SotRisultato = (numeroA - numeroB);
                            Console.WriteLine(SotRisultato);
                            break;

                        case "M":
                            int MotRisultato = (numeroA * numeroB);
                            Console.WriteLine(MotRisultato);
                            break;

                        case "D":
                            if (numeroA == 0 || numeroB == 0)
                            {
                                Console.WriteLine("Errore i numeri non possono essere zero");
                            }
                            else
                            {
                                int DivRisultato = (numeroA / numeroB);
                                Console.WriteLine(DivRisultato);
                            }
                            break;

                        case "P":

                            double number =Convert.ToDouble(numeroA);
                            double esponete = Convert.ToDouble(numeroB);


                            double PotRisultato = Math.Pow(number, esponete);
                            Console.WriteLine(PotRisultato);
                            break;
                        case "R":

                            double NumUno = Convert.ToDouble(numeroA);
                            double NumDue = Convert.ToDouble(numeroB);


                            double RadRisultato = Math.Sqrt(NumUno);
                            double RadRisultatodue = Math.Sqrt(NumDue);

                            Console.WriteLine($"radice  del primo numero:{RadRisultato}");
                            Console.WriteLine($"radice del secondo numero{RadRisultatodue}");

                            break;




                        case "Q":
                            attivo = false;
                            break;

                        default:

                            Console.WriteLine("ERRORE, comando non riconosciuto");
                            break;
                    }

                }
                catch {
                
                Console.WriteLine("non si può eseguire le operazioni introdurrere numeri ");
                
                }
            





            }





        }
    }
}
