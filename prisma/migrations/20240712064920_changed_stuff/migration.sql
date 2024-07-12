/*
  Warnings:

  - You are about to drop the column `method` on the `ShipMethod` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `ShipStatus` table. All the data in the column will be lost.
  - Added the required column `shipMethodName` to the `ShipMethod` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shipStatusName` to the `ShipStatus` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `ShipMethod` DROP COLUMN `method`,
    ADD COLUMN `shipMethodName` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `ShipStatus` DROP COLUMN `status`,
    ADD COLUMN `shipStatusName` VARCHAR(191) NOT NULL;
