-- tạo csdl QTBStore
create database QTBStore
go

-- sử dụng csdl QTBStore vừa tạo
use QTBStore
go

-- bảng quản trị viên lưu thông tin người quản trị
create table Admins (
	AdminId int not null primary key identity, -- khoá chính
	AdminEmail varchar(250) not null unique, -- email đăng nhập
	AdminPassword varchar(128) not null, -- mật khẩu đăng nhập
	AdminFullName nvarchar(250) not null, -- họ và tên người quản trị
	AdminBirthday date not null default getdate(), -- ngày tháng năm sinh
	AdminIdCard varchar(20) not null unique, -- chứng minh nhân dân
	AdminGender int not null default 1, -- giới tính
	AdminAddress ntext not null, -- địa chỉ
	AdminHomeLand ntext not null, -- quê quán
	AdminPhone varchar(20) not null unique, -- số điện thoại
	AdminAvatar varchar(250) not null unique, -- ảnh đại diện
	AdminStatus int not null default 1 -- trạng thái
)
go

-- bảng khách hàng
create table Customers (
	CustomerId int not null primary key identity, -- khoá chính
	CustomerFullName nvarchar(250) not null, -- họ và tên khách hàng
	CustomerEmail varchar(250) not null unique, -- email để đăng nhập
	CustomerPhone varchar(20) null unique, -- số điện thoại
	CustomerPassword varchar(128) not null, -- mật khẩu
	CustomerAvatar varchar(250) not null, -- ảnh đại diện
	CustomerGender int not null default 1, -- giới tính
	CustomerBirthday date not null default getdate(), -- ngày sinh
	CustomerAddress ntext not null, -- địa chỉ
	CustomerCheckCode varchar(20), -- mã kiểm tra
	CustomerStatus int not null default 1 -- trạng thái
)
go

-- bảng danh mục sản phẩm lưu thông tin danh mục sản phẩm
create table Categories (
	CategoryId int not null primary key identity, -- khoá chính
	CategoryName nvarchar(250) not null unique, -- tên danh mục
	CategoryPiority int not null, -- độ ưu tiên của danh mục
	ParentId int not null default 0, -- khoá ngoại danh mục cha (đệ quy)
	ParentName nvarchar(250) not null, -- tên danh mục cha
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	CategoryStatus int not null default 1 -- trạng thái
)
go

-- bảng hãng sản xuất
create table Brands (
	BrandId int not null primary key identity, -- khoá chính
	BrandName nvarchar(250) not null unique, -- tên hãng
	BrandPiority int not null, -- độ ưu tiên của hãng
	BrandLogo varchar(250) not null unique, -- logo của hãng
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	BrandStatus int not null default 1 -- trạng thái
)
go

-- bảng sản phẩm lưu thông tin tên sản phẩm, danh mục và hãng sản xuất
create table Products (
	ProductId int not null primary key identity, -- khoá chính
	ProductName nvarchar(250) not null unique, -- tên sản phẩm
	ProductCode varchar(50) not null, -- mã hiệu sản phẩm
	ProductStarAvg float not null default 5, -- số sao trung bình của sản phẩm (sao được đánh giá) - mặc định là 5 sao, cộng trung bình với các đánh giá khác để ra cái này
	ProductFeatureImage varchar(250) not null, -- hình ảnh sản phẩm
	ProductPrice float not null default 0, -- giá sản phẩm
	ProductSale int not null default 0, -- phần trăm hạ giá
	ProductWarranty int not null default 0, -- thời gian bảo hành (tính theo tháng)
	ProductSaleQuantity int not null default 0, -- số sản phẩm đã bán
	ProductDescription ntext not null default N'Đang cập nhật', -- mô tả sản phẩm
	SpecificationValue nvarchar(1000) not null, -- giá trị thông số kỹ thuật
	CategoryId int not null foreign key references Categories(CategoryId), -- khoá ngoại mã danh mục
	BrandId int not null foreign key references Brands(BrandId), -- khoá ngoại mã hãng sản xuất
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	ProductStatus int not null default 1 -- trạng thái
)
go

-- bảng hình ảnh sản phẩm
create table ProductImages (
	ProductImageId int not null primary key identity, -- khoá chính
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm
	ProductImage varchar(250) not null unique, -- hình ảnh sản phẩm
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	ProductImageStatus int not null default 1 -- trạng thái
)
go

-- bảng bình luận (đánh giá) sản phẩm (bắt buộc đăng nhập mới được đánh giá)
create table ProductComments (
	ProductCommentId int not null primary key identity, -- khoá chính
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm được đánh giá
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã khách hàng đánh giá
	ProductCommentRate int not null default 5, -- đánh giá (số sao)
	ProductCommentContent nvarchar(500) null, -- bình luận (tối đa 500 kí tự)
	ProductCommentTime datetime not null default getdate(), -- ngày giờ đánh giá
	ProductCommentStatus int not null default 1 -- trạng thái
)
go

