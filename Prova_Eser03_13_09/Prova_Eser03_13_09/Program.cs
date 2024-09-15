using Prova_Eser03_13_09;
using System.IO;
namespace Prova_Eser03_13_09
{
    internal class Program
    {
        static void Main(string[] args)

        {

            List<Int32> numeri = new List<Int32>();

            String line;

            try
            {
                
                StreamReader sr = new StreamReader("C:\\Users\\Utente\\Desktop\\prova.txt");
              
                line =  sr.ReadLine();
               
               
                 

                while (line != null)
                {
                    
                    Console.WriteLine(line);

                    var numConvert = Convert.ToInt32(line);
                   
                    numeri.Add(numConvert);
                    line = sr.ReadLine();
                 
                    
                }
               
                sr.Close();

                int indice = 0;

                foreach (var number in numeri)
                {
                    indice=indice+number;

                }

                //Controllo 

                if (indice == 0)
                {
                    Console.WriteLine("Errore File Vuoto");
                }
                else
                {
                    Console.WriteLine($"la somma dei numeri è {indice}");

                }

                Console.ReadLine();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                Console.WriteLine("Executing finally block.");
            }
        }
    }
}
