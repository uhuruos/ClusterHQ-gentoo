??    C      4  Y   L      ?  Q  ?  `   	  b   d	  0   ?	  p   ?	  k   i
  #   ?
     ?
          -  )   C  	   m  3   w     ?      ?  ,   ?  $        :      O     p     ?  #   ?  !   ?     ?     	  <   "  <   _  %   ?      ?     ?               4     C     W     n     ?  &   ?     ?     ?       ?        ?  $     C   8     |  &   ?     ?     ?  H   ?  (   0  E  Y  ?   ?  .   [  F   ?  "   ?  -   ?     "     B     U     i     ~     ?     ?     ?     ?  w  ?  ?  *  i   ?  |     2   ?  v   ?  ?   D  &   ?                4  *   P     {  A   ?  !   ?  ,   ?  0     &   F     m  $   ?  #   ?  $   ?  (   ?  $   "     G  "   f  ;   ?  ;   ?  $        &      F     g     ?     ?     ?     ?     ?     ?  *      !   A      c      }   ?  ?      "  &   ="  I   d"     ?"  !   ?"     ?"     #  T   #  .   s#  h  ?#  ?   %  7   ?%  D   &  '   K&  D   s&  $   ?&     ?&     ?&     '     '     -'     2'     8'     ?'                   -         3   >   !      5                     )         "   %   B                            
   A              +   6              4   '       /         C   2   .   $       (      ,             8   7                   =      0              @   *       :             ?       #   1   &   ;   	   <   9                  killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          don't print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
   -                     reset options

  udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
   -Z     show         SELinux security contexts
   -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
   PID    start at this PID; default is 1 (init)
  USER   show only trees rooted at processes of this user

 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
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

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 PSmisc comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under
the terms of the GNU General Public License.
For more information about these matters, see the files named COPYING.
 Press return to close
 Process with pid %d does not exist.
 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 TERM is not set
 Unknown local port AF %d
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
 peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running sleeping unknown zombie Project-Id-Version: psmisc 22.11-pre1
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2013-10-09 17:30+1100
PO-Revision-Date: 2010-06-07 18:11+0100
Last-Translator: Daniel Nylander <po@danielnylander.se>
Language-Team: Swedish <tp-sv@listor.tp-sv.se>
Language: sv
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
        killall -l, --list
       killall -V, --version

  -e,--exact          kräver exakt matchning för väldigt långa namn
  -I,--ignore-case    ingen skillnad på gemener/versaler vid namnmatchning
  -g,--process-group  döda processgrupp istället för process
  -y,--younger-than   döda processer yngre än TID
  -o,--older-than     döda processer äldre än TID
  -i,--interactive    fråga efter bekräftelse före dödandet
  -l,--list           lista alla kända signalnamn
  -q,--quiet          skriv inte ut klagomål
  -r,--regexp         tolka NAMN som ett utökat reguljärt uttryck
  -s,--signal SIGNAL  skicka signal istället för SIGTERM
  -u,--user ANVÄNDARE döda endast process(er) som körs som ANVÄNDARE
  -v,--verbose        rapportera om signalen blev skickad korrekt
  -V,--version        visa versionsinformation
  -w,--wait           vänta tills processerna är döda
   -                     nollställ flaggor

  udp/tcp-namn: [lokal_port][,[fjärrvärd][,[fjärrport]]]

   -4,--ipv4             sök endast bland IPv4-uttag (socket)
  -6,--ipv6             sök endast bland IPv6-uttag (socket)
   -Z     show         SELinux-säkerhetskontexter
   -Z,--context REGEXP döda endast process(er) som har kontext
                      (måste föregå andra argument)
   PID    starta vid denna PID; standardvärde är 1 (init)
  ANVÄNDARE   visa endast träd med denna användares
              processer som rot.

 %*s ANVÄNDARE   PID ÅTKOMS KOMMANDO
 %s är tom (inte monterad?)
 %s: Ogiltig flagga %s
 %s: ingen process hittades
 %s: okänd signal; %s -l listar signaler.
 (okänd) /proc är inte monterad, kan inte ta status på /proc/self/stat.
 Felaktigt reguljärt uttryck: %s
 Kan inte ta reda på terminalens förmågor
 Kan inte allokera minne för matchande proc: %s
 Kan inte hitta uttagets enhetsnummer.
 Kan inte hitta användare %s
 Kan inte öppna katalogen /proc: %s
 Kan inte öppna /proc/net/unix: %s
 Kan inte öppna ett nätverksuttag.
 Kan inte öppna protokollfilen "%s": %s
 Kan inte slå upp lokal port %s: %s
 Kan inte ta status på %s: %s
 Kan inte ta status på fil %s: %s
 Copyright © 1993-2009 Werner Almesberger och Craig Small

 Copyright © 1993-2010 Werner Almesberger och Craig Small

 Copyright © 2007 Trent Waddington

 Copyright © 2009 Craig Small

 Kunde inte döda process %d: %s
 Fel vid koppling till pid %i
 Ogiltigt namn för namnrymd Ogiltig flagga Ogiltigt tidsformat Döda %s(%s%d) ? (y/N)  Döda process %d ? (y/N)  Dödade %s(%s%d) med signal %d
 Flagga för namnrymd kräver ett argument. Ingen processpecifikation angiven Inga processer hittades.
 Ingen sådan användare: %s
 PSmisc kommer med ABSOLUT INGEN GARANTI.
Detta är fri programvara och du är välkommen att distribuera den under
villkoren för GNU General Public License.
För mer information om dessa villkor, se filerna kallade COPYING.
Följande text är en informell översättning som enbart tillhandahålls
i informativt syfte. För alla juridiska tolkningar gäller den engelska originaltexten.
 Tryck Retur för att stänga
 Någon process med pid %d finns inte.
 Process: %-14s		Tillstånd: %c (%s)
  Proc.:  %-3d		TTY: %s	Trådar: %ld
 Signalera %s(%s%d) ? (y/N)  Angivna filnamnet %s finns inte.
 TERM är inte inställd
 Okänt lokal port AF %d
 Användning: killall [-Z KONTEXT] [-u ANVÄNDARE] [ -eIgiqrvw ] [ -SIGNAL ] NAMN...
 Användning: killall [FLAGGA]... [--] NAMN...
 Användning: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 skriv ut 8-bitars rena strömmar.
    -n visa inte läs/skriv från fd-huvuden.
    -c titta även på alla nya barnprocesser.
    -d Ta bort dubletter av läs/skriv från utdata.
    -V visar versionsinformation.
    -h visar den här hjälpen.

  Tryck CTRL-C för att avsluta utdata.
 Användning: prtstat [flaggor] PID ...
       prtstat -V
Skriv ut information om en process
    -r,--raw       Rå visning av information
    -V,--version   Visa versionsinformation och avsluta
 Du kan endast använda filer med monteringspunktflaggor Du kan inte söka efter endast IPv4- och endast IPv6-uttag samtidigt Du måste tillhandahålla minst en PID. flagga för alla, -m,  kan inte användas med flaggan för tyst, -s. asprintf i print_stat misslyckades.
 fuser (PSmisc) %s
 peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 kör sover okänd zombie 