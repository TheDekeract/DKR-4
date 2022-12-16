uses crt;
uses GraphABC;

procedure q;
begin
  Println('Приблизительное - 1');
  Println('Точное значение - 2');
  Println('Абсолютная погрешность - 3 ');
  Println('Относительная погрешность - 4');
  Println('Поистроить график - 5');
  Println('Выход - 6');
end;

procedure grafik;
begin
  var l, p, h, x, y, a, b: real;
  var m,mx,my, x0, y0, x1, y1, n, yz, xz,xx,ot: integer;
  x0 := 800;//центр
  y0 := 400;
  SetPenColor(clBlack);
  SetPenWidth(2);
  line(x0, y0, x0 + 1500, y0);
  line(x0, y0, x0, y0 + 1500);
  line(x0, y0, 0, y0);
  line(x0, y0, x0, 0);
  SetPenWidth(1);
  l := -10;//отрезок
  p := 10;
  Print('Введите масштаб, реккомендуемо от 20 до 40: ');
  read(m);Print(m);Println();
  mx:=m;
  my:=m;
  xx:=0;
  while xx <= 100*m do
  begin
    ot:=xx*-1;
    line(x0+xx*m,y0-6,x0+xx*m,y0+6);  //zasechki na +x
    if xx=0 then xx+=0 else textout(x0+xx*m-5,y0+5,xx);
    line(x0-xx*m,y0-6,x0-xx*m,y0+6);  //zasechki na -x
    if xx=0 then xx+=0 else textout(x0-xx*m-5,y0+5,ot);
    line(x0-6,y0+xx*m,x0+6,y0+xx*m);  //zasechki na -y
    textout(x0+5,y0+xx*m-5,ot);
    line(x0-6,y0-xx*m,x0+6,y0-xx*m);  //zasechki na +y
    textout(x0+5,y0-xx*m-5,xx);
    
    xx+=1;
  end;
  x := l;
  while x <= p do
  begin
    y := ((1 * (x * x * x) + (-2) * (x * x) + (-3) * x + (3)));
    x1 := round(x0 + x * mx);
    y1 := round(y0 + y * my);
    setpixel(x1, y1, clBlue);
    x += 0.001
  end;
  Print('Откройте "во весь экран" и повторите a, b, n: ');
  read(a, b, n);Print(a,', ', b,', ', n);Println();
  h := (b - a) / n;
  x := a;
  xz := round(x0 + x * mx);
  y := ((1 * (x * x * x) + (-2) * (x * x) + (-3) * x + (3)));
  y1 := round(y0 + y * my);
  while x <= b do
  begin
    y := ((1 * (x * x * x) + (-2) * (x * x) + (-3) * x + (3)));
    x1 := round(x0 + x * mx);
    y1 := round(y0 + y * my);
    if m <40 then SetPenColor(clRed)else SetPenColor(clDarkGray);
    if x=a then x+=0 else line(xz, yz, x1, y1);
    if x=a then line(x1, y1, x1, y0) else line(x1, y1, x1, y0);
    xz := x1;
    yz := y1;
    x += h;
  end;
end;

function f(x: real): real;
begin
  f := (1 * (x * x * x) + ((-2) * (x * x)) + ((-3) * x) + 3);                  
end;

function f1(x: real): real;
begin
  f1 := (1 / 4) * (x * x * x * x) + (-2 / 3) * (x * x * x) + (-3 / 2) * (x * x) + (3 * x);         
end;

begin
  var  a, b, h, s, y: real;
  var n, g: integer;
  var x0, y0, m, x1, y1: integer;
  var l, p, x: real;
  repeat
    Print('Введите левую границу интервала от -5 до 5 a=');
    read(a); Print(a);Println();
  until (a >= -5) and (a <= 5);
  repeat
    Print('Введите правую границу интервала от a и от 0 до 10 b=');
    readln(b); Print(b);Println();
  until (b >= 0) and (b > a) and (b <= 10);
  repeat
    Print('Введите число промежутков от 20 до 1000 n=');
    readln(n); Print(n);     Println();
  until (n >= 20) and (n <= 1000);
  s := (f(a) + f(b)) / 2;  
  for var i := 1 to n - 1 do
  begin
    s := s + f(a + i * ((b - a) / n));
  end; 
  s *= (b - a) / n;
  y := f1(b) - f1(a);
  begin
    repeat
      q;
      read(g);
      case g of
        1: begin writeln('Приблизительное значение = ', Abs(s):0:5) end;
        2: begin writeln('Точное значение = ', Abs(y):0:5) end;
        3: begin writeln('Абсолютная погрешность = ', abs(y - s):0:5) end;
        4: begin writeln('Относительная погрешность = ', abs(y - s) / y) end;
        5: begin grafik end;
        6: begin Exit end;
      end;
    until g >= 6;
  end;
end.