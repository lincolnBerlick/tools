
use strict;
use warnings;
 
 
 
 
 
my @Ips = qw(191.111.111.111 191.111.111.111 255.255.255.0); #by order initial_Ip,Gateway, Mask
my $finalip = 256;
my $text = undef;


my $lastipnumber = ($Ips[0] =~ /(\d+$)/); #get the last number of initial_Ip
($Ips[0]) = ($Ips[0] =~  /(\d+\.\d+\.\d+)/);  #substact final number  of  initial_Ip


	while($lastipnumber < $finalip ){

		 $text .= "iface eth0:$finalip inet static
			   address $Ips[0].$lastipnumber
			   gateway $Ips[1]
			   netmask $Ips[2]
			   dns-nameservers 8.8.8.8 8.8.4.4 \n \n";
	$lastipnumber++	

}


	#print txt with range ips
	open(my $fh, '>', 'ips.txt');
	print $fh "$text";
	close $fh;
	print "Done\n";
