/*
  Warnings:

  - You are about to drop the column `name` on the `Category` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `SubCategory` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `SubCategoryOption` table. All the data in the column will be lost.
  - Added the required column `categoryName` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subCategoryName` to the `SubCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subCategoryOptionName` to the `SubCategoryOption` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Category` DROP COLUMN `name`,
    ADD COLUMN `categoryName` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Product` ADD COLUMN `price` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SubCategory` DROP COLUMN `name`,
    ADD COLUMN `subCategoryName` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `SubCategoryOption` DROP COLUMN `name`,
    ADD COLUMN `subCategoryOptionName` VARCHAR(191) NOT NULL;
