program Poketlab;
uses crt;
var
  pilih : integer;

procedure Kalkulator;
var
  a, b : real;
  op   : char;
begin
  clrscr;
  write('Angka pertama: ');
  readln(a);
  write('Angka kedua  : ');
  readln(b);
  write('Operator (+ - * /): ');
  readln(op);

  case op of
    '+': writeln('Hasil = ', a + b:0:2);
    '-': writeln('Hasil = ', a - b:0:2);
    '*': writeln('Hasil = ', a * b:0:2);
    '/': if b = 0 then
           writeln('Tidak bisa dibagi nol')
         else
           writeln('Hasil = ', a / b:0:2);
  else
    writeln('Operator salah');
  end;
end;

procedure CekNilai;
var
  nilai : integer;
begin
  write('Masukkan nilai (0-100): ');
  readln(nilai);

  if (nilai < 0) or (nilai > 100) then
    writeln('Nilai harus 0 sampai 100')
  else
  begin
    if nilai >= 85 then
      writeln('Grade A')
    else if nilai >= 70 then
      writeln('Grade B')
    else if nilai >= 55 then
      writeln('Grade C')
    else if nilai >= 40 then
      writeln('Grade D')
    else
      writeln('Grade E');

    if nilai >= 55 then
      writeln('Status: SELAMAT,KAMU LULUS!')
    else
      writeln('Status: MAAF,KAMU BELUM LULUS');
  end;
end;

procedure TabelPerkalian;
var
  n, i : integer;
begin
  write('Tabel perkalian berapa? ');
  readln(n);
  for i := 1 to 10 do
    writeln(n, ' x ', i, ' = ', n * i);
end;

procedure TebakAngka;
var
  rahasia, tebakan, percobaan : integer;
  menang : boolean;
begin
  rahasia := random(20) + 1;
  percobaan := 0;
  menang := false;
  writeln('Tebak angka 1 sampai 20. Kesempatan 5 kali.');

  while percobaan < 5 do
  begin
    clrscr;
    write('Tebakan: ');
    readln(tebakan);

    if (tebakan < 1) or (tebakan > 20) then
    begin
      writeln('Angka harus 1 sampai 20.');
      continue;                 
    end;

    percobaan := percobaan + 1;
    if tebakan = rahasia then
    begin
      menang := true;
      break;                    
    end
    else if tebakan < rahasia then
      writeln('Terlalu kecil!')
    else
      writeln('Terlalu besar!');
  end;

  if menang then
    writeln('BENAR! Kamu menebak dalam ', percobaan, ' kali.')
  else
    writeln('Kesempatan habis. Jawabannya ', rahasia, '.');
end;


begin
  randomize;

  repeat
    writeln;
    writeln('========== MENU ==========');
    writeln('1. Kalkulator');
    writeln('2. Cek nilai');
    writeln('3. Tabel perkalian');
    writeln('4. Tebak angka');
    writeln('0. Keluar');
    write('Pilih menu: ');
    readln(pilih);

    case pilih of
      1: Kalkulator;
      2: CekNilai;
      3: TabelPerkalian;
      4: TebakAngka;
      0: writeln('Sampai jumpa lagi!');
    else
      writeln('Pilihan tidak valid.');
    end;
  until pilih = 0;
end.