/*
  Warnings:

  - You are about to drop the column `neighborhood` on the `customer_adress` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "customer_adress" ADD COLUMN "neighborhood" VARCHAR(20);
