??    G      T  a   ?        b     #   t     ?     ?     ?  )   ?  	     3        J  ?   f      ?  ,     $   C     h      }     ?     ?  #   ?  !   	     #	     7	  <   P	  <   ?	  <   ?	  %   
      -
     N
     m
     ?
     ?
     ?
     ?
     ?
     ?
  &        9     X     m     ?  $   ?  C   ?       &        D     U  ?  o  H     (   _  E  ?  ?   ?  .   ?  F   ?  "      -   #     Q     q  2   ?  $   ?  ,   ?  '   	  '   1     Y     `     t     ?     ?     ?     ?     ?     ?  
  ?  l   ?  $   <     a     ?     ?  -   ?     ?  =   ?     -  ?   M  &   ?  7     *   ?     j  &   ?  $   ?  $   ?  1   ?  %   ,     R  *   q  :   ?  :   ?  :     %   M      s      ?      ?     ?     ?               ;     X  )   w  #   ?     ?     ?      ?       B   ;     ~  !   ?     ?     ?    ?  N    "  )   O"  j  y"  ?   ?#  ;   ?$  G   ?$     +%  2   K%  "   ~%     ?%  1   ?%  (   ?%  1   &  #   A&  3   e&     ?&     ?&     ?&     ?&     ?&     ?&     ?&  	    '     
