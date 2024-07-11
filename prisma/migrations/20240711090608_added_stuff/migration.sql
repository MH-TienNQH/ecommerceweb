/*
  Warnings:

  - You are about to drop the `address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `productCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `productConfig` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `productItem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `subCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `subCategoryOption` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `address` DROP FOREIGN KEY `address_userId_fkey`;

-- DropForeignKey
ALTER TABLE `productCategory` DROP FOREIGN KEY `productCategory_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `productCategory` DROP FOREIGN KEY `productCategory_productId_fkey`;

-- DropForeignKey
ALTER TABLE `productConfig` DROP FOREIGN KEY `productConfig_productItemId_fkey`;

-- DropForeignKey
ALTER TABLE `productConfig` DROP FOREIGN KEY `productConfig_subCategoryOptionId_fkey`;

-- DropForeignKey
ALTER TABLE `productItem` DROP FOREIGN KEY `productItem_productId_fkey`;

-- DropForeignKey
ALTER TABLE `subCategory` DROP FOREIGN KEY `subCategory_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `subCategoryOption` DROP FOREIGN KEY `subCategoryOption_subCategoryId_fkey`;

-- DropTable
DROP TABLE `address`;

-- DropTable
DROP TABLE `product`;

-- DropTable
DROP TABLE `productCategory`;

-- DropTable
DROP TABLE `productConfig`;

-- DropTable
DROP TABLE `productItem`;

-- DropTable
DROP TABLE `subCategory`;

-- DropTable
DROP TABLE `subCategoryOption`;

-- DropTable
DROP TABLE `users`;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('Admin', 'User') NOT NULL DEFAULT 'User',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Address` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `house_numer` VARCHAR(191) NOT NULL,
    `address_line` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `country` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Address_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `desc` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Product_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductCategory` (
    `productId` INTEGER NOT NULL,
    `categoryId` INTEGER NOT NULL,

    PRIMARY KEY (`productId`, `categoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubCategory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `categoryId` INTEGER NOT NULL,

    UNIQUE INDEX `SubCategory_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubCategoryOption` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `subCategoryId` INTEGER NOT NULL,

    UNIQUE INDEX `SubCategoryOption_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductItem` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `image` VARCHAR(191) NOT NULL,
    `price` INTEGER NOT NULL,
    `SKU` VARCHAR(191) NOT NULL,
    `inStock` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,

    UNIQUE INDEX `ProductItem_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductConfig` (
    `productItemId` INTEGER NOT NULL,
    `subCategoryOptionId` INTEGER NOT NULL,

    PRIMARY KEY (`productItemId`, `subCategoryOptionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductCategory` ADD CONSTRAINT `ProductCategory_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductCategory` ADD CONSTRAINT `ProductCategory_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubCategory` ADD CONSTRAINT `SubCategory_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubCategoryOption` ADD CONSTRAINT `SubCategoryOption_subCategoryId_fkey` FOREIGN KEY (`subCategoryId`) REFERENCES `SubCategory`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductItem` ADD CONSTRAINT `ProductItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductConfig` ADD CONSTRAINT `ProductConfig_productItemId_fkey` FOREIGN KEY (`productItemId`) REFERENCES `ProductItem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductConfig` ADD CONSTRAINT `ProductConfig_subCategoryOptionId_fkey` FOREIGN KEY (`subCategoryOptionId`) REFERENCES `SubCategoryOption`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
