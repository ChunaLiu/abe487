.PHONY: all fasta features test clean

all: clean fasta genome chr-count chr-size features gene-count verified-genes uncharacterized-genes gene-types palinsreg terminated-genes

clean:
	find . \( -name \*gene\* -o -name chr-\* \) -exec rm {} \;

fasta:
	#echo "Download files into \"fasta\" directory"
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr01.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr02.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr03.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr04.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr05.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr06.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr07.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr08.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr09.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr10.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr11.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr12.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr13.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr14.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr15.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chr16.fsa -P ./fasta
	#wget http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/chrmt.fsa -P ./fasta
	wget -r --level=1 -np -nd -e robots=off -A chr*.fsa http://downloads.yeastgenome.org/sequence/S288C_reference/chromosomes/fasta/ -P ./fasta/
genome: fasta
	#echo OK > fasta/genome.fa
	#if we want to cat only chr(01-16).fsa
	cat fasta/chr[0-9]*.fsa > fasta/genome.fa
	#cat fasta/*.fsa > fasta/genome.fa
chr-count: genome
	#echo OK > chr-count
	grep '>' fasta/genome.fa |wc -l > chr-count
chr-size: genome
	#echo OK > chr-size
	wc -c fasta/genome.fa|awk '{print $$1}' > chr-size
features:
	#echo "Download SGD_features.tab"
	wget http://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab
gene-count: features
	#echo OK > gene-count
	awk '{print $$2}' SGD_features.tab |grep "ORF" |wc -l > gene-count
verified-genes: features
	#echo OK > verified-genes
	awk '{print $$3}' SGD_features.tab |grep 'Verified' |wc -l > verified-genes
uncharacterized-genes: features
	#echo OK > uncharacterized-genes
	awk '{print $$3}' SGD_features.tab |grep 'Uncharacterized' |wc -l > uncharacterized-genes
gene-types: features
	#echo OK > gene-types
	awk '{print $$2}' SGD_features.tab | sort |uniq |wc -l > gene-types
palinsreg:
	#echo "Download palinsreg"
	wget ftp://ftp.imicrobe.us/abe487/yeast/palinsreg.txt
terminated-genes: palinsreg
	#echo OK > terminated-genes
	grep -o '/G=[^ ]*' palinsreg.txt| cut -c 4-8| sort| uniq > terminated-genes
test:
	./test.pl6
