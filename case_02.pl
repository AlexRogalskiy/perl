#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

my $file = 'file.txt'; #имя файла, который читаем
open FH, $file; #открываем файл
my $text = _parseFile(*FH); #передаем файловый дескриптор в функцию
print $text;
close FH; #обязательно закрываем файловый дескриптор
sub _parseFile
{
	my $fh = shift; #получаем файловый дескриптор
	my $text = join('',<$fh>);#построчно читаем из файлового дескриптора, в строку и помещаем в переменную $text
	return $text;
}

#печать простых чисел
#perl -wle "(1 x $_) !~ /^(1|((11+)\3+))$/ && print while ++ $_"

#печать уникальных строк файла
#perl -ne '$s{$_}++ || print' file