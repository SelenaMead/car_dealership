
 CREATE TABLE "public.sales_person" (
	"sales_person_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "sales_person_pk" PRIMARY KEY ("sales_person_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customer" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	"serial_number" serial NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.invoice" (
	"invoice_id" serial NOT NULL,
	"customer_id" serial NOT NULL,
	"sales_person_id" serial NOT NULL,
	"serial_number" serial NOT NULL,
	"payment" float8 NOT NULL,
	CONSTRAINT "invoice_pk" PRIMARY KEY ("invoice_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.inventory" (
	"serial_number" serial NOT NULL,
	"make" varchar(255) NOT NULL,
	"model" varchar(255) NOT NULL,
	"year" varchar(255) NOT NULL,
	"color" varchar(255) NOT NULL,
	"sold" BOOLEAN NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("serial_number")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.mechanic" (
	"mechanic_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "mechanic_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.service_ticket" (
	"service_ticket_id" serial NOT NULL,
	"customer_id" serial NOT NULL,
	"mechanic_id" serial NOT NULL,
	"serial_number" serial NOT NULL,
	"new_parts" BOOLEAN NOT NULL,
	CONSTRAINT "service_ticket_pk" PRIMARY KEY ("service_ticket_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "public.customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("serial_number") REFERENCES "public.inventory"("serial_number");

ALTER TABLE "public.invoice" ADD CONSTRAINT "invoice_fk0" FOREIGN KEY ("customer_id") REFERENCES "public.customer"("customer_id");
ALTER TABLE "public.invoice" ADD CONSTRAINT "invoice_fk1" FOREIGN KEY ("sales_person_id") REFERENCES "public.sales_person"("sales_person_id");
ALTER TABLE "public.invoice" ADD CONSTRAINT "invoice_fk2" FOREIGN KEY ("serial_number") REFERENCES "public.inventory"("serial_number");



ALTER TABLE "public.service_ticket" ADD CONSTRAINT "service_ticket_fk0" FOREIGN KEY ("customer_id") REFERENCES "public.customer"("customer_id");
ALTER TABLE "public.service_ticket" ADD CONSTRAINT "service_ticket_fk1" FOREIGN KEY ("mechanic_id") REFERENCES "public.mechanic"("mechanic_id");
ALTER TABLE "public.service_ticket" ADD CONSTRAINT "service_ticket_fk2" FOREIGN KEY ("serial_number") REFERENCES "public.inventory"("serial_number");
