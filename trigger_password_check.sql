delimiter $$
create or replace trigger password_check before insert on users
 for each row
  begin
  if new.password = '' then
  signal sqlstate '45000';
  end if;
  end;$$

