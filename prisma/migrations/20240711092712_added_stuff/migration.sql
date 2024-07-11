/*
  Warnings:

  - Added the required column `productId` to the `Review` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Review` ADD COLUMN `productId` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `orderedItem` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productItemId` INTEGER NOT NULL,
    `orderId` INTEGER NOT NULL,

    UNIQUE INDEX `orderedItem_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `orderedItem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orderedItem` ADD CONSTRAINT `orderedItem_productItemId_fkey` FOREIGN KEY (`productItemId`) REFERENCES `ProductItem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orderedItem` ADD CONSTRAINT `orderedItem_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `ShoppingOrder`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
