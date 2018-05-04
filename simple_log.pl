use POSIX qw(strftime);

sub echoLog {
	my ($type,$msg) = @_;
	my ($package, $filename, $line) = caller;
	
	if(logFileOpened) {
		print LOGFILEHANDLER strftime("%Y/%m/%d %H:%M:%S",localtime(time))." ".$line."    [$type] $msg\n";
	}
}

##########
## MAIN ##
##########

our $LOGFILE = "./logfile.log";

open(LOGFILEHANDLER,">>$LOGFILE");

echoLog 'INFO', "Testing execution line number";

close(LOGFILEHANDLER);
