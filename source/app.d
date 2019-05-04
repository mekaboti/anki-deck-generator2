import std.stdio;
import std.file;
import std.algorithm;

import htmlPaser;

string GetImgUrlFromGoogle(string word)
{
    string url="https://www.google.com/search?hl=jp&q="~word~"&btnG=Google+Search&tbs=0&safe=off&tbm=isch";
    auto hp=new HtmlPaser("url");

    hp.ExtractAllUrl();
    
    for(int i=0;i<hp.urlList.length;i++)
        writeln(hp.urlList);

    return "";
}

void main()
{
    auto f = File("ru-passport.cvs");
    
    switch(f.error()){
        case true:
            //what separates each element (\t , ; space)
            int es;
            writeln("The way to separate each element 1.Tab 2.comma 3.semicolon 4.space");
            readln(es);
            switch(es)
            {
                case 1: //"\t"
                    string elementSeparator = "\t";
                    break;
                case 2: //","
                    string elementSeparator=",";
                    break;
                case 3://;
                    string elementSeparator=";";
                    break;
                case 4:
                    string elementSeparator=" ";
                    break;
                default:
                    writeln("The iput value is false.");
                    return;
            }

            //File Open
            string fileName;
            writeln("Type the csv file name");
            readln(fileName);
            if(!canFind(fileName,"csv")){
                writeln("This file is not a csv file.");
                return;
            }
            auto f=File(fileName);
            

            //Line number for the translated language
            int lineNum;
            writeln("Which line is the TRANSLATED language?"); 
            readln(lineNum);

            //read csv by line
            string [] element;
            foreach(line;f.buffer)
            {
                //Split the line by selected separator
                element=split(line,elementSepartor);
                if(element.length<lineNum){
                    writeln("the line number is false.");
                    f.close();
                    return;
                }

                //Get url of image
                string imgUrl=GetImgUrlFromGoogle(element[lineNum]);

                //Download the image file

                //add image file address to the csv

            }

        case false:
            writeln("An error occured when opening the file.");
    }

    f.close();

    //auto ph = new UrlExtractor("");
}