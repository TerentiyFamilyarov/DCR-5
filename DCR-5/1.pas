var input,input1,output:text; arr,arr1:array[1..10000] of int64; choose,len,len1,i:int64;
procedure ChoiseSort(func:integer);
var max, id_max, i, j: int64;
begin
  if func=1 then
    begin
    j := len1;
    while j > 1 do begin
        max := arr1[1];
        id_max := 1;
        for i := 2 to j do
            if arr1[i] > max then begin
                max := arr1[i];
                id_max := i
            end;
        arr1[id_max] := arr1[j];
        arr1[j] := max;
        j := j - 1
      end;
    end
  else
    begin
     j := len1;
    while j > 1 do begin
        max := arr1[1];
        id_max := 1;
        for i := 2 to j do
            if arr1[i] < max then begin
                max := arr1[i];
                id_max := i
            end;
        arr1[id_max] := arr1[j];
        arr1[j] := max;
        j := j - 1
      end; 
    end;
end;

procedure QuickSort( L, R : Integer );
var i,j,x,y : integer;
begin
  i := l; j := r; 
  x := arr[(l+r) div 2];
  repeat
    while (Arr[i] < x) do i+=1;
    while (x < Arr[j]) do j-=1;
    if ( i <= j ) then
    begin
      swap(arr[i],arr[j]);
      i+=1; j-=1;
    end;
  until (i > j);
  if (l < j) then QuickSort(l,j);
  if (i < r) then QuickSort(i,r);
end;



///////////////////////////////////////start\\\\\\\\\\\\\\\\\\\\\\\\\\\\

begin
  {assign(input,'C:\Users\Teren\OneDrive\Рабочий стол\DCR-5\ввод1.txt');
  assign(input1,'C:\Users\Teren\OneDrive\Рабочий стол\DCR-5\ввод2.txt');   }
  assign(input,'C:\Users\Teren\OneDrive\Рабочий стол\DCR-5\ввод3.txt');
  assign(input1,'C:\Users\Teren\OneDrive\Рабочий стол\DCR-5\ввод4.txt'); 
  i:=1;
  reset(input);
  reset(input1);
  while not EOF(input) do
    begin
    readln(input,arr[i]);
    len+=1;
    i+=1;
    end;
  i:=1;
  while not EOF(input1) do
    begin
    readln(input1,arr1[i]);
    len1+=1;
    i+=1;
    end;
    close(input);
    close(input1);
    repeat
    begin
    write('sort mode(возр=123 or убыв=321. zero for end): ');
    readln(choose);
    assign(output,'C:\Users\Teren\OneDrive\Рабочий стол\DCR-5\вывод1.txt');
    rewrite(output);
    case choose of
      123:
      begin
        writeln(output,'Quick from small:');
        QuickSort(1,len);
        for i:=1 to len do writeln(output,arr[i]);//print
        writeln(output,'Choise from small:');
        ChoiseSort(1);
        for i:=1 to len1 do writeln(output,arr1[i]);//print
      end;
      321:
      begin
        writeln(output,'Quick from big:');
        QuickSort(1,len);
        i:=len;
        while i>0 do begin writeln(output,arr[i]); i-=1;end;
        writeln(output,'Choise from big:');
        ChoiseSort(2);
        for i:=1 to len1 do writeln(output,arr1[i]);//print
      end;
    end;
    close(output);
    writeln('finished!')
    end;
    until choose=0;
end.