/*
  Warnings:

  - You are about to drop the column `address_line` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `house_numer` on the `Address` table. All the data in the column will be lost.
  - Added the required column `addressLine` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `houseNumer` to the `Address` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Address` DROP COLUMN `address_line`,
    DROP COLUMN `house_numer`,
    ADD COLUMN `addressLine` VARCHAR(191) NOT NULL,
    ADD COLUMN `houseNumer` VARCHAR(191) NOT NULL;
