#!/usr/bin/perl

$data = `rrdtool fetch weather.rrd AVERAGE --start 'now-12h' --end 'now-12h'|tail -1`;
@pairs=split(/ /,$data);
$Pressure_12h=$pairs[3];

$data = `rrdtool fetch weather.rrd AVERAGE --start 'now-9h' --end 'now-9h'|tail -1`;
@pairs=split(/ /,$data);
$Pressure_9h=$pairs[3];

$data = `rrdtool fetch weather.rrd AVERAGE --start 'now-6h' --end 'now-6h'|tail -1`;
@pairs=split(/ /,$data);
$Pressure_6h=$pairs[3];

$data = `rrdtool fetch weather.rrd AVERAGE --start 'now-3h' --end 'now-3h'|tail -1`;
@pairs=split(/ /,$data);

#print @pairs."\n";
#foreach $pair (@pairs)
#   {
#   print "$pair\n"
#   }

$Datum_3h=$pairs[0];
$Tempin_3h=$pairs[1];
$Tempout_3h=$pairs[2];
$Pressure_3h=$pairs[3];

#print "Datum:    ".$Datum_3h."\n";
#printf "TempIn:   %5.2f\n",$Tempin_3h;
#printf "TempOut:  %5.2f\n",$Tempout_3h;
#printf "Pressure: %5.2f\n",$Pressure_3h;

$data = `rrdtool lastupdate weather.rrd|tail -1`;
@pairs=split(/ /,$data);

$Datum_now=$pairs[0];
$Tempin_now=$pairs[1];
$Tempout_now=$pairs[2];
$Empty_now=$pairs[3];
$Pressure_now=$pairs[4];

#print "Datum:    ".$Datum_now."\n";
#printf "TempIn:   %5.2f\n",$Tempin_now;
#printf "TempOut:  %5.2f\n",$Tempout_now;
printf "Pressure (now)     : %5.2f\n",$Pressure_now;

$DruckDelta=$Pressure_now-$Pressure_3h;
printf "Druckaenderung (3h): %5.2f\n",$DruckDelta;
$DruckDelta=$Pressure_now-$Pressure_6h;
printf "Druckaenderung (6h): %5.2f\n",$DruckDelta;
$DruckDelta=$Pressure_now-$Pressure_9h;
printf "Druckaenderung (9h): %5.2f\n",$DruckDelta;
$DruckDelta=$Pressure_now-$Pressure_12h;
printf "Druckaenderung (12h): %5.2f\n",$DruckDelta;

