/*
  Warnings:

  - You are about to drop the `ProductConfig` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubCategoryOption` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `color` to the `ProductItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `size` to the `ProductItem` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `ProductConfig` DROP FOREIGN KEY `ProductConfig_productItemId_fkey`;

-- DropForeignKey
ALTER TABLE `ProductConfig` DROP FOREIGN KEY `ProductConfig_subCategoryOptionId_fkey`;

-- DropForeignKey
ALTER TABLE `SubCategory` DROP FOREIGN KEY `SubCategory_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `SubCategoryOption` DROP FOREIGN KEY `SubCategoryOption_subCategoryId_fkey`;

-- AlterTable
ALTER TABLE `ProductItem` ADD COLUMN `color` VARCHAR(191) NOT NULL,
    ADD COLUMN `size` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `ProductConfig`;

-- DropTable
DROP TABLE `SubCategory`;

-- DropTable
DROP TABLE `SubCategoryOption`;

-- CreateTable
CREATE TABLE `Size` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `size` VARCHAR(191) NOT NULL,
    `productId` INTEGER NOT NULL,

    UNIQUE INDEX `Size_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Color` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `color` VARCHAR(191) NOT NULL,
    `productId` INTEGER NOT NULL,

    UNIQUE INDEX `Color_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Size` ADD CONSTRAINT `Size_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Color` ADD CONSTRAINT `Color_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
