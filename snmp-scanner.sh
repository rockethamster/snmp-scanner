echo "---------------------------------------"
echo "SNMP SCANNER"
echo "---------------------------------------"
echo "Usage: ./snmpscan.sh <community string> <IP>"
echo "---------------------------------------"
echo "Targeting $2"
echo "---------------------------------------"
echo "Using the community string $1"
echo "---------------------------------------"
echo "Enumerating users..."
echo "---------------------------------------"
echo "Enumerating users..." > snmp-$2.txt
snmpwalk -c $1 -v1 $2 1.3.6.1.4.1.77.1.2.25 | cut -d " " -f 4 | sed -e 's/"//g' >> snmp-$2.txt
echo "Enumerating Processes...."
echo "---------------------------------------"
echo "---------------------------------------" >> snmp-$2.txt
echo "Processes Detected" >> snmp-$2.txt
echo "---------------------------------------" >> snmp-$2.txt
snmpwalk -c $1 -v1 $2 1.3.6.1.2.1.25.4.2.1.2 | cut -d " " -f 4 | sed -e 's/"//g' >> snmp-$2.txt
echo "Enumerating open ports....."
echo "---------------------------------------"
echo "---------------------------------------" >> snmp-$2.txt
echo "Open Ports Detected" >> snmp-$2.txt
echo "---------------------------------------" >> snmp-$2.txt
snmpwalk -c $1 -v1 $2 1.3.6.1.2.1.6.13.1.3 | cut -d " " -f 4 | sed -e 's/"//g' >> snmp-$2.txt
echo "Enumerating installed software...."
echo "---------------------------------------"
echo "---------------------------------------" >> snmp-$2.txt
echo "Installed Software"  >> snmp-$2.txt
echo "---------------------------------------" >> snmp-$2.txt
snmpwalk -c $1 -v1 $2 1.3.6.1.2.1.25.6.3.1.2 | cut -d \" -f 2 >> snmp-$2.txt
echo "---------------------------------------"
echo "        Scan complete for $2"
echo "---------------------------------------"
echo "        Results saved to               "
echo "         snmp-$2.txt                "
echo "---------------------------------------"
cat snmp-$2.txt
