
drop database if exists AmbiguityCodeSearch;
create database AmbiguityCodeSearch;
use AmbiguityCodeSearch;

drop table if exists codeocean;
create table codeocean (
id INT AUTO_INCREMENT,
hit_name VARCHAR(255) NOT NULL,
hit_seq VARCHAR(255) NOT NULL,
fw1_hit_score DECIMAL(20 , 19) NOT NULL,
fw1_hit_short BOOLEAN NOT NULL,
fw1_hit_raw VARCHAR(255) NOT NULL,
fw1_hit_align VARCHAR(255) NOT NULL,
fw1_hit_loc INT NOT NULL,
fw1_hit_pos VARCHAR(255) NOT NULL,
cdr1_hit_score DECIMAL(20 , 19) NOT NULL,
cdr1_hit_short BOOLEAN NOT NULL,
cdr1_hit_raw VARCHAR(255) NOT NULL,
cdr1_hit_align VARCHAR(255) NOT NULL,
cdr1_hit_loc INT NOT NULL,
cdr1_hit_pos VARCHAR(255) NOT NULL,
fw2_hit_score DECIMAL(20 , 19) NOT NULL,
fw2_hit_short BOOLEAN NOT NULL,
fw2_hit_raw VARCHAR(255) NOT NULL,
fw2_hit_align VARCHAR(255) NOT NULL,
fw2_hit_loc INT NOT NULL,
fw2_hit_pos VARCHAR(255) NOT NULL,
cdr2_hit_score DECIMAL(20 , 19) NOT NULL,
cdr2_hit_short BOOLEAN NOT NULL,
cdr2_hit_raw VARCHAR(255) NOT NULL,
cdr2_hit_align VARCHAR(255) NOT NULL,
cdr2_hit_loc INT NOT NULL,
cdr2_hit_pos VARCHAR(255) NOT NULL,
fw3_hit_score DECIMAL(20 , 19) NOT NULL,
fw3_hit_short BOOLEAN NOT NULL,
fw3_hit_raw VARCHAR(255) NOT NULL,
fw3_hit_align VARCHAR(255) NOT NULL,
fw3_hit_loc INT NOT NULL,
fw3_hit_pos VARCHAR(255) NOT NULL,
cdr3_hit_score DECIMAL(20 , 19) NOT NULL,
cdr3_hit_short BOOLEAN NOT NULL,
cdr3_hit_raw VARCHAR(255) NOT NULL,
cdr3_hit_align VARCHAR(255) NOT NULL,
cdr3_hit_loc INT NOT NULL,
cdr3_hit_pos VARCHAR(255) NOT NULL,
primary key (id)
)

 load data local infile '/Users/amirmanzour/Documents/GitHub/AmbiguityCodeSearch/33172_lc_codeocean.csv' 
 into table codeocean 
 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' 
 IGNORE 1 LINES
 (hit_name,hit_seq,fw1_hit_score,@fw1_hit_short,fw1_hit_raw,fw1_hit_align,fw1_hit_loc,fw1_hit_pos,cdr1_hit_score,@cdr1_hit_short,cdr1_hit_raw,cdr1_hit_align,cdr1_hit_loc,cdr1_hit_pos,fw2_hit_score,@fw2_hit_short,fw2_hit_raw,fw2_hit_align,fw2_hit_loc,fw2_hit_pos,cdr2_hit_score,@cdr2_hit_short,cdr2_hit_raw,cdr2_hit_align,cdr2_hit_loc,cdr2_hit_pos,fw3_hit_score,@fw3_hit_short,fw3_hit_raw,fw3_hit_align,fw3_hit_loc,fw3_hit_pos,cdr3_hit_score,@cdr3_hit_short,cdr3_hit_raw,cdr3_hit_align,cdr3_hit_loc,cdr3_hit_pos) 
 set fw1_hit_short = (@fw1_hit_short = 'True'), 
 cdr1_hit_short = (@cdr1_hit_short = 'True'), 
fw2_hit_short = (@fw2_hit_short = 'True'), 
cdr2_hit_short = (@cdr2_hit_short = 'True'), 
fw3_hit_short = (@fw3_hit_short = 'True'), 
cdr3_hit_short = (@cdr3_hit_short = 'True');

drop table if exists lgl;
create table lgl (
id INT AUTO_INCREMENT,
sequence_id VARCHAR(255) NOT NULL,
sequence VARCHAR(1000) NOT NULL,
locus VARCHAR(50) NOT NULL,
primary key (id)
)

load data local infile '/Users/amirmanzour/Documents/GitHub/AmbiguityCodeSearch/33172__IgL.tsv' 
 into table lgl 
 FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' 
 IGNORE 1 LINES
 (sequence_id,sequence,locus,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy,@dummy)