-- CreateTable
CREATE TABLE "customer" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(40),
    "cnpj" VARCHAR(14),
    "email" VARCHAR(40),
    "status" VARCHAR(7),

    CONSTRAINT "customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer_adress" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER,
    "street" VARCHAR(40),
    "number" INTEGER,
    "complement" VARCHAR(20),
    "cep" VARCHAR(8),
    "city" VARCHAR(20),
    "state" VARCHAR(20),

    CONSTRAINT "customer_adress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer_contact" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER,
    "phone" VARCHAR(11),
    "contact_name" VARCHAR(40),

    CONSTRAINT "customer_contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer_order" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER,
    "product_id" INTEGER,
    "order_date" DATE,
    "product" VARCHAR(20),
    "amount" INTEGER,
    "amount_type" VARCHAR(10),
    "unit_value" DECIMAL(10,2),
    "total_value" DECIMAL(10,2),

    CONSTRAINT "customer_order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stock" (
    "id" SERIAL NOT NULL,
    "product" VARCHAR(20),
    "amount" INTEGER,
    "amount_type" VARCHAR(10),
    "value" DECIMAL(10,2),

    CONSTRAINT "stock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(40),
    "cnpj" VARCHAR(14),
    "email" VARCHAR(40),
    "status" VARCHAR(7),

    CONSTRAINT "supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier_adress" (
    "id" SERIAL NOT NULL,
    "supplier_id" INTEGER,
    "street" VARCHAR(40),
    "neighborhood" VARCHAR(20),
    "number" INTEGER,
    "complement" VARCHAR(10),
    "cep" VARCHAR(8),
    "city" VARCHAR(20),
    "state" VARCHAR(20),

    CONSTRAINT "supplier_adress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier_contact" (
    "id" SERIAL NOT NULL,
    "supplier_id" INTEGER,
    "phone" VARCHAR(11),
    "contact_name" VARCHAR(40),

    CONSTRAINT "supplier_contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supplier_order" (
    "id" SERIAL NOT NULL,
    "supplier_id" INTEGER,
    "order_date" DATE,
    "product" VARCHAR(20),
    "amount" INTEGER,
    "amount_type" VARCHAR(10),
    "unit_value" DECIMAL(10,2),
    "total_value" DECIMAL(10,2),

    CONSTRAINT "supplier_order_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "customer_adress" ADD CONSTRAINT "customer_adress_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "customer_contact" ADD CONSTRAINT "customer_contact_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "customer_order" ADD CONSTRAINT "customer_order_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "customer_order" ADD CONSTRAINT "customer_order_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "stock"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "supplier_adress" ADD CONSTRAINT "supplier_adress_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "supplier"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "supplier_contact" ADD CONSTRAINT "supplier_contact_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "supplier"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "supplier_order" ADD CONSTRAINT "supplier_order_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "supplier"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE customer_adress
ADD COLUMN neighborhood VARCHAR(20);
