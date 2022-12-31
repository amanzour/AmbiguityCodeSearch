use AmbiguityCodeSearch;
select id,fw1_hit_raw,ishydrophobic(fw1_hit_raw) from codeocean limit 5;

DELIMITER //
CREATE FUNCTION ISHYDROPHOBIC(sequence VARCHAR(1000))
  RETURNS DECIMAL(3,2) DETERMINISTIC
  BEGIN
  DECLARE A INT;
  DECLARE V INT;
  DECLARE L INT;
  DECLARE I INT;
  DECLARE P INT;
  DECLARE F INT;
  DECLARE C INT;
  SET A = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'A', ''));
  SET V = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'V', ''));
  SET L = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'L', ''));
  SET I = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'I', ''));  
  SET P = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'P', ''));  
  SET F = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'F', ''));  
  SET C = CHAR_LENGTH(sequence) - CHAR_LENGTH( REPLACE ( sequence, 'C', ''));
  RETURN (CHAR_LENGTH(sequence) - A - V - L - I - P - F - C)/(CHAR_LENGTH(sequence) + 1);
  END //
  
with recursive hydrophobic(n,id,hit_name,hydrophobicity) as
(select 1 as n,id,hit_name, ISHYDROPHOBIC(fw1_hit_raw) as hydrophobicity from codeocean where ISHYDROPHOBIC(fw1_hit_raw) in 
(select max(ISHYDROPHOBIC(fw1_hit_raw)) from codeocean)
union all
select n+1,codeocean.id,codeocean.hit_name,ISHYDROPHOBIC(fw1_hit_raw) as hydrophobicity from codeocean inner join hydrophobic as h
on ISHYDROPHOBIC(codeocean.fw1_hit_raw) < h.hydrophobicity
and ISHYDROPHOBIC(codeocean.fw1_hit_raw) > (h.hydrophobicity - 0.05)
and codeocean.id != h.id
and n < 5
)
select * from hydrophobic




