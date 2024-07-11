/*
  Warnings:

  - You are about to drop the column `houseNumer` on the `Address` table. All the data in the column will be lost.
  - Added the required column `houseNumber` to the `Address` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Address` DROP COLUMN `houseNumer`,
    ADD COLUMN `houseNumber` VARCHAR(191) NOT NULL;
