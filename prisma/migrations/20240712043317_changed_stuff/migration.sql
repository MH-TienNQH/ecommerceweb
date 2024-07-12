/*
  Warnings:

  - You are about to drop the column `color` on the `Color` table. All the data in the column will be lost.
  - You are about to drop the column `size` on the `Size` table. All the data in the column will be lost.
  - Added the required column `colorName` to the `Color` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sizeName` to the `Size` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Color` DROP COLUMN `color`,
    ADD COLUMN `colorName` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Size` DROP COLUMN `size`,
    ADD COLUMN `sizeName` VARCHAR(191) NOT NULL;
