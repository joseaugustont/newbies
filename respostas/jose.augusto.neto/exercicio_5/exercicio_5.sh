#!/bin/bash
# José Augusto Bezerra Neto - 116110917

# Filtra as conexões do tipo TCP/UDP.
lsof | grep -E '(UDP|TCP)' > file.txt

# Encontra os dois processos que mais fizeram conexões do tipo UDP.
cat file.txt | grep -E '(UDP)' | awk '{print $1}' | sort | uniq -c | sort -n -r | head -n 2 | awk '{print $2}' > file_udp.txt

# Encontra os dois processos que mais fizeram conexões do tipo TCP.
cat file.txt | grep -E '(TCP)' | awk '{print $1}' | sort | uniq -c | sort -n -r | head -n 2 | awk '{print $2}' > file_tcp.txt

# Imprime os resultados.
echo "====== TOP ======"
echo ""
echo "TOP conexões UDP:"
for udp in $(cat file_udp.txt); do
	echo "* $udp"
done
echo ""
echo "TOP conexões TCP:"
for tcp in $(cat file_tcp.txt); do
	echo "* $tcp"
done

# Filtrando as conexões do tipo TCP de acordo com o estado em que se encontram.
LISTEN=$(cat file.txt | grep -E '(TCP)' | grep -E '(LISTEN)' | wc -l)
ESTABLISHED=$(cat file.txt | grep -E '(TCP)' | grep -E '(ESTABLISHED)' | wc -l)
SYN_SENT=$(cat file.txt | grep -E '(TCP)' | grep -E '(SYN_SENT)' | wc -l)
CLOSE_WAIT=$(cat file.txt | grep -E '(TCP)' | grep -E '(CLOSE_WAIT)' | wc -l)

# Imprime os resultados.
echo ""
echo "====== TCP ======"
echo ""
echo "LISTEN: $LISTEN"
echo "ESTABLISHED: $ESTABLISHED"
echo "SYN_SENT: $SYN_SENT"
echo "CLOSE_WAIT: $CLOSE_WAIT"

# Remoção de arquivos temporários.
rm file.txt file_udp.txt file_tcp.txt