'     :   7   -   &       ?          /   	      (            !   %             =   @                '          0   5                 )   D          $                     +       C      4   F   ,       3   "       E       .             <   B   9          ;   6                               G   #   A   2                 1       
   >      *              8          -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
 CPU Times
  This Process    (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Child processes (user system guest):       %6.2f %6.2f %6.2f
 Can't get terminal capabilities
 Cannot allocate memory for matched proc: %s
 Cannot find socket's device number.
 Cannot find user %s
 Cannot open /proc directory: %s
 Cannot open /proc/net/unix: %s
 Cannot open a network socket.
 Cannot open protocol file "%s": %s
 Cannot resolve local port %s: %s
 Cannot stat %s: %s
 Cannot stat file %s: %s
 Copyright (C) 1993-2009 Werner Almesberger and Craig Small

 Copyright (C) 1993-2010 Werner Almesberger and Craig Small

 Copyright (C) 1993-2012 Werner Almesberger and Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 Press return to close
 Process with pid %d does not exist.
 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 TERM is not set
 Unknown local port AF %d
 Usage: fuser [-fMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE] [-k [-i] [-SIGNAL]] NAME...
       fuser -l
       fuser -V
Show which processes use the named files, sockets, or filesystems.

  -a,--all              display unused files too
  -i,--interactive      ask before killing (ignored without -k)
  -k,--kill             kill processes accessing the named file
  -l,--list-signals     list available signal names
  -m,--mount            show all processes using the named filesystems or block device
  -M,--ismountpoint     fulfill request only if NAME is a mount point
  -n,--namespace SPACE  search in this name space (file, udp, or tcp)
  -s,--silent           silent operation
  -SIGNAL               send this signal instead of SIGKILL
  -u,--user             display user IDs
  -v,--verbose          verbose output
  -w,--writeonly        kill only processes with write access
  -V,--version          display version information
 Usage: killall [-Z CONTEXT] [-u USER] [ -eIgiqrvw ] [ -SIGNAL ] NAME...
 Usage: killall [OPTION]... [--] NAME...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 output 8 bit clean streams.
    -n don't display read/write from fd headers.
    -c peek at any new child processes too.
    -d remove duplicate read/writes from the output.
    -V prints version info.
    -h prints this help.

  Press CTRL-C to end output.
 Usage: prtstat [options] PID ...
       prtstat -V
Print information about a process
    -r,--raw       Raw display of information
    -V,--version   Display version information and exit
 You can only use files with mountpoint options You cannot search for only IPv4 and only IPv6 sockets at the same time You must provide at least one PID. all option cannot be used with silent option. asprintf in print_stat failed.
 fuser (PSmisc) %s
 killall: %s lacks process entries (not mounted ?)
 killall: Bad regular expression: %s
 killall: Cannot get UID from process status
 killall: Maximum number of names is %d
 killall: skipping partial match %s(%d)
 paging peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running sleeping traced unknown zombie Project-Id-Version: psmisc 22.20rc1
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2013-10-09 17:30+1100
PO-Revision-Date: 2012-09-28 15:17+0200
Last-Translator: Tomislav Krznar <tomislav.krznar@gmail.com>
Language-Team: Croatian <lokalizacija@linux.hr>
Language: hr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Generator: Lokalize 1.4
   -4,--ipv4             pretraži samo IPv4 utičnice
  -6,--ipv6             pretraži samo IPv6 utičnice
 %*s KORISNIK    PID PRISTUP NAREDBA
 %s je prazan (nije montiran?)
 %s: Neispravna opcija %s
 %s: proces nije pronađen
 %s: nepoznat signal; %s -l ispisuje signale.
 (nepoznato) /proc nije montiran, ne mogu izvršiti stat /proc/self/stat.
 Neispravan regularni izraz: %s
 CPU vremena
  Ovaj proces   (korisnik sustav gost blkio): %6.2f %6.2f %6.2f %6.2f
  Procesi djeca (korisnik sustav gost):       %6.2f %6.2f %6.2f
 Ne mogu otkriti mogućnosti terminala
 Ne mogu alocirati memoriju za odgovarajući proces: %s
 Ne mogu pronaći broj uređaja utičnice.
 Ne mogu pronaći korisnika %s
 Ne mogu otvoriti direktorij /proc: %s
 Ne mogu otvoriti /proc/net/unix: %s
 Ne mogu otvoriti mrežnu utičnicu.
 Ne mogu otvoriti datoteku protokola „%s”: %s
 Ne mogu odrediti lokalni port %s: %s
 Ne mogu izvršiti stat %s: %s
 Ne mogu izvršiti stat na datoteci %s: %s
 Copyright (C) 1993-2009 Werner Almesberger i Craig Small

 Copyright (C) 1993-2010 Werner Almesberger i Craig Small

 Copyright (C) 1993-2012 Werner Almesberger i Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Ne mogu prekinuti proces %d: %s
 Greška pridruživanja pid-u %i
 Neispravno ime prostora imena Neispravna opcija Neispravan oblik vremena Prekinuti %s(%s%d) ? (d/N)  Prekinuti proces %d ? (d/N)  Prekinut %s(%s%d) signalom %d
 Opcija prostora imena zahtijeva argument. Nije navedena specifikacija procesa Nisu pronađeni procesi.
 Nema takvog korisnika: %s
 Pritisnite return za zatvaranje
 Proces s pid-om %d ne postoji.
 Proces: %-14s		Stanje: %c (%s)
  CPU#:  %-3d		TTY: %s	Dretve: %ld
 Signal %s(%s%d) ? (d/N)  Navedena datoteka %s ne postoji.
 TERM nije postavljen
 Nepoznati lokalni port AF %d
 Uporaba: fuser [-fMuvw] [-a|-s] [-4|-6] [-c|-m|-n PROSTOR] [-k [-i] [-SIGNAL]] IME...
         fuser -l
         fuser -V
Prikaži koji procesi koriste navedene datoteke, utičnice ili datotečne sustave.

  -a,--all              prikaži i nekorištene datoteke
  -i,--interactive      pitaj prije prekidanja (zanemareno bez -k)
  -k,--kill             prekini procese koji pristupaju navedenoj datoteci
  -l,--list-signals     ispiši imena dostupnih signala
  -m,--mount            prikaži sve procese koji koriste navedene datotečne sustave ili blokovske uređaje
  -M,--ismountpoint     izvrši zahtjev samo ako je IME točka montiranja
  -n,--namespace=PROSTOR  traži u ovom prostoru imena (file, udp ili tcp)
  -s,--silent           tihi rad (bez ispisa)
  -SIGNAL               pošalji ovaj signal umjesto SIGKILL
  -u,--user             prikaži korisničke oznake (ID)
  -v,--verbose          opširan ispis
  -w,--writeonly        prekini samo procese s dozvolom pisanja
  -V,--version          prikaži informacije o inačici
 Uporaba: killall [-Z KONTEKST] [-u KORISNIK] [ -eIgiqrvw ] [ -SIGNAL ] IME...
 Uporaba: killall [OPCIJA]... [--] IME...
 Uporaba: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 ispiši 8-bitne čiste tokove podataka.
    -n ne prikazuj čitanje/pisanje iz fd zaglavlja.
    -c također gledaj i nove procese djecu.
    -d ukloni duplikate čitanja/pisanja iz izlaza.
    -V ispiši informacije o inačici.
    -h ispiši ovu pomoć.

  Pritisnite CTRL-C za kraj ispisa.
 Uporaba: prtstat [opcije] PID ...
         prtstat -V
Ispiši informacije o procesu
    -r,--raw       Neobrađeni prikaz informacija
    -V,--version   Prikaži informacije o inačici i izađi
 Smijete koristiti samo datoteke uz opcije točke montiranja Ne možete pretraživati samo IPv4 i samo IPv6 utičnice u isto vrijeme Morate navesti barem jedan PID. opcija all se ne može koristiti uz opciju silent. asprintf u print_stat nije uspio.
 fuser (PSmisc) %s
 killall: %s nema zapise procesa (nije montiran?)
 killall: Neispravan regularni izraz: %s
 killall: Ne mogu dohvatiti UID iz stanja procesa
 killall: Najveći broj imena je %d
 killall: preskačem djelomično podudaranje %s(%d)
 straničenje peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 pokrenut u mirovanju praćen nepoznato zombi 