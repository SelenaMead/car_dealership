create or replace function addCustomers(
	_first_name varchar(45),
	_last_name varchar(45),
	_address varchar(255)

)
returns void 
as $main$
begin 
	insert into public."public.customer" (first_name, last_name, address)
	values ( _first_name, _last_name, _address);
end
$main$

language plpgsql;

select addCustomers('Selena', 'Mead', '123 abc st')

select addCustomers('Harry', 'Potter', '456 def ave ')