-- bảng các danh sách yêu thích
create table Wishlists (
	WishlistId int not null primary key identity, -- khoá chính
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã khách hàng
	ProductId int not null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm được yêu thích
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	WishlistStatus int not null default 1 -- trạng thái
)
go

-- bảng danh mục tin tức
create table Catalogs (
	CatalogId int not null primary key identity, -- khoá chính
	CatalogName nvarchar(250) not null unique, -- tên danh mục tin tức
	CatalogPiority int not null, -- độ ưu tiên
	ParentId int not null default 0, -- danh mục cha (đệ quy)
	ParentName nvarchar(250) not null, -- tên danh mục cha
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	CatalogStatus int not null default 1 -- trạng thái
)
go

-- bảng tin tức
create table News (
	[NewId] int not null primary key identity, -- khoá chính
	CatalogId int not null foreign key references Catalogs(CatalogId), -- khoá ngoại mã danh mục tin tức
	NewTitle nvarchar(250) not null unique, -- tiêu đề tin tức
	NewImage varchar(250) not null unique, -- hình ảnh đại diện cho tin tức
	NewDescription nvarchar(250) not null, -- mô tả tin tức
	NewContent ntext not null, -- nội dung tin tức
	NewLike int not null default 0, -- số lượt thích
	NewViewed int not null default 0, -- số lượt xem
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	NewStatus int not null default 1 -- trạng thái
)
go

-- bảng banner
create table Banners (
	BannerId int not null primary key identity, -- khoá chính
	BannerPiority int not null, -- độ ưu tiên của banner
	BannerImage varchar(250) not null unique, -- hình ảnh banner
	BannerDescription nvarchar(250) not null, -- mô tả banner (xuất hiện trong backend)	
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	BannerStatus int not null default 1
)
go

-- bảng đơn hàng
create table Orders (
	OrderId int not null primary key identity, -- khoá chính
	CustomerId int not null foreign key references Customers(CustomerId), -- khoá ngoại mã người đặt hàng
	OrderTotalAmount float not null default 0, -- tổng tiền thanh toán
	TransportName nvarchar(250) not null , -- phương thức vận chuyển
	PaymentMethodName nvarchar(250) not null , --  phương thức thanh toán
	OrderNote ntext null, -- ghi chú đơn hàng
	OrderAddress ntext null, -- địa chỉ nhận hàng
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	OrderStatus int not null default 1 -- trạng thái đơn hàng
)
go

-- bảng chi tiết đơn hàng
create table OrderDetails (
	OrderDetailId int not null primary key identity, -- khoá chính
	OrderId int not null foreign key references Orders(OrderId), -- khoá ngoại mã đơn hàng
	ProductId int null foreign key references Products(ProductId), -- khoá ngoại mã sản phẩm (1 trong 2 khoá ngoại này)
	OrderDetailQuantity int not null default 1, -- số lượng sản phẩm
	OrderDetailPrice float not null default 0, -- giá sản phẩm tại thời điểm đặt hàng
	OrderDetailSale int not null default 0, -- mức hạ giá sản phẩm tại thời điểm đặt hàng	
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	OrderDetailStatus int not null default 1 -- trạng thái
)
go

-- bảng logo
create table Logoes (
	LogoId int not null primary key identity, -- khoá chính
	LogoImage varchar(250) not null unique, -- hình ảnh logo
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	LogoStatus int not null default 1 -- trạng thái
)
go

-- bảng danh mục phản hồi
create table FeedbackCatalogs (
	FeedbackCatalogId int not null primary key identity, -- khoá chính
	FeedbackCatalogName nvarchar(250) not null unique, -- tên danh mục phản hồi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	FeedbackCatalogStatus int not null default 1 -- trạng thái
)
go

-- bảng phản hồi
create table Feedbacks (
	FeedbackId int not null primary key identity, -- khoá chính
	FeedbackCatalogId int not null foreign key references FeedbackCatalogs(FeedbackCatalogId), -- khoá ngoại danh mục phản hồi
	FeedbackFullname nvarchar(250) null, -- họ tên người phản hồi
	FeedbackPhone varchar(20) null, -- số điện thoại người phản hồi
	FeedbackEmail varchar(250) null, -- email người phản hồi
	FeedbackAddress ntext null, -- địa chỉ người phản hồi
	FeedbackContent ntext not null, -- nội dung phản hồi
	FeedbacksTime datetime not null default getdate(), -- thời gian phản hồi
	FeedbackStatus int not null default 1 -- trạng thái
)
go

-- bảng giới thiệu
create table Introductions (
	IntroductionId int not null primary key identity, -- khoá chính
	IntroductionContent ntext not null, -- nội dung giới thiệu
	AdminId int not null foreign key references Admins(AdminId), -- khoá ngoại quản trị viên thêm hoặc sửa bản ghi
	CreatedDate datetime not null default getdate(), -- ngày tạo bản ghi
	UpdatedDate datetime not null default getdate(), -- ngày cập nhật bản ghi
	IntroductionStatus int not null default 1 -- trạng thái
)
go
