DROP TABLE IF EXISTS `aviability`;
CREATE TABLE `aviability` (
    `ID` int(11) NOT NULL,
    `Chip` varchar(100) NOT NULL,
    `Model` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
    `Supplier` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `Link` varchar(300) COLLATE utf8_spanish_ci NOT NULL,  
    `On_stock` BOOLEAN,
    `notified` BOOLEAN
    
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `history_of_back_to_stock`;
CREATE TABLE `history_of_back_to_stock` (
    `ID` int(11) NOT NULL,
    `FK_aviability` int(11) NOT NULL,
    `Chip` int(11) NOT NULL,
    `Model` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
    `Supplier` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `Link` varchar(100) COLLATE utf8_spanish_ci NOT NULL,  
    `On_stock` BOOLEAN,
    `Change_of_status_date` datetime NOT NULL DEFAULT current_timestamp()    
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (    
    `Chat_id` int(11) NOT NULL,    
    `Chat_type` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
    `Username` varchar(300) COLLATE utf8_spanish_ci,
    `Chat_title` varchar(100) COLLATE utf8_spanish_ci,    
    `Active` BOOLEAN    
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `aviability`
    ADD PRIMARY KEY (`ID`),
    MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `history_of_back_to_stock`
    ADD PRIMARY KEY (`ID`),
    MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `chats`
    ADD PRIMARY KEY (`Chat_id`);

INSERT INTO aviability(Chip,Model,Supplier,Link,On_stock,notified) 
VALUES('RTX3060','ZOTAC Gaming GeForce RTX 3060 Twin Edge OC','Amazon-US','https://amzn.to/3zM6Jnx', false, false),
        ('RTX3060','ASUS TUF Gaming NVIDIA GeForce RTX 3060 OC','Amazon-US','https://amzn.to/35HxKdD', false, false),
        ('RTX3060','ASUS ROG Strix NVIDIA GeForce RTX 3060 OC','Amazon-US','https://amzn.to/3cV3zUm', false, false),
        ('RTX3060','EVGA GeForce RTX 3060 XC','Amazon-US','https://amzn.to/3wEelGE', false, false),
        ('RTX3060ti','ASUS TUF Gaming NVIDIA GeForce RTX 3060 Ti OC','Amazon-US','https://amzn.to/3gHHlX3', false, false),
        ('RTX3060ti','ASUS ROG STRIX NVIDIA GeForce RTX 3060 Ti OC','Amazon-US','https://amzn.to/3iSeouj', false, false),
        ('RTX3060ti','PNY GeForce RTX 3060 Ti','Amazon-US','https://amzn.to/3cStHze', false, false),
        ('RX6700XT','PowerColor Red Devil AMD Radeon RX 6700 XT','Amazon-US','https://amzn.to/2SBPswz', false, false),
        ('RX6700XT','PowerColor Hellhound AMD Radeon RX 6700 XT','Amazon-US','https://amzn.to/3iQYS1K', false, false),
        ('RX6700XT','Gigabyte Radeon RX 6700 XT Gaming OC','Amazon-US','https://amzn.to/3wFEbtP', false, false),
        ('RX6700XT','MSI Gaming Radeon RX 6700 XT','Amazon-US','https://amzn.to/3wHQntX', false, false),
        ('RX6700XT','AMD Radeon™ RX 6700 XT Graphics','AMD-US','https://www.amd.com/en/direct-buy/5496921400/us', false, false),
        ('RX6700XT','AMD Radeon™ RX 6700 XT Graphics','AMD-VE','https://www.amd.com/en/direct-buy/5496921400/ve', false, false),
        ('RX6800','PowerColor Red Dragon AMD Radeon RX 6800','Amazon-US','https://amzn.to/35xWvJd', false, false),
        ('RX6800','ASUS TUF Gaming AMD Radeon RX 6800 OC','Amazon-US','https://amzn.to/3xym4py', false, false),
        ('RX6800','AMD Radeon™ RX 6800 Graphics','AMD-US','https://www.amd.com/en/direct-buy/5458373400/us', false, false),
        ('RX6800','AMD Radeon™ RX 6800 Graphics','AMD-VE','https://www.amd.com/en/direct-buy/5458373400/ve', false, false),
        ('RX6800XT','XFX Speedster MERC319 AMD Radeon RX 6800 XT ','Amazon-US','https://amzn.to/3xwbFuz', false, false), 
        ('RX6800XT','AORUS Radeon RX 6800 XT Master','Amazon-US','https://amzn.to/3cS9RnS', false, false),
        ('RX6800XT','PowerColor Red Devil AMD Radeon RX 6800 XT','Amazon-US','https://amzn.to/3vKKsDm', false, false),
        ('RX6800XT','AMD Radeon™ RX 6800 XT Midnight Black Graphics Card','AMD-US','https://www.amd.com/en/direct-buy/5496921500/us', false, false),
        ('RX6800XT','AMD Radeon™ RX 6800 XT Midnight Black Graphics Card','AMD-VE','https://www.amd.com/en/direct-buy/5496921500/ve', false, false),
        ('RX6900XT','PowerColor Red Devil AMD Radeon RX 6900 XT','Amazon-US','https://amzn.to/3gFkBII', false, false),
        ('RX6900XT','ASUS TUF Gaming AMD Radeon RX 6900 XT OC','Amazon-US','https://amzn.to/2SDSDns', false, false),
        ('RX9800XT','AMD Radeon™ RX 6900 XT Graphics','AMD-US','https://www.amd.com/en/direct-buy/5458372200/us', false, false),
        ('RX9800XT','AMD Radeon™ RX 6900 XT Graphics','AMD-VE','https://www.amd.com/en/direct-buy/5458372200/ve', false, false);