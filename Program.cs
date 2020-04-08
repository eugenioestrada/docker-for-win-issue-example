using LibGit2Sharp;
using System;
using System.IO;

namespace ConsoleApp4
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = Path.Combine(Environment.CurrentDirectory, "repo");
            if (Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }

            Directory.CreateDirectory(path);

            Repository.Clone("https://github.com/eugenioestrada/refit", path);

            Console.WriteLine("Hello World!");
        }
    }
}
