using Labb3_Rasmus_AnropaDB.Models;
using System.ComponentModel.Design;

namespace Labb3_Rasmus_AnropaDB
{
    internal class Program
    {
    static void Main(string[] args)
        {
            using Labb3DBContext context = new Labb3DBContext();


            bool program = true;
            while (program)
            {
                Console.Clear();                
                Console.WriteLine("     Hämta alla elever");
                Console.WriteLine("     Hämta alla elever i en klass");
                Console.WriteLine("     Lägg till ny personal");
                Console.WriteLine("     Avsluta");

                int cursorPos = 0;
                Console.SetCursorPosition(0, cursorPos);
                Console.CursorVisible = false;
                Console.Write("-->");
                ConsoleKeyInfo navigator;

                do
                {
                    navigator = Console.ReadKey();
                    Console.SetCursorPosition(0, cursorPos);
                    Console.Write("   ");
                    if (navigator.Key == ConsoleKey.UpArrow && cursorPos > 0)
                    {
                        cursorPos--;
                    }

                    else if (navigator.Key == ConsoleKey.DownArrow && cursorPos < 3)
                    {
                        cursorPos++;
                    }

                    Console.SetCursorPosition(0, cursorPos);
                    
                    Console.Write("-->");
                } while (navigator.Key != ConsoleKey.Enter);

                Console.Clear();

                switch (cursorPos)
                {
                    case 0: //Sortera alla elever
                        Console.WriteLine("Hur vill du ha eleverna sorterade?");
                        Console.WriteLine("     Sortera Stigande på Förnamn");
                        Console.WriteLine("     Sortera Stigande på Efternamn");
                        Console.WriteLine("     Sortera Fallande på Förnamn");
                        Console.WriteLine("     Sortera Fallande på Efternamn");
                        Console.WriteLine("     Tillbaka till menyn");

                        int cursorPos2 = 1;
                        Console.SetCursorPosition(0, cursorPos2);
                        Console.CursorVisible = false;
                        Console.Write("-->");
                        ConsoleKeyInfo navigator2;

                        do
                        {
                            navigator2 = Console.ReadKey();
                            Console.SetCursorPosition(0, cursorPos2);
                            Console.Write("   ");
                            if (navigator2.Key == ConsoleKey.UpArrow && cursorPos2 > 1)
                            {
                                cursorPos2--;
                            }

                            else if (navigator2.Key == ConsoleKey.DownArrow && cursorPos2 < 5)
                            {
                                cursorPos2++;
                            }

                            Console.SetCursorPosition(0, cursorPos2);
                            Console.Write("-->");
                        } while (navigator2.Key != ConsoleKey.Enter);

                        Console.Clear();

                        switch (cursorPos2)
                        {
                            case 1: //Stigande Förnamn                               
                                var student = context.TblStudents.OrderBy(s => s.FirstName);
                                
                                foreach(TblStudent st in student)
                                {
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                    Console.WriteLine(new string('-', 20));
                                }
                                Console.WriteLine("Press Enter to return to menu. . .");
                                Console.ReadKey();
                                break;

                            case 2: //Stigande Efternamn                                
                                student = context.TblStudents.OrderBy(s => s.LastName);
                                
                                foreach (TblStudent st in student)
                                {                                    
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                    Console.WriteLine(new string('-', 20));                                    
                                }
                                Console.WriteLine("Press Enter to return to menu. . .");
                                Console.ReadKey();
                                break;

                            case 3: //Fallande Förnamn
                                student = context.TblStudents.OrderByDescending(s => s.FirstName);

                                foreach (TblStudent st in student)
                                {
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                    Console.WriteLine(new string('-', 20));
                                }
                                Console.WriteLine("Press Enter to return to menu. . .");
                                Console.ReadKey();
                                break;

                            case 4: //Fallande Efternamn
                                student = context.TblStudents.OrderByDescending(s => s.LastName);

                                foreach (TblStudent st in student)
                                {
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                    Console.WriteLine(new string('-', 20));
                                }
                                Console.WriteLine("Press Enter to return to menu. . .");
                                Console.ReadKey();
                                break;

                            case 5: //Tillbaka
                                Console.WriteLine("Går tillbaka till menyn. . .");
                                Thread.Sleep(1000);
                                break;
                        }                       
                        break;

                    case 1: //Hämta alla elever i en klass                       
                        Console.WriteLine("Vilken klass ska visas?");
                        Console.WriteLine("     A1");
                        Console.WriteLine("     B2");
                        Console.WriteLine("     C3");
                        Console.WriteLine("     Tillbaka till menyn");

                        int cursorPos3 = 1;
                        Console.SetCursorPosition(0, cursorPos3);
                        Console.CursorVisible = false;
                        Console.Write("-->");
                        ConsoleKeyInfo navigator3;

                        do
                        {
                            navigator3 = Console.ReadKey();
                            Console.SetCursorPosition(0, cursorPos3);
                            Console.Write("   ");
                            if (navigator3.Key == ConsoleKey.UpArrow && cursorPos3 > 1)
                            {
                                cursorPos3--;
                            }

                            else if (navigator3.Key == ConsoleKey.DownArrow && cursorPos3 < 4)
                            {
                                cursorPos3++;
                            }

                            Console.SetCursorPosition(0, cursorPos3);
                            Console.Write("-->");
                        } while (navigator3.Key != ConsoleKey.Enter);

                        Console.Clear();
                        switch (cursorPos3)
                        {
                            case 1: //A1
                                Console.WriteLine("Alla studenter som går i A1");
                                var klassStudent = context.TblStudents.Where(s => s.Klass == "A1");

                                foreach (TblStudent st in klassStudent)
                                {
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                }
                                Console.WriteLine("Press enter to return to menu. . .");
                                Console.ReadKey();
                                break;
                            case 2: //B2
                                Console.WriteLine("Alla studenter som går i B2");
                                klassStudent = context.TblStudents.Where(s => s.Klass == "B2");

                                foreach (TblStudent st in klassStudent)
                                {
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                }
                                Console.WriteLine("Press enter to return to menu. . .");
                                Console.ReadKey();
                                break;
                            case 3: //C3
                                Console.WriteLine("Alla studenter som går i C3");
                                klassStudent = context.TblStudents.Where(s => s.Klass == "C3");

                                foreach (TblStudent st in klassStudent)
                                {
                                    Console.WriteLine($"Klass : {st.Klass} - Name : {st.FirstName} {st.LastName}");
                                }
                                Console.WriteLine("Press enter to return to menu. . .");
                                Console.ReadKey();
                                break;
                            case 4: //Tillbaka
                                Console.WriteLine("Går tillbaka till menyn. . .");
                                Thread.Sleep(1000);
                                break;
                        }
                        break;
                    case 2: //Lägg till ny personal
                        Console.WriteLine("Lägger till ny personal. . .");
                        Console.Write("Ange Förnamn: ");
                        var newFName = Console.ReadLine();
                        Console.Write("Ange Efternamn: ");
                        var newLName = Console.ReadLine();
                        Console.Write("Ange befattning: ");
                        var newBefattning = Console.ReadLine();

                        TblPersonal NyPersonal = new TblPersonal()
                        {
                            FirstName = newFName,
                            LastName = newLName,
                            Befattning = newBefattning
                        };

                        context.TblPersonals.Add(NyPersonal);
                        context.SaveChanges();
                        Console.WriteLine("Ny personal tillagd. . .");
                        Thread.Sleep(1000);
                        break;
                    case 3: //Avsluta
                        Console.WriteLine("Avslutar programmet. . .");
                        Thread.Sleep(1000);
                        program = false;
                        break;
                }

            
            }
            
        }
    }
}
