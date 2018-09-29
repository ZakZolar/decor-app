Create Database DecorProfessional
Create table ProductProfessional
(
ProductID int Not Null Primary Key Identity (1,1),
ProductName NVarchar(150) Not Null,
Price Money Not Null,
PicUrl NVarchar (MAX) Not Null
)