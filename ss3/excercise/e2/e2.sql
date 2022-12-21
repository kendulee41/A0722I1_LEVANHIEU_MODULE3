create database quanlybanhang;
use quanlybanhang;
create table Customer (
cID int primary key not null,
cName varchar(50) not null,
cAge int default 0
);
create table Orders (
oID int primary key not null,
cID int not null,
FOREIGN KEY (cID) REFERENCES Customer(cID),
oDate datetime not null,
oTotalPrice double
);
create table Product (
pID int primary key not null,
pName varchar(100) not null,
pPrice double not null
);
create table OrderDetail (
   oID INT NOT NULL,
   pID INT NOT NULL,
   PRIMARY KEY(oID,pID),
   FOREIGN KEY(oID) REFERENCES Orders(oID),
   FOREIGN KEY(pID) REFERENCES Product(pID),
   odQTY int not null
);
INSERT INTO customer (cID, cName, cAge)
VALUE 
	(1, "MinhQuan", 10),
    (2, 'NgocOanh', 20),
    (3, 'HongHa', 50);
INSERT INTO orders (oID, cID, oDate, oTotalPrice)
VALUE 
	(1, 1, 3/21/2006, null),
    (2, 2, 3/21/2006, null),
    (3, 1, 3/21/2006, null);
INSERT INTO product (pID, pName, pPrice)
VALUE 
	(1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);
INSERT INTO orderdetail (oID, pID, odQTY)
VALUE 
	(1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice
from orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cName,product.pName
from orderdetail join orders join customer join product
on orderdetail.oID = orders.oID and orderdetail.pID = product.pID and orders.cID = customer.cID
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT orders.oID AS'Mã hóa đơn', orders.oDate AS'Ngày mua', sum(product.pPrice*orderdetail.odQTY) AS'Tổng tiền' FROM orders
INNER JOIN orderdetail ON orderdetail.oID = orders.oID
INNER JOIN product ON product.pID = orderdetail.pID
GROUP BY orders.oID;
    